import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';

/// * [currentTime] DatePicker で初期表示する日時。
///
/// * [minTime] DatePicker で選択可能な最小の日付。
///
/// * [maxTime] DatePicker で選択可能な最大の日付。
///
/// 完了ボタンが押されなくても [DatePicker] で選択された日時を返す。
Future<DateTime?> showTripAppDatePicker(
  BuildContext context, {
  DateTime? currentTime,
  DateTime? minTime,
  DateTime? maxTime,
}) async {
  DateTime? result;
  await DatePicker.showDatePicker(
    context,
    currentTime: currentTime,
    maxTime: maxTime,
    minTime: minTime,
    onChanged: (date) => result = date,
    onConfirm: (date) => result = date,
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
