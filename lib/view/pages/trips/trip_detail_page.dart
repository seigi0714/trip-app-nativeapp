import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/core/constants/dummy.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_controller.dart';
import 'package:trip_app_nativeapp/view/pages/trips/trips_list_page.dart';
import 'package:trip_app_nativeapp/view/widgets/common/car_driving_loading.dart';
import 'package:trip_app_nativeapp/view/widgets/common/error_cat.dart';
import 'package:trip_app_nativeapp/view/widgets/trips/trip_belonging_list.dart';
import 'package:trip_app_nativeapp/view/widgets/trips/trip_overview_card.dart';
import 'package:trip_app_nativeapp/view/widgets/trips/trip_schedule.dart';

class TripDetailPage extends HookConsumerWidget {
  const TripDetailPage(this.id, {super.key});

  static String path({required int id}) => '${TripListPage.path}/$id';
  static const pathParam = ':id';
  static const scheduleTabIndex = 0;
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = useState(scheduleTabIndex);
    final backgroundImageHeight = context.displaySize.width / 16 * 9;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: ref.watch(tripsControllerProvider).when(
              data: (trips) {
                final trip = trips.firstWhereOrNull((trip) => trip.id == id);
                if (trip == null) {
                  return const Center(
                    child: ErrorCat(
                      AppException(
                        code: 'not_found',
                        message: '選択した旅の予定が見つかりませんでした。',
                      ),
                      null,
                    ),
                  );
                }

                return NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        // TODO(seigi0714): スクロールした場合のみ表示したい。
                        title: Text(
                          trip.title.value,
                          style: context.textTheme.titleLarge,
                        ),
                        expandedHeight:
                            backgroundImageHeight + TripOverviewCard.height / 2,
                        flexibleSpace: FlexibleSpaceBar(
                          background: SizedBox(
                            height: backgroundImageHeight +
                                TripOverviewCard.height / 2,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                SizedBox(
                                  height: backgroundImageHeight,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(dummyTripImageUrl1),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: backgroundImageHeight -
                                      TripOverviewCard.height / 1.5,
                                  child: TripOverviewCard(tripId: id),
                                ),
                              ],
                            ),
                          ),
                        ),
                        pinned: true,
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(48),
                          child: TabBar(
                            controller: TabController(
                              length: 2,
                              vsync: Scaffold.of(context),
                              initialIndex: tabIndex.value,
                            ),
                            labelColor: Colors.black,
                            tabs: const [
                              Tab(
                                text: '🗓️日程',
                              ),
                              Tab(
                                text: '🧳持ち物',
                              )
                            ],
                            onTap: (i) => tabIndex.value = i,
                          ),
                        ),
                      ),
                    ];
                  },
                  body: tabIndex.value == scheduleTabIndex
                      ? const TripSchedule()
                      : TripBelongingList(id),
                );
              },
              error: ErrorCat.new,
              loading: CarDrivingLoading.new,
            ),
      ),
    );
  }
}
