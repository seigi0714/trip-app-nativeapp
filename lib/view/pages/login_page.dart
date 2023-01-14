import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:trip_app_nativeapp/core/constants/color.dart';
import 'package:trip_app_nativeapp/core/enum/login_type.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/core/gen/assets.gen.dart';
import 'package:trip_app_nativeapp/features/auth/controller/auth_controller.dart';
import 'package:trip_app_nativeapp/view/widgets/brand_button.dart';
import 'package:trip_app_nativeapp/view/widgets/loading.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  static const path = '/login';
  static const name = 'LoginPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 2),
              Text(
                'さあ、旅に出よう',
                style: context.textTheme.headline4?.copyWith(
                  color: kPrimaryColor,
                ),
              ),
              const Spacer(),
              Lottie.asset(
                Assets.lotties.travelLoading,
                height: context.displaySize.height * 0.5,
              ),
              const Spacer(),
              BrandButton(
                label: 'LINE ログイン',
                brandLogo: Icon(
                  FontAwesomeIcons.line,
                  size: context.displaySize.width * 0.08,
                ),
                backgroundColor: lineGreen,
                onPressed: () async {
                  // ref.read(overlayLoadingProvider.notifier).state = true;
                  await ref.read(loginProvider(LoginType.line).future);
                  // ref.read(overlayLoadingProvider.notifier).state = false;
                },
              ),
              const Spacer(),
              BrandButton(
                label: 'Google ログイン',
                labelColor: Colors.black54,
                brandLogo: Assets.images.googleLogo.image(
                  height: context.displaySize.width * 0.08,
                ),
                backgroundColor: Colors.white,
                onPressed: () async {
                  // ref.read(overlayLoadingProvider.notifier).state = true;
                  await ref.read(loginProvider(LoginType.google).future);
                },
              ),
              const Spacer(),
              BrandButton(
                label: 'Apple ログイン',
                brandLogo: Icon(
                  FontAwesomeIcons.apple,
                  size: context.displaySize.width * 0.08,
                ),
                backgroundColor: Colors.black,
                onPressed: () {
                  // TODO(shimizu-saffle): Appleでログイン
                },
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
