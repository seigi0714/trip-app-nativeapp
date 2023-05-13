import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';

part 'share_service.g.dart';

@riverpod
ShareService shareService(ShareServiceRef ref) => ShareService();

class ShareService {
  Future<void> share(Uri uri) async {
    await Share.share(uri.toString());
  }
}
