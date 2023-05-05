import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fintoc_method_channel.dart';

abstract class FintocPlatform extends PlatformInterface {
  /// Constructs a FintocPlatform.
  FintocPlatform() : super(token: _token);

  static final Object _token = Object();

  static FintocPlatform _instance = MethodChannelFintoc();

  /// The default instance of [FintocPlatform] to use.
  ///
  /// Defaults to [MethodChannelFintoc].
  static FintocPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FintocPlatform] when
  /// they register themselves.
  static set instance(FintocPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
