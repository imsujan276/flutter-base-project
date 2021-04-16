import 'package:package_info/package_info.dart';

class AppInfo {
  static PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  /// gets the app version info
  Future<void> init() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    packageInfo = info;
  }
}
