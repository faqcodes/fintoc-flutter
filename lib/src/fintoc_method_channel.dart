import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'fintoc_platform_interface.dart';

/// An implementation of [FintocPlatform] that uses method channels.
class MethodChannelFintoc extends FintocPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('fintoc');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
