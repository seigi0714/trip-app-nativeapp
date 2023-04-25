import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/features/trips/controller/trip_controller.dart';
import 'package:trip_app_nativeapp/view/widgets/common/car_driving_loading.dart';
import 'package:trip_app_nativeapp/view/widgets/common/error_cat.dart';
import 'package:trip_app_nativeapp/view/widgets/trips/trip_belonging_list.dart';
import 'package:trip_app_nativeapp/view/widgets/trips/trip_overview_card.dart';
import 'package:trip_app_nativeapp/view/widgets/trips/trip_schedule.dart';

class TripDetailPage extends HookConsumerWidget {
  const TripDetailPage(this.id, {super.key});

  static const path = ':id';
  static const scheduleTabIndex = 0;
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = useState(scheduleTabIndex);
    final backgroundImageHeight = context.displaySize.width / 16 * 9;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: ref.watch(tripsProvider).when(
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
                                        image: NetworkImage(
                                          'https://tsunagutabi.com/wp-content/uploads/2020/04/%E6%97%85%E8%A1%8C%E3%83%96%E3%83%AD%E3%82%B0%E3%81%AB%E3%81%8A%E3%81%99%E3%81%99%E3%82%81%E3%81%AE%E3%83%95%E3%83%AA%E3%83%BC%E7%94%BB%E5%83%8F%EF%BC%86%E7%B4%A0%E6%9D%90%E3%82%B5%E3%82%A4%E3%83%88%E3%81%BE%E3%81%A8%E3%82%81.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: backgroundImageHeight -
                                      TripOverviewCard.height / 2,
                                  child: TripOverviewCard(trip),
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
                      : const TripBelongingList(),
                );
              },
              error: ErrorCat.new,
              loading: CarDrivingLoading.new,
            ),
      ),
    );
  }
}
