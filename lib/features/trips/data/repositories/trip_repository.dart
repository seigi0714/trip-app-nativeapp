import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/extensions/datetime.dart';
import 'package:trip_app_nativeapp/core/http/api_client/abstract_api_client.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_client.dart';
import 'package:trip_app_nativeapp/features/trips/data/models/create_trip_response.dart';
import 'package:trip_app_nativeapp/features/trips/data/models/get_trip_invitation_response.dart';
import 'package:trip_app_nativeapp/features/trips/data/models/invite_trip_response.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_invitation.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_invitation_num.dart';
import 'package:trip_app_nativeapp/features/trips/domain/repositories/trip_repository_interface.dart';

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
  Future<DetailTripInvitation> getInvitationByCode(String code) async {
    final res = await privateV1Client.get(
      'trip_invitation/$code',
    );

    final invitationRes = GetTripInvitationResponse.fromJson(res.data);
    final invitationNum = TripInvitationNum(value: invitationRes.invitationNum);

    return TripInvitation.createDetailTripInvitation(
      trip: Trip.createExistingTrip(
        title: invitationRes.trip.name,
        fromDate: invitationRes.trip.fromDate,
        endDate: invitationRes.trip.endDate,
      ),
      invitationUserName: invitationRes.invitationUser.name,
      invitationNum: invitationNum,
      invitationCode: invitationRes.invitationCode,
    ) as DetailTripInvitation;
  }
}
