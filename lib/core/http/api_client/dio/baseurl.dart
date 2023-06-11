import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/env.dart';
import 'package:trip_app_nativeapp/core/http/api_client/api_destination.dart';

part 'baseurl.g.dart';

@Riverpod(keepAlive: true)
String baseUrl(
  BaseUrlRef ref,
  ApiDestination apiDestination,
) {
  final env = ref.watch(envProvider);
  switch (apiDestination) {
    case ApiDestination.publicTripAppV1:
      return '${env.protocol}://${env.tripAppApiUrl}:${env.tripAppApiPort}/api/v1';
    case ApiDestination.privateTripAppV1:
      return '${env.protocol}://${env.tripAppApiUrl}:${env.tripAppApiPort}/private_api/v1';
  }
}
