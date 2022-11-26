import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/env.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_destination.dart';

part 'baseurl.g.dart';

@riverpod
String baseUrl(
  BaseUrlRef ref,
  ApiDestination apiDestination,
) {
  switch (apiDestination) {
    case ApiDestination.publicTripAppV1:
      return '${Env.protocol}://${Env.tripAppApiUrl}:${Env.tripAppApiPort}/api/v1';
    case ApiDestination.privateTripAppV1:
      return '${Env.protocol}://${Env.tripAppApiUrl}:${Env.tripAppApiPort}/private_api/v1';
  }
}
