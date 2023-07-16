import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';

class EditableTripTitleText extends HookConsumerWidget {
  const EditableTripTitleText({
    required this.tripTitle,
    super.key,
  });

  final String tripTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = useState(false);
    final focusNode = useFocusNode();
    final controller = useTextEditingController(text: tripTitle);

    useEffect(
      () {
        focusNode.addListener(
          () {
            if (!focusNode.hasFocus) isEditing.value = false;
          },
        );
        return focusNode.dispose;
      },
      [],
    );

    return isEditing.value
        ? TextField(
            controller: controller,
            focusNode: focusNode,
            style: context.textTheme.headlineSmall,
            onEditingComplete: () {
              isEditing.value = false;
              focusNode.unfocus();
            },
          )
        : InkWell(
            onTap: () {
              isEditing.value = true;
              focusNode.requestFocus();
            },
            child: Text(
              tripTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.headlineSmall,
            ),
          );
  }
}
