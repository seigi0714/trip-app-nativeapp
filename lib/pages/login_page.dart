import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/utils/extensions/build_context.dart';

import '../gen/assets.gen.dart';
import '../utils/constants/color.dart';
import '../widgets/brand_button.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  static const path = '/login';
  static const name = 'LoginPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BrandButton(
              label: 'LINE ログイン',
              brandLogo: Icon(
                FontAwesomeIcons.line,
                size: context.displaySize.width * 0.08,
              ),
              backgroundColor: lineGreen,
              onPressed: () {
                // TODO(shimizu-saffle): LINEでログイン
              },
            ),
            BrandButton(
              label: 'Google ログイン',
              labelColor: Colors.black54,
              brandLogo: Assets.images.googleLogo.image(
                height: context.displaySize.width * 0.08,
              ),
              backgroundColor: Colors.white,
              onPressed: () {
                // TODO(shimizu-saffle): LINEでログイン
              },
            ),
            BrandButton(
              label: 'Apple ログイン',
              brandLogo: Icon(
                FontAwesomeIcons.apple,
                size: context.displaySize.width * 0.08,
              ),
              backgroundColor: Colors.black,
              onPressed: () {
                // TODO(shimizu-saffle): LINEでログイン
              },
            ),
          ],
        ),
      ),
    );
  }
}
