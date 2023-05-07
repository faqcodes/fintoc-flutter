import 'package:flutter/widgets.dart';
import 'package:fintoc/main.dart';

class FintocSetup {
  Map<FintocWidgetOption, String>? _widgetOptions;
  Map<FintocWidgetEventHandler, Function>? _widgetHandlers;

  Map<FintocWidgetOption, String> get widgetOptions {
    return _widgetOptions!;
  }

  Map<FintocWidgetEventHandler, Function> get widgetHandlers {
    return _widgetHandlers!;
  }

  FintocSetup() {
    _initializeOptions();
    _initializeEventHandlers();
  }

  void _initializeOptions() {
    _widgetOptions = {
      FintocWidgetOption.publicKey: 'pk_test_E-3Tq4kF6UBx8E4HeES7Hu47cLJT7nxD',
      FintocWidgetOption.holderType: 'individual',
      FintocWidgetOption.product: 'payments',
      FintocWidgetOption.country: 'cl',
      FintocWidgetOption.institutionId: '',
      FintocWidgetOption.username: '',
      FintocWidgetOption.webhookUrl: '',
      FintocWidgetOption.widgetToken:
          'pi_RxZd7OSv8vDydqKO_sec_2XVV6hP9Lt1TFxRXCMwyYAtH',
    };
  }

  void _initializeEventHandlers() {
    _widgetHandlers = {
      FintocWidgetEventHandler.succeeded: (_) => _onSuccess(_),
      FintocWidgetEventHandler.exit: (_) => _onExit(_),
      FintocWidgetEventHandler.event: (name) => _onEvent(name),
      FintocWidgetEventHandler.error: (error) => _onError(error),
    };
  }

  void _onSuccess(String data) {
    debugPrint('onSucess from FintocWidgetView: $data');
  }

  void _onExit(String data) {
    debugPrint('onExit from FintocWidgetView: $data');
  }

  void _onEvent(String eventName) {
    debugPrint('onEvent from FintocWidgetView: $eventName');
  }

  void _onError(dynamic error) {
    debugPrint('onError from FintocWidgetView: $error');
  }
}
