import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/view/widgets/helpers/scaffold_messenger.dart';

/// 入力の最大長を制限し、入力が最大長を超えた場合に SnackBar を表示する[TextInputFormatter]。
///
/// このフォーマッターは、入力を最大長に収まるように切り詰め、
/// 入力が最大長を超えた場合には SnackBar でメッセージを表示する。
///
/// [maxLength] は入力の最大長。
///
/// [ref] は [scaffoldMessengerHelperProvider]にアクセスするために使用。
///
/// このクラスの使用例は以下の通りです：
///
/// ```dart
/// final myFormatter = MaxLengthInputFormatterWithSnackBar(ref, 25);
/// final myTextField = TextField(inputFormatters: [myFormatter]);
/// ```
class MaxLengthInputFormatterWithSnackBar
    extends LengthLimitingTextInputFormatter {
  MaxLengthInputFormatterWithSnackBar(
    this.ref,
    super.max,
  );

  final WidgetRef ref;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final result = super.formatEditUpdate(oldValue, newValue);
    if (newValue.text.length > maxLength!) {
      ref
          .read(scaffoldMessengerHelperProvider)
          .showSnackBar('旅のタイトルは25文字以下でお願いします🙏');
    }
    return result;
  }
}
