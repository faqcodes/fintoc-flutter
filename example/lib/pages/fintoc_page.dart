import 'package:fintoc/main.dart';
import 'package:fintoc_example/services/fintoc_setup.dart';
import 'package:flutter/material.dart';

class FintocPage extends StatefulWidget {
  const FintocPage({super.key});

  @override
  State<FintocPage> createState() => _FintocPageState();
}

class _FintocPageState extends State<FintocPage> {
  var fintocSetup = FintocSetup();

  @override
  void initState() {
    super.initState();
  }

  void _onSuccess(String data) {
    debugPrint('onSucess from FintocWidgetView: $data');

    Navigator.pop(context);
  }

  void _onExit(String data) {
    debugPrint('onExit from FintocWidgetView: $data');

    Navigator.pop(context);
  }

  void _onEvent(String eventName) {
    debugPrint('onEvent from FintocWidgetView: $eventName');

    if (eventName == 'opened') {}

    if (eventName == 'payment_error') {}

    if (eventName == 'closed') {
      Navigator.pop(context);
    }
  }

  void _onError(dynamic error) {
    debugPrint('onError from FintocWidgetView: $error');
  }

  @override
  Widget build(BuildContext context) {
    final widgetHandlers = {
      FintocWidgetEventHandler.succeeded: (_) => _onSuccess(_),
      FintocWidgetEventHandler.exit: (_) => _onExit(_),
      FintocWidgetEventHandler.event: (name) => _onEvent(name),
      FintocWidgetEventHandler.error: (error) => _onError(error),
    };

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: FintocWidgetView(
            options: fintocSetup.widgetOptions,
            handlers: widgetHandlers,
          ),
        ),
      ],
    );
  }
}
