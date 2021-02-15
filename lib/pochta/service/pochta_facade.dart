import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:xml/xml.dart';

import 'package:http/http.dart' as http;

Future<String> getTrackStatus(String trackNumber) async {
  final pochta = PochtaFacade();
  try {
    return pochta.getTrackStatus(trackNumber);
  } finally {
    pochta.dispose();
  }
}

class PochtaFacade {
  static const _login = 'iySmqUwoCgVXne';
  static const _password = 'fYjDjrvDnNPd';

  static const _headers = {
    'content-type': 'application/soap+xml;charset=utf-8',
  };

  final _logger = Logger();

  final http.Client _client = http.Client();

  void dispose() {
    _client.close();
  }

  Future<String> getTrackStatus(String trackNumber) async {
    //return 'временно выключено';
    final String operationHistory = await _getOperationHistory(trackNumber);
    if (operationHistory == null) {
      return null;
    }

    final _LastOperationStatus status = _findLastOperationStatus(operationHistory);
    if (status == null) {
      return null;
    }

    if (status.name == 'единичный') {
      if (status.isTheOnly) {
        return 'отправлено';
      }
      return 'получено';
    }

    return status.name;
  }

  Future<String> _getOperationHistory(String trackNumber) async {
    String soap = '''<?xml version="1.0"?>
<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope"
                 xmlns:oper="http://russianpost.org/operationhistory"
                 xmlns:data="http://russianpost.org/operationhistory/data"
                 xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
<soap:Header/>
<soap:Body>
  <oper:getOperationHistory>
     <data:OperationHistoryRequest>
        <data:Barcode>$trackNumber</data:Barcode>
        <data:MessageType>0</data:MessageType>
        <data:Language>RUS</data:Language>
     </data:OperationHistoryRequest>
     <data:AuthorizationHeader soapenv:mustUnderstand="1">
        <data:login>$_login</data:login>
        <data:password>$_password</data:password>
     </data:AuthorizationHeader>
  </oper:getOperationHistory>
</soap:Body>
</soap:Envelope>''';

    http.Response response;
    try {
      response = await _client.post(
        'https://tracking.russianpost.ru/rtm34',
        headers: _headers,
        body: utf8.encode(soap),
      );
    } catch (e) {
      _logger.w('Could not request pochta status with request $soap', e);
      return null;
    }

    if (response.statusCode != HttpStatus.ok) {
      _logger.i('Unknown pochta status ${response.statusCode} with request $soap');
      return null;
    }

    return response.body;
  }

  _LastOperationStatus _findLastOperationStatus(String operationHistory) {
    bool isTheOnlyStatus;
    String status;
    try {
      final xmlDocument = XmlDocument.parse(operationHistory);
      final operationAttributes = xmlDocument.findAllElements('ns3:OperAttr');
      for (var operationAttribute in operationAttributes) {
        final operationNames = operationAttribute.findElements('ns3:Name');
        for (var operationName in operationNames) {
          status = operationName.innerText;
          if (isTheOnlyStatus == null) {
            isTheOnlyStatus = true;
          } else {
            isTheOnlyStatus = false;
          }
        }
      }
    } catch (e) {
      _logger.w('Could not parse pochta status: $operationHistory', e);
      return null;
    }
    if (status == null) {
      _logger.w('Empty pochta status: $operationHistory');
      return null;
    }

    return _LastOperationStatus(status.toLowerCase(), isTheOnlyStatus);
  }
}

class _LastOperationStatus {
  final String name;
  final bool isTheOnly;

  _LastOperationStatus(this.name, this.isTheOnly);
}
