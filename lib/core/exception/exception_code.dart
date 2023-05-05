class ExceptionCode {
  // entity,value objectバリデーション
  static const String invalidTripTitle = 'invalid_trip_title';
  static const String invalidTripPeriod = 'invalid_trip_period';
  static const String invalidTripInvitationNum = 'invalid_trip_invitation_num';
  static const String invalidTripInvitationStatus =
      'invalid_trip_invitation_status';
  static const String invalidTripBelongingName = 'invalid_trip_belonging_name';
  static const String invalidTripBelongingNum = 'invalid_trip_belonging_num';
  // API error code
  static const String invalidEntityValue = 'invalid_entity_value';
  static const String invalidBase64Value = 'invalid_base64_value';
  static const String inviteNumReachedLimit = 'invite_num_reached_limit';
  static const String invitationExpired = 'invitation_expired';
}
