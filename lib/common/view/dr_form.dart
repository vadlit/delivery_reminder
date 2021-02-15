import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'theme.dart';

//typedef FormValidator = bool Function({bool isOnSubmit});
typedef FormWidgetsBuilder = Widget Function(FocusScopeNode focusScope/*, FormValidator validator*/);

class DrForm extends StatefulWidget {
  final FormWidgetsBuilder builder;
  /*final VoidCallback onChange;*/

  const DrForm({
    Key key,
    @required this.builder,
    //this.onChange,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<DrForm> {
  FocusScopeNode _focusScope;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _focusScope = FocusScopeNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusScope.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: DrColors.bgLight,
        child: Form(
          key: _formKey,
          //onChanged: () => widget.onChange(),
          onChanged: () {
            final FormState formState = _formKey.currentState;
            if (formState == null) {
              return;
            }
            formState.save();
            formState.validate();
          },
          child: FocusScope(
            node: _focusScope,
            child: widget.builder(_focusScope/*, _validate*/),
          ),
        ));
  }

  /*static void validate(BuildContext context, {bool isOnSubmit}) {
    final FormState formState = Form.of(context);
    *//*if (_formKey.currentState == null) {
      // the form is being building for the first time
      return;
    }*//*

    if (isOnSubmit) {
      formState.save();
    }
    if (formState.validate()) {
      if (isOnSubmit) {
        FocusScope.of(context).unfocus();
      }
      return;
    }

    if (isOnSubmit) {
      //setState(() {}); // to disable submit button
      FocusScope.of(context).unfocus();
    }
  }*/

  /*bool _validate({bool isOnSubmit}) {
    final FormState formState = Form.of(context);
    *//*if (_formKey.currentState == null) {
      // the form is being building for the first time
      return true;
    }*//*

    if (isOnSubmit) {
      formState.save();
    }
    if (formState.validate()) {
      if (isOnSubmit) {
        FocusScope.of(context).unfocus();
      }
      return true;
    }

    if (isOnSubmit) {
      setState(() {}); // to disable submit button
      FocusScope.of(context).unfocus();
    }
    return false;
  }*/
}
