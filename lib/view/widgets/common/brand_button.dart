import 'package:flutter/material.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';

/// 先頭にブランドロゴを持つボタン
/// ログインボタンなどに使用する。
class BrandButton extends StatelessWidget {
  const BrandButton({
    required this.label,
    required this.brandLogo,
    required this.onPressed,
    required this.backgroundColor,
    this.labelColor,
    super.key,
  });

  final String label;
  final Color? labelColor;
  final Widget brandLogo;
  final VoidCallback onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.displaySize.height * 0.08,
      width: context.displaySize.width * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            const Spacer(flex: 2),
            brandLogo,
            const Spacer(),
            Text(
              label,
              style: context.responsiveBodyTextStyle?.copyWith(
                color: labelColor ?? Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
