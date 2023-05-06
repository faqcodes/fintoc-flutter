import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'handler_enum.dart';
import 'navigation_event.dart';
import 'option_enum.dart';
import 'constants.dart' as Constants;

class FintocWidgetView extends StatefulWidget {
  const FintocWidgetView({super.key, required this.options, this.handlers});

  final Map<FintocWidgetOption, String> options;
  final Map<FintocWidgetEventHandler, Function>? handlers;

  @override
  State<FintocWidgetView> createState() => _FintocWidgetView();
}

class _FintocWidgetView extends State<FintocWidgetView> {
  late final WebViewController controller;

  @override
  void initState() {
    debugPrint('FintocWidgetView: initState');

    widget.options.removeWhere((key, value) => value.isEmpty);

    final options =
        widget.options.map((key, value) => MapEntry(key.name!, value));

    final fintocWidgetUri = Uri.https(
        Constants.FINTOC_WEBVIEW_HOST, Constants.FINTOC_WEBVIEW_PATH, options);

    controller = WebViewController()
      ..loadRequest(fintocWidgetUri)
      ..setNavigationDelegate(NavigationEvent.handler(widget.handlers))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);

    super.initState();
  }

  @override
  void dispose() {
    debugPrint('FintocWidgetView: dispose');

    controller.loadRequest(Uri.parse('about:blank'));

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: controller,
    );
  }
}
