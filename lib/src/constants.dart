// ignore_for_file: constant_identifier_names

import 'package:fintoc/src/handler_enum.dart';

const String FINTOC_WIDGET_HOST = 'wizard.fintoc.com';
const String FINTOC_WEBVIEW_HOST = 'webview.fintoc.com';
const String FINTOC_WEBVIEW_PATH = 'widget.html';
const String FINTOC_WEBVIEW_URL =
    'https://$FINTOC_WEBVIEW_HOST/$FINTOC_WEBVIEW_PATH';

const Map<String, FintocWidgetEventHandler> EVEN_MAP = {
  'event': FintocWidgetEventHandler.event,
};
