import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/utils/extensions/build_context.dart';

import '../utils/constants/color.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  static const path = '/login';
  static const name = 'LoginPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: context.displaySize.width * 0.8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: lineGreen,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: const [
                    Spacer(flex: 2),
                    FaIcon(
                      FontAwesomeIcons.line,
                      size: 30,
                    ),
                    Spacer(),
                    Text(
                      'LINEでログイン',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
