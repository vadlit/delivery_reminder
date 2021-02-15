import 'package:delivery_reminder/common/dart/string_extensions.dart';
import 'package:delivery_reminder/common/view/tag_widget.dart';
import 'package:delivery_reminder/common/view/theme.dart';
import 'package:delivery_reminder/reminder/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class DeliveryWidget extends StatelessWidget {
  static final _itemRounding = BorderRadius.circular(DrSizes.listItemRounding);

  final Delivery delivery;

  DeliveryWidget({Key key, @required this.delivery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // do nothing
      },
      child: Container(
        decoration: BoxDecoration(gradient: _buildGradient(), borderRadius: _itemRounding),
        child: Container(
            padding: const EdgeInsets.fromLTRB(DrSizes.listItemPaddingLeft, DrSizes.listItemPaddingVertical,
                DrSizes.listItemPaddingRight, DrSizes.listItemPaddingVertical),
            decoration: BoxDecoration(color: DrColors.inputRegular, borderRadius: _itemRounding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [_buildBody(), _buildFooter(context)],
            )),
      ),
    );
  }

  Widget _buildBody() {
    final content = <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 1, 0, 5),
              padding: const EdgeInsets.fromLTRB(0, 0, 33, 0),
              child: Text(delivery.reminder.headers.title, style: DrTextStyles.bodyBold),
            ),
          ),
          delivery.reminder.map(
              waiting: (it) => TagWidget(text: delivery.status?.capitalize() ?? it.stage.toText()),
              archived: (_) => Container())
        ],
      ),
    ];
    if (delivery.reminder.headers.description != null) {
      content.add(Text(delivery.reminder.headers.description, style: DrTextStyles.footnote));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: content,
    );
  }

  Widget _buildFooter(BuildContext context) {
    final String languageCode = context.languageCode;

    return Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
            top: BorderSide(width: 0.5, color: DrColors.textPrimaryOpacity02),
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: delivery.reminder.map(waiting: (it) {
              TextStyle textStyle;
              switch (it.stage) {
                case Stage.delivery:
                  textStyle = DrTextStyles.sfProTextPrimary;
                  break;
                case Stage.test:
                  textStyle = DrTextStyles.sfProTextError;
                  break;
              }
              final formatter = DateFormat.MMMd(languageCode);
              return Text('Жду до ${formatter.format(it.till)}', style: textStyle);
            }, archived: (it) {
              final formatter = DateFormat.yMMMd(languageCode);
              return Text('Убрано в архив ${formatter.format(it.archivedAt)}',
                  style: DrTextStyles.sfProTextRegularOpacity04);
            }),
          ),
        ));
  }

  LinearGradient _buildGradient() {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: delivery.reminder.map(
          waiting: (it) {
            switch (it.stage) {
              case Stage.delivery:
                return [
                  DrColors.deliveryCardGradientStart,
                  DrColors.deliveryCardGradientEnd,
                ];
              case Stage.test:
                return [
                  DrColors.testCardGradientStart,
                  DrColors.testCardGradientEnd,
                ];
            }
            return null;
          },
          archived: (it) => [
                DrColors.archivedCardGradientStart,
                DrColors.archivedCardGradientEnd,
              ]),
    );
  }
}
