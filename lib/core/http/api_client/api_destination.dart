enum ApiDestination {
  publicTripAppV1(isRequiredToken: false),
  privateTripAppV1(isRequiredToken: true);

  const ApiDestination({required this.isRequiredToken});
  final bool isRequiredToken;
}
