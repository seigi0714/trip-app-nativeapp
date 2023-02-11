import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_code.dart';

enum TripInvitationStatus {
  open,
  close,
  expired,
  fullCapacity;

  factory TripInvitationStatus.fromName(String name) {
    switch (name) {
      case 'open':
        return TripInvitationStatus.open;
      case 'close':
        return TripInvitationStatus.close;
      case 'expired':
        return TripInvitationStatus.expired;
      case 'full_capacity':
        return TripInvitationStatus.fullCapacity;
      default:
        throw const AppException(
          code: ExceptionCode.invalidTripInvitationStatus,
          message: '招待ステータスの値が不正です。',
        );
    }
  }
}
