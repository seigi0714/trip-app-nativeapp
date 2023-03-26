import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/core/gen/assets.gen.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_controller.dart';

class CreateTripSheet extends HookConsumerWidget {
  const CreateTripSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleEditingController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final fromDate = useState(DateTime.now());
    final endDate = useState(DateTime.now());
    return SizedBox(
      height: context.displaySize.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            Assets.lotties.natureVisitTravel,
            height: context.displaySize.height * 0.3,
          ),
          _buildTitleTextField(titleEditingController, context),
          _buildDateRangeRow(context, fromDate, endDate),
          _buildCreateButton(
            ref,
            context,
            titleEditingController,
            fromDate,
            endDate,
          ),
        ],
      ),
    );
  }

  Widget _buildTitleTextField(
    TextEditingController titleEditingController,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: context.theme.colorScheme.secondaryContainer,
          ),
        ),
        child: TextField(
          controller: titleEditingController,
          decoration: const InputDecoration(
            hintText: 'どこへ旅行する？ 🗺️',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(16),
          ),
        ),
      ),
    );
  }

  Widget _buildDateRangeRow(
    BuildContext context,
    ValueNotifier<DateTime> fromDate,
    ValueNotifier<DateTime> endDate,
  ) {
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
                  onConfirm: (date) => endDate.value = date,
                  currentTime: endDate.value,
                  locale: LocaleType.jp,
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: context.theme.colorScheme.secondaryContainer,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  DateFormat.yMMMd().add_jm().format(fromDate.value),
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
                  onConfirm: (date) => endDate.value = date,
                  currentTime: endDate.value,
                  locale: LocaleType.jp,
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: context.theme.colorScheme.secondaryContainer,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  DateFormat.yMMMd().add_jm().format(endDate.value),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateButton(
    WidgetRef ref,
    BuildContext context,
    TextEditingController titleEditingController,
    ValueNotifier<DateTime> fromDate,
    ValueNotifier<DateTime> endDate,
  ) {
    return ElevatedButton(
      onPressed: () {
        ref.read(tripControllerProvider).createTrip(
              title: titleEditingController.text,
              fromDate: fromDate.value,
              endDate: endDate.value,
              onSuccess: () => Navigator.pop(context),
            );
      },
      child: const Text('作成'),
    );
  }
}
