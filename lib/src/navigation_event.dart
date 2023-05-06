import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'handler_enum.dart';

class NavigationEvent {
  static NavigationDelegate handler(
    Map<FintocWidgetEventHandler, Function>? eventHandlers,
  ) =>
      NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) {
          assert(eventHandlers == null);

          final uri = Uri.tryParse(request.url);

          if (uri == null || uri.isScheme('intent')) {
            debugPrint('onNavigationRequest: invalid schema or null');
            return NavigationDecision.prevent;
          }

          if (uri.isScheme('fintocwidget')) {
            debugPrint('onNavigationRequest: fintocwidget schema found');
            final event = uri.pathSegments.first;

            debugPrint('onNavigationRequest: call finctoc event');
            eventHandlers?[uri.host]?.call(event);

            return NavigationDecision.prevent;
          }

          return NavigationDecision.navigate;
        },
        onWebResourceError: (WebResourceError error) {
          eventHandlers?[FintocWidgetEventHandler.error]?.call(error);
        },
      );
}
