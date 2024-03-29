import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_controller.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';
import 'package:trip_app_nativeapp/view/widgets/helpers/scaffold_messenger.dart';
import 'package:trip_app_nativeapp/view/widgets/helpers/text_input_helper.dart';

class EditableTripTitleText extends HookConsumerWidget {
  const EditableTripTitleText({
    required this.trip,
    super.key,
  });

  final ExistingTrip trip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = useState(false);
    final focusNode = useFocusNode();

    /// TextField にフォーカスが当たる前のテキストを保持する。
    /// フォーカスが外れた時にテキストが空文字だった場合に、編集前の旅タイトルに表示を戻すために使用する。
    final previousText = useState(trip.title.value);
    final controller = useTextEditingController(text: trip.title.value);

    void textEditingListener() {
      if (controller.text.isEmpty) {
        ref
            .read(scaffoldMessengerHelperProvider)
            .showSnackBar('旅のタイトルが空文字です🫢');
      }
    }

    useEffect(
      () {
        // useEffect で showSnackBar を出すとアサーションエラーになるため、addListener で処理を登録する。
        controller.addListener(textEditingListener);
        return () => controller.removeListener(textEditingListener);
      },
      [],
    );

    useListenable(focusNode);
    useEffect(
      () {
        if (!focusNode.hasFocus) {
          // 旅タイトルが変更されていない場合は、API コールしない。
          if (previousText.value == controller.text) {
            isEditing.value = false;
            return;
          }
          // 旅タイトルが空文字になった場合は、編集前のタイトルに戻して API コールしない。
          if (controller.text.isEmpty) {
            controller.text = previousText.value;
            isEditing.value = false;
            return;
          }
          ref.read(tripsControllerProvider.notifier).updateTrip(
                tripId: trip.id,
                title: controller.text,
              );
          previousText.value = controller.text;
          isEditing.value = false;
        }
        return null;
      },
      [focusNode.hasFocus],
    );

    return isEditing.value
        ? TextField(
            controller: controller,
            focusNode: focusNode,
            style: controller.text.length < 14
                ? context.textTheme.headlineSmall
                : context.textTheme.titleMedium,
            // UI に文字数カウンターを表示したくないので、maxLength プロパティを使わない。
            inputFormatters: [
              MaxLengthInputFormatterWithSnackBar(ref, 25),
            ],
          )
        : GestureDetector(
            onTap: () {
              isEditing.value = true;
              focusNode.requestFocus();
            },
            child: Text(
              controller.text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: controller.text.length < 14
                  ? context.textTheme.headlineSmall
                  : context.textTheme.titleMedium,
            ),
          );
  }
}
