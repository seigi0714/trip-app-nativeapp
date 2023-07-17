import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';

/// * [dateTimeNotifier] 選択した日時で呼び出し元の Widget をリビルドするための ValueNotifier。
/// useState<DateTime>() が渡されることを想定している。
///
/// * [isSelectedNotifier] 日時が選択されたか否かのフラグによって、
/// 呼び出し元の Widget をリビルドするためのValueNotifier。
/// useState<bool>() が渡されることを想定している。
///
/// * [minTime] DatePicker で選択可能な最小の日付。
///
/// * [maxTime] DatePicker で選択可能な最大の日付。
Future<DateTime?> showTripAppDatePicker(
  BuildContext context, {
  required ValueNotifier<DateTime> dateTimeNotifier,
  ValueNotifier<bool>? isSelectedNotifier,
  DateTime? minTime,
  DateTime? maxTime,
}) async {
  // 完了ボタンが押されなくても、変更した日時を返すようにする。
  DateTime? result;
  await DatePicker.showDatePicker(
    context,
    maxTime: maxTime,
    minTime: minTime,
    onChanged: (date) {
      result = date;
      isSelectedNotifier?.value = true;
      dateTimeNotifier.value = date;
    },
    onConfirm: (date) {
      result = date;
      isSelectedNotifier?.value = true;
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
  return result;
}
