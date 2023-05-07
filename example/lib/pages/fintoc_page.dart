import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fintoc/main.dart';
import 'package:fintoc_example/services/fintoc_setup.dart';

class FintocPage extends StatefulWidget {
  const FintocPage({super.key, required this.amount});

  final double amount;

  @override
  State<FintocPage> createState() => _FintocPageState();
}

class _FintocPageState extends State<FintocPage> {
  var opened = false;

  @override
  void initState() {
    super.initState();

    // If the widget has not been opened in 3 sec. an error may have occurred
    Timer(const Duration(seconds: 3), () {
      if (!opened) {
        // Widget unhandled error
        _onError('Widget unhandled error');
      }
    });
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

    if (eventName == 'opened') {
      setState(() => opened = true);
    }

    if (eventName == 'payment_error') {}

    if (eventName == 'closed') {
      Navigator.pop(context);
    }
  }

  void _onError(dynamic error) {
    debugPrint('onError from FintocWidgetView: $error');
    // TODO: handle errors
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final widgetHandlers = {
      FintocWidgetEventHandler.succeeded: (_) => _onSuccess(_),
      FintocWidgetEventHandler.exit: (_) => _onExit(_),
      FintocWidgetEventHandler.event: (name) => _onEvent(name),
      FintocWidgetEventHandler.error: (error) => _onError(error),
    };

    return FutureBuilder(
      future: initializeOptions(widget.amount),
      builder: (context, options) {
        if (!options.hasData) {
          return Container();
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FintocWidgetView(
                options: options.data!,
                handlers: widgetHandlers,
              ),
            ),
          ],
        );
      },
    );
  }
}
