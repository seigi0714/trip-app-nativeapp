import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_belonging_controller.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_belonging.dart';

class TripBelongingItem extends HookConsumerWidget {
  const TripBelongingItem({
    required this.tripId,
    required this.belonging,
    super.key,
  });

  final int tripId;
  final AddedTripBelonging belonging;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditMode = useState(false);
    final nameEditingController =
        useTextEditingController(text: belonging.name.value);
    final numOfEditingController =
        useTextEditingController(text: belonging.numOf.value.toString());

    return GestureDetector(
      onTap: () {
        if (isEditMode.value) return;
        ref
            .read(tripBelongingsControllerProvider(tripId: tripId).notifier)
            .changeCheckStatus(belonging);
      },
      onLongPress: () => isEditMode.value = true,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: context.theme.dividerColor,
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                _LeadingArea(
                  isChecked: belonging.isChecked,
                  isEditMode: isEditMode.value,
                  onDelete: () {
                    // TODO(seigi0714): controllerのdeleteメソッド呼び出し
                  },
                ),
                const Gap(8),
                Expanded(
                  child: _NameField(
                    controller: nameEditingController,
                    isEditMode: isEditMode.value,
                  ),
                ),
                const Gap(8),
                SizedBox(
                  width: 42,
                  child: Row(
                    children: [
                      _NumOfField(
                        isEditMode: isEditMode.value,
                        controller: numOfEditingController,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (isEditMode.value)
              _ActionButtonRow(
                onClose: () {
                  nameEditingController.text = belonging.name.value;
                  numOfEditingController.text =
                      belonging.numOf.value.toString();
                  isEditMode.value = false;
                },
                onUpdate: () {
                  isEditMode.value = false;
                  // TODO(seigi0714): controllerのupdateメソッド呼び出し
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _LeadingArea extends StatelessWidget {
  const _LeadingArea({
    required this.isChecked,
    required this.isEditMode,
    required this.onDelete,
  });

  final bool isChecked;
  final bool isEditMode;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    if (isEditMode) {
      return IconButton(
        onPressed: onDelete,
        icon: Icon(
          Icons.delete,
          color: context.theme.colorScheme.error,
        ),
      );
    } else {
      return Icon(
        isChecked ? Icons.check_circle_outline : Icons.circle_outlined,
        color: isChecked
            ? context.theme.primaryColor
            : context.theme.unselectedWidgetColor,
      );
    }
  }
}

class _NameField extends StatelessWidget {
  const _NameField({required this.controller, required this.isEditMode});
  final TextEditingController controller;
  final bool isEditMode;
  @override
  Widget build(BuildContext context) {
    return isEditMode
        ? TextField(
            controller: controller,
            style: context.textTheme.titleMedium,
          )
        : Text(controller.text, style: context.textTheme.titleMedium);
  }
}

class _NumOfField extends StatelessWidget {
  const _NumOfField({required this.controller, required this.isEditMode});
  final TextEditingController controller;
  final bool isEditMode;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42,
      child: Row(
        children: [
          Text(
            'x',
            style: context.textTheme.labelMedium,
          ),
          if (isEditMode)
            SizedBox(
              width: 24,
              child: TextField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                ),
                controller: controller,
                keyboardType: TextInputType.number,
                style: context.textTheme.labelMedium,
              ),
            )
          else
            Text(
              controller.text,
              style: context.textTheme.labelMedium,
            ),
        ],
      ),
    );
  }
}

class _ActionButtonRow extends StatelessWidget {
  const _ActionButtonRow({
    required this.onClose,
    required this.onUpdate,
  });

  final void Function() onUpdate;
  final void Function() onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.only(top: 8),
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          iconSize: 28,
          onPressed: onClose,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: Icon(
            Icons.highlight_off,
            color: context.theme.colorScheme.error,
          ),
        ),
        IconButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.only(top: 8, right: 8),
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          iconSize: 28,
          onPressed: onUpdate,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: Icon(
            Icons.check_circle,
            color: context.theme.primaryColor,
          ),
        ),
      ],
    );
  }
}
