import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/core/extensions/datetime.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_controller.dart';

class TripNewPage extends HookConsumerWidget {
  const TripNewPage({super.key});

  static const path = 'new_trips';
  static const name = 'NewTripPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMounted = useIsMounted();
    final titleEditingController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final fromDate = useState(DateTime.now());
    final endDate = useState(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規作成'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: titleEditingController,
              ),
              Row(
                children: [
                  TextButton(
                    child: Text(fromDate.value.toDateString()),
                    onPressed: () {
                      DatePicker.showDatePicker(
                        context,
                        minTime: DateTime.now(),
                        onConfirm: (date) {
                          fromDate.value = date;
                        },
                        currentTime: fromDate.value,
                        locale: LocaleType.jp,
                      );
                    },
                  ),
                  const Text('~'),
                  TextButton(
                    child: Text(endDate.value.toDateString()),
                    onPressed: () {
                      DatePicker.showDatePicker(
                        context,
                        minTime: DateTime.now(),
                        onConfirm: (date) {
                          endDate.value = date;
                        },
                        currentTime: endDate.value,
                        locale: LocaleType.jp,
                      );
                    },
                  ),
                ],
              ),
              ElevatedButton(
                child: const Text('作成'),
                onPressed: () async {
                  try {
                    await ref.read(
                      createTripProvider(
                        title: titleEditingController.text,
                        fromDate: fromDate.value,
                        endDate: endDate.value,
                      ).future,
                    );
                    if (!isMounted()) return;
                    //ignore: use_build_context_synchronously
                    context.pop();
                  } catch (e) {
                    // controller側でハンドリングしているのでここでは踏み潰す
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
