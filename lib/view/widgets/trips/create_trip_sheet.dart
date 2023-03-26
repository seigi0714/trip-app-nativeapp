import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
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
          _buildTitleTextField(titleEditingController),
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

  Widget _buildTitleTextField(TextEditingController titleEditingController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: titleEditingController,
        decoration: const InputDecoration(
          hintText: 'どこへ旅行する？ 🗺️',
          border: OutlineInputBorder(),
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
              onTap: () {
                DatePicker.showDatePicker(
                  context,
                  minTime: DateTime.now(),
                  onConfirm: (date) => fromDate.value = date,
                  currentTime: fromDate.value,
                  locale: LocaleType.jp,
                );
              },
              child: _buildDateBox(
                context: context,
                date: fromDate.value,
                label: 'From',
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: InkWell(
              onTap: () {
                DatePicker.showDatePicker(
                  context,
                  minTime: DateTime.now(),
                  onConfirm: (date) => endDate.value = date,
                  currentTime: endDate.value,
                  locale: LocaleType.jp,
                );
              },
              child: _buildDateBox(
                context: context,
                date: endDate.value,
                label: 'To',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateBox({
    required BuildContext context,
    required DateTime date,
    required String label,
  }) {
    final dateFormatter = DateFormat.yMMMd().add_jm();
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Text(label, style: Theme.of(context).textTheme.bodySmall),
          Text(dateFormatter.format(date)),
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
      child: const Text('Create'),
    );
  }
}
