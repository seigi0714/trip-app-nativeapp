import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/core/extensions/datetime.dart';
import 'package:trip_app_nativeapp/core/gen/assets.gen.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_controller.dart';

class CreateTripSheet extends HookConsumerWidget {
  const CreateTripSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleEditingController = useTextEditingController();
    final isTitleEmpty = useState<bool>(true);
    final fromDate = useState(DateTime.now());
    final endDate = useState(DateTime.now());

    useEffect(
      () {
        titleEditingController.addListener(
          () => isTitleEmpty.value = titleEditingController.text.isEmpty,
        );
        return titleEditingController.dispose;
      },
      [titleEditingController],
    );

    return SizedBox(
      height: context.displaySize.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            Assets.lotties.natureVisitTravel,
            height: context.displaySize.height * 0.3,
          ),
          _TitleTextField(
            controller: titleEditingController,
            isTitleEmpty: isTitleEmpty,
          ),
          _DateRangeRow(
            fromDate: fromDate,
            endDate: endDate,
          ),
          _CreateButton(
            titleEditingController: titleEditingController,
            fromDate: fromDate,
            endDate: endDate,
            isTitleEmpty: isTitleEmpty,
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
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'どこへ旅行する？ 🗺️',
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

class _DateRangeRow extends HookWidget {
  const _DateRangeRow({
    required this.fromDate,
    required this.endDate,
  });

  final ValueNotifier<DateTime> fromDate;
  final ValueNotifier<DateTime> endDate;

  @override
  Widget build(BuildContext context) {
    final isSelectedFrom = useState(false);
    final isSelectedTo = useState(false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                DatePicker.showDatePicker(
                  context,
                  minTime: DateTime.now(),
                  onConfirm: (date) {
                    isSelectedFrom.value = true;
                    fromDate.value = date;
                  },
                  currentTime: fromDate.value,
                  locale: LocaleType.jp,
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelectedFrom.value
                        ? context.theme.colorScheme.primary
                        : context.theme.colorScheme.secondaryContainer,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  isSelectedFrom.value ? fromDate.value.toDateString() : '出発日',
                  style: TextStyle(
                    color: isSelectedFrom.value
                        ? context.theme.colorScheme.primary
                        : context.theme.colorScheme.onBackground,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                DatePicker.showDatePicker(
                  context,
                  minTime: DateTime.now(),
                  onConfirm: (date) {
                    isSelectedTo.value = true;
                    endDate.value = date;
                  },
                  currentTime: endDate.value,
                  locale: LocaleType.jp,
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelectedTo.value
                        ? context.theme.colorScheme.primary
                        : context.theme.colorScheme.secondaryContainer,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  isSelectedTo.value ? fromDate.value.toDateString() : '帰着日',
                  style: TextStyle(
                    color: isSelectedTo.value
                        ? context.theme.colorScheme.primary
                        : context.theme.colorScheme.onBackground,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CreateButton extends ConsumerWidget {
  const _CreateButton({
    required this.titleEditingController,
    required this.fromDate,
    required this.endDate,
    required this.isTitleEmpty,
  });

  final TextEditingController titleEditingController;
  final ValueNotifier<DateTime> fromDate;
  final ValueNotifier<DateTime> endDate;
  final ValueNotifier<bool> isTitleEmpty;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: context.displaySize.width * 0.3,
      child: ElevatedButton(
        onPressed: isTitleEmpty.value
            ? null
            : () {
                ref.read(tripControllerProvider).createTrip(
                      title: titleEditingController.text,
                      fromDate: fromDate.value,
                      endDate: endDate.value,
                      onSuccess: () => Navigator.pop(context),
                    );
              },
        child: const Text('作成'),
      ),
    );
  }
}
