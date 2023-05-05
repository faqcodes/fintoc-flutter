
import 'fintoc_platform_interface.dart';

class Fintoc {
  Future<String?> getPlatformVersion() {
    return FintocPlatform.instance.getPlatformVersion();
  }
}
