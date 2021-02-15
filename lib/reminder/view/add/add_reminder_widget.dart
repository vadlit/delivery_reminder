import 'package:delivery_reminder/common/view/controls/button_widget.dart';
import 'package:delivery_reminder/common/view/controls/date_input_widget.dart';
import 'package:delivery_reminder/common/view/controls/dr_popup_header.dart';
import 'package:delivery_reminder/common/view/controls/error_pad_widget.dart';
import 'package:delivery_reminder/common/view/controls/form_input.dart';
import 'package:delivery_reminder/common/view/controls/text_input_widget.dart';
import 'package:delivery_reminder/common/view/dr_form.dart';
import 'package:delivery_reminder/common/view/navigation/navigation_utils.dart';
import 'package:delivery_reminder/common/view/theme.dart';
import 'package:delivery_reminder/common/dart/call_extensions.dart';
import 'package:delivery_reminder/reminder/service/reminder_repository.dart';
import 'package:delivery_reminder/reminder/state_management/add_reminder_store.dart';
import 'package:delivery_reminder/reminder/state_management/reminder_list_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

void showAddReminderPopup(BuildContext context) => showDrPopup(context, child: AddReminderWidget(), providers: [
      Provider(
        create: (ctx) => AddReminderStore.create(
            repository: ctx.read<ReminderRepository>(), listStore: ctx.read<ReminderListStore>()),
      )
    ]);

class AddReminderWidget extends StatelessWidget {
  static const titleFieldName = 'Заголовок *';
  static const tillFieldName = 'Когда напомнить *';
  static const submitButtonName = 'Добавить';
  static const emptyFieldError = 'Поле не может быть пустым';

  const AddReminderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        DrPopupHeader(title: 'Добавление напоминания'),
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
        final addReminderStore = context.watch<AddReminderStore>();
        final formWidgets = <Widget>[
          TextInputWidget(
            position: FormInputPosition.top,
            helperText: titleFieldName,
            onSave: addReminderStore.setTitle,
            validationError: addReminderStore.titleError?.let((it) {
              switch (it) {
                case TitleError.empty:
                  return emptyFieldError;
              }
              return null;
            }),
            nextFieldFocusScope: focusScope,
          ),
          DateInputWidget(
            position: FormInputPosition.middle,
            helperText: tillFieldName,
            value: addReminderStore.till,
            onSave: addReminderStore.setTill,
            validationError: addReminderStore.tillError?.let((it) {
              switch (it) {
                case TillError.empty:
                  return emptyFieldError;
              }
              return null;
            }),
            nextFieldFocusScope: focusScope,
          ),
          TextInputWidget(
            position: FormInputPosition.middle,
            helperText: 'Трэк-номер',
            onSave: addReminderStore.setTrackNumber,
            nextFieldFocusScope: focusScope,
          ),
          TextInputWidget(
            position: FormInputPosition.bottom,
            helperText: 'Комментарий',
            onSave: addReminderStore.setDescription,
            nextFieldFocusScope: null,
            onFormSubmitted: (_) => _submit(addReminderStore),
          ),
        ];

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

        formWidgets.add(Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.fromLTRB(0, DrSizes.screenPaddingStandard, 0, 0),
                  child: ButtonWidget(
                      onTap: addReminderStore.canSubmit ? () => _submit(addReminderStore) : null,
                      title: submitButtonName,
                      type: DrButtonStyle.alert)),
            ],
          ),
        ));

        return Column(children: formWidgets);
      });
    });
  }

  void _submit(AddReminderStore store) async {
    final bool succeeded = await store.submit();
    if (succeeded) {
      rootNavigatorKey.currentState.pop();
    }
  }
}
