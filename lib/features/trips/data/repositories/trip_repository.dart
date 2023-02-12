import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/extensions/datetime.dart';
import 'package:trip_app_nativeapp/core/http/api_client/abstract_api_client.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_client.dart';
import 'package:trip_app_nativeapp/features/trips/data/models/create_trip_response.dart';
import 'package:trip_app_nativeapp/features/trips/data/models/fetch_trips_response.dart';
import 'package:trip_app_nativeapp/features/trips/data/models/invite_trip_response.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_invitation.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_member.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_invitation_num.dart';
import 'package:trip_app_nativeapp/features/trips/domain/repositories/trip_repository_interface.dart';
import 'package:trip_app_nativeapp/features/user/domain/entity/app_user.dart';

part 'trip_repository.g.dart';

@riverpod
TripRepositoryInterface tripRepository(TripRepositoryRef ref) {
  return TripRepository(
    privateV1Client: ref.watch(privateTripAppV1ClientProvider),
  );
}

class TripRepository implements TripRepositoryInterface {
  TripRepository({
    required this.privateV1Client,
  });

  final AbstractApiClient privateV1Client;
  static const _basePath = '/trips';

  @override
  Future<Trip> createTrip(Trip trip) async {
    final bodyMap = {
      'name': trip.title.value,
      'from_date': trip.tripPeriod.fromDate.toJsonDateString(),
      'end_date': trip.tripPeriod.endDate.toJsonDateString(),
    };
    final res = await privateV1Client.post(_basePath, data: bodyMap);
    final tripRes = CreateTripResponse.fromJson(res.data);
    return Trip.createExistingTrip(
      title: tripRes.name,
      fromDate: tripRes.fromDate,
      endDate: tripRes.endDate,
    );
  }

  @override
  Future<GeneratedTripInvitation> invite(NewTripInvitation invitation) async {
    final bodyMap = {
      'invitation_num': invitation.invitationNum.value,
    };

    final res = await privateV1Client.post(
      '$_basePath/${invitation.tripId}/invite',
      data: bodyMap,
    );

    final inviteRes = InviteTripResponse.fromJson(res.data);
    final invitationNum = TripInvitationNum(value: inviteRes.invitationNum);
    return TripInvitation.createGeneratedTripInvitation(
      tripId: invitation.tripId,
      invitationNum: invitationNum,
      invitationCode: inviteRes.invitationCode,
    ) as GeneratedTripInvitation;
  }

  @override
  Future<List<Trip>> fetchTripsByUserId(int userId) async {
    final res = await privateV1Client.get('/users/$userId$_basePath');
    final tripsRes = FetchTripsResponse.fromJson(res.data);
    final trips = <Trip>[];
    for (final trip in tripsRes.items) {
      final members = <TripMember>[];
      for (final memberRes in trip.members) {
        members.add(
          TripMember.joined(
            isHost: memberRes.isHost,
            user: AppUser(
              id: memberRes.member.id,
              name: memberRes.member.name,
              email: memberRes.member.email,
            ),
          ),
        );
      }
      trips.add(
        Trip.createExistingTrip(
          title: trip.name,
          fromDate: trip.fromDate,
          endDate: trip.endDate,
          members: members,
        ),
      );
    }
    return trips;
  }
}
