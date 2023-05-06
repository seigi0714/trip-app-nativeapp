import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dynamic_link_service.g.dart';

@riverpod
DynamicLinksService dynamicLinksService(DynamicLinksServiceRef ref) =>
    DynamicLinksService();

class DynamicLinksService {
  final _dynamicLinks = FirebaseDynamicLinks.instance;

  // TODO(shimizu-saffle): リリースまでに変更する
  final _uriPrefix = 'https://devseigi0714tripapp.page.link';

  /// 旅の招待コードを含んだダイナミックリンクを作成する
  Future<Uri> createInviteDynamicLink(String inviteCode) async {
    final parameters = DynamicLinkParameters(
      uriPrefix: _uriPrefix,
      link: Uri.parse('$_uriPrefix/?invite_code=$inviteCode'),
      androidParameters: const AndroidParameters(
        packageName: 'com.seigiruka.trip_app_nativeapp',
      ),
      iosParameters: const IOSParameters(
        bundleId: 'com.seigiruka.tripapp',
      ),
    );
    final shortDynamicLink = await _dynamicLinks.buildShortLink(parameters);
    final dynamicLink = shortDynamicLink.shortUrl;
    return dynamicLink;
  }
}
