import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';

Future<DateTime?> showTripAppDatePicker(
  BuildContext context, {
  /// DatePicker で選択された日付を通知するための ValueNotifier
  /// useState<DateTime>() が渡されることを想定。
  required ValueNotifier<DateTime> dateTimeNotifier,

  /// DatePicker で日付が選択されたか否かを通知するための ValueNotifier
  /// useState<bool>() が渡されることを想定。
  required ValueNotifier<bool> isSelectedNotifier,
}) {
  return DatePicker.showDatePicker(
    context,
    minTime: DateTime.now(),
    onConfirm: (date) {
      isSelectedNotifier.value = true;
      dateTimeNotifier.value = date;
    },
    currentTime: dateTimeNotifier.value,
    locale: LocaleType.jp,
    theme: DatePickerTheme(
      backgroundColor: context.theme.colorScheme.onPrimary,
      itemStyle: context.textTheme.titleLarge!,
      doneStyle: context.textTheme.titleMedium!.copyWith(
        color: context.theme.colorScheme.primary,
      ),
      cancelStyle: context.textTheme.titleMedium!.copyWith(
        color: context.theme.colorScheme.inverseSurface,
      ),
    ),
  );
}
