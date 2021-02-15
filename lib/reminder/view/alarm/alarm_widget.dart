import 'package:delivery_reminder/common/view/controls/button_widget.dart';
import 'package:delivery_reminder/common/view/controls/date_input_widget.dart';
import 'package:delivery_reminder/common/view/controls/dr_popup_header.dart';
import 'package:delivery_reminder/common/view/controls/error_pad_widget.dart';
import 'package:delivery_reminder/common/view/controls/form_input.dart';
import 'package:delivery_reminder/common/view/controls/in_progress/in_progress_widget.dart';
import 'package:delivery_reminder/common/view/controls/text_input_widget.dart';
import 'package:delivery_reminder/common/view/dr_form.dart';
import 'package:delivery_reminder/common/view/navigation/navigation_utils.dart';
import 'package:delivery_reminder/common/view/theme.dart';
import 'package:delivery_reminder/common/dart/call_extensions.dart';
import 'package:delivery_reminder/common/dart/string_extensions.dart';
import 'package:delivery_reminder/pochta/service/pochta_facade.dart';
import 'package:delivery_reminder/reminder/service/reminder_repository.dart';
import 'package:delivery_reminder/reminder/state_management/alarm_store.dart';
import 'package:delivery_reminder/reminder/state_management/reminder_list_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

void showAlarmPopup(BuildContext context, String reminderId) => showDrPopup(context, child: AlarmWidget(), providers: [
      Provider(
        create: (ctx) => AlarmStore.create(
            reminderId: reminderId,
            repository: ctx.read<ReminderRepository>(),
            listStore: ctx.read<ReminderListStore>()),
      )
    ]);

class AlarmWidget extends StatelessWidget {
  static const archiveButtonName = 'Убрать в архив';

  AlarmWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return DrPopupScrollable(
        header: DrPopupHeader(title: 'Напоминание'),
        builder: (scrollableContext, parentScrollController) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [_buildContent()],
            ));
*/
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        DrPopupHeader(title: 'Напоминание'),
        Expanded(
            child: Container(
                color: DrColors.bgLight,
                padding: const EdgeInsets.fromLTRB(
                    DrSizes.screenPaddingStandard, 10.5, DrSizes.screenPaddingStandard, DrSizes.screenPaddingStandard),
                child: _buildContent())),
      ]),
    );
  }

  Widget _buildContent() {
    return DrForm(builder: (focusScope /*, validator*/) {
      return Observer(builder: (context) {
        final addReminderStore = context.watch<AlarmStore>();
        List<Widget> formWidgets = [
          TextInputWidget(
            isReadOnly: true,
            position: FormInputPosition.top,
            helperText: 'Заголовок *',
            value: addReminderStore.title,
            onSave: addReminderStore.setTitle,
            validationError: addReminderStore.titleError?.let((it) {
              switch (it) {
                case TitleError.empty:
                  return 'Поле не может быть пустым';
              }
              return null;
            }),
            nextFieldFocusScope: focusScope,
          ),
          DateInputWidget(
            position: FormInputPosition.middle,
            helperText: 'Когда напомнить *',
            value: addReminderStore.till,
            onSave: addReminderStore.setTill,
            validationError: addReminderStore.tillError?.let((it) {
              switch (it) {
                case TillError.empty:
                  return 'Поле не может быть пустым';
              }
              return null;
            }),
            nextFieldFocusScope: focusScope,
          ),
          TextInputWidget(
            isReadOnly: true,
            position: FormInputPosition.middle,
            helperText: 'Трэк-номер',
            value: addReminderStore.trackNumber,
            onSave: addReminderStore.setTrackNumber,
            nextFieldFocusScope: focusScope,
          ),
          TextInputWidget(
            isReadOnly: true,
            position: FormInputPosition.bottom,
            helperText: 'Комментарий',
            value: addReminderStore.description,
            onSave: addReminderStore.setDescription,
            nextFieldFocusScope: null,
          ),
        ];

        if (addReminderStore.trackNumber.value != null) {
          formWidgets.add(_buildTrackStatus(context, addReminderStore));
        }

        addReminderStore.processState.when(
            ready: () {},
            processing: () {},
            error: (reason) {
              formWidgets.add(Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ErrorPadWidget(text: reason ?? 'Что-то пошло не так. Попробуйте позже'),
                  ),
                ],
              ));
            });

        formWidgets.addAll(
          [
            Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.fromLTRB(0, DrSizes.screenPaddingStandard, 0, 0),
                child: ButtonWidget(
                    onTap: () => _postpone(addReminderStore),
                    title: 'Напомнить через час',
                    type: DrButtonStyle.primaryDim)),
            Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.fromLTRB(0, DrSizes.screenPaddingStandard, 0, 0),
                child: ButtonWidget(
                    onTap: addReminderStore.canSubmit ? () => _archive(addReminderStore) : null,
                    title: archiveButtonName,
                    type: DrButtonStyle.alert)),
          ],
        );

        return ListView(children: formWidgets);
      });
    });
  }

  Padding _buildTrackStatus(BuildContext context, AlarmStore addReminderStore) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DrSizes.screenPaddingStandard),
      child: FutureBuilder(
          future:
              // WARNING: it would be much better to encapsulate the logic in the Store,
              // but I have to implement it using FutureBuilder to demonstrate a FutureBuilder
              // in the project
              Provider.of<PochtaFacade>(context).getTrackStatus(addReminderStore.trackNumber.value),
          builder: (context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return InProgressWidget();
            }
            if (snapshot.hasError) {
              return ErrorPadWidget(text: 'Не удалось получить данные по трэк-номеру');
            }
            if (!snapshot.hasData) {
              return ErrorPadWidget(text: 'Указанный трэк-номер не существует');
            }
            final String status = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: DrSizes.screenPaddingStandard),
                    child: Text('Статус по трэк-номеру: ${status.capitalize()}', style: DrTextStyles.footnote)),
              ],
            );
          }),
    );
  }

  void _postpone(AlarmStore store) async {
    final bool succeeded = await store.postpone();
    if (succeeded) {
      rootNavigatorKey.currentState.pop();
    }
  }

  void _archive(AlarmStore store) async {
    final bool succeeded = await store.archive();
    if (succeeded) {
      rootNavigatorKey.currentState.pop();
    }
  }
}
