import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_belonging_controller.dart';

class AddTripBelongingSheet extends HookConsumerWidget {
  const AddTripBelongingSheet(this.tripId, {super.key});

  final int tripId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleEditingController = useTextEditingController();
    final numOfEditingController = useTextEditingController();

    final isTitleEmpty = useState<bool>(true);
    final isNumOfEmpty = useState<bool>(true);
    final isShareAmongMember = useState<bool>(false);

    useEffect(
      () {
        titleEditingController.addListener(
          () => isTitleEmpty.value = titleEditingController.text.isEmpty,
        );
        numOfEditingController.addListener(
          () => isNumOfEmpty.value = numOfEditingController.text.isEmpty,
        );
        return null;
      },
      [titleEditingController, numOfEditingController],
    );

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      height: 280,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _TitleTextField(
            controller: titleEditingController,
            isTitleEmpty: isTitleEmpty,
          ),
          _NumOfForm(
            controller: numOfEditingController,
            isNumEmpty: isNumOfEmpty,
          ),
          _IsShareCheckBoxRow(isShareAmongMember: isShareAmongMember),
          _CreateButton(
            tripId: tripId,
            titleEditingController: titleEditingController,
            numOfEditingController: numOfEditingController,
            isTitleEmpty: isTitleEmpty,
            isNumOfEmpty: isNumOfEmpty,
            isShareAmongMember: isShareAmongMember,
          ),
        ],
      ),
    );
  }
}

class _TitleTextField extends StatelessWidget {
  const _TitleTextField({
    required this.controller,
    required this.isTitleEmpty,
  });

  final TextEditingController controller;
  final ValueNotifier<bool> isTitleEmpty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isTitleEmpty.value
                ? context.theme.colorScheme.secondaryContainer
                : context.theme.colorScheme.primary,
          ),
        ),
        child: TextField(
          autofocus: true,
          controller: controller,
          decoration: const InputDecoration(
            hintText: '持ち物名🧳',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(16),
          ),
          style: TextStyle(
            color: context.theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

class _NumOfForm extends HookWidget {
  const _NumOfForm({
    required this.controller,
    required this.isNumEmpty,
  });

  final TextEditingController controller;
  final ValueNotifier<bool> isNumEmpty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isNumEmpty.value
                ? context.theme.colorScheme.secondaryContainer
                : context.theme.colorScheme.primary,
          ),
        ),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: '個数',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(16),
          ),
          style: TextStyle(
            color: context.theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

class _IsShareCheckBoxRow extends HookWidget {
  const _IsShareCheckBoxRow({
    required this.isShareAmongMember,
  });

  final ValueNotifier<bool> isShareAmongMember;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isShareAmongMember.value,
          onChanged: (value) => isShareAmongMember.value = value ?? false,
          fillColor: context.theme.checkboxTheme.checkColor,
        ),
        InkWell(
          child: const Text('他のメンバーと共有する？'),
          onTap: () => isShareAmongMember.value = !isShareAmongMember.value,
        ),
      ],
    );
  }
}

class _CreateButton extends ConsumerWidget {
  const _CreateButton({
    required this.tripId,
    required this.titleEditingController,
    required this.numOfEditingController,
    required this.isTitleEmpty,
    required this.isNumOfEmpty,
    required this.isShareAmongMember,
  });

  final int tripId;
  final TextEditingController titleEditingController;
  final TextEditingController numOfEditingController;
  final ValueNotifier<bool> isTitleEmpty;
  final ValueNotifier<bool> isNumOfEmpty;
  final ValueNotifier<bool> isShareAmongMember;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: context.displaySize.width * 0.2,
      child: ElevatedButton(
        onPressed: isTitleEmpty.value || isNumOfEmpty.value
            ? null
            : () {
                ref
                    .read(
                      tripBelongingsControllerProvider(tripId: tripId).notifier,
                    )
                    .addBelonging(
                      tripId: tripId,
                      name: titleEditingController.text,
                      numOf: int.parse(numOfEditingController.text),
                      isShareAmongMember: isShareAmongMember.value,
                      onFinished: () => Navigator.pop(context),
                    );
              },
        child: const Text('作成'),
      ),
    );
  }
}
