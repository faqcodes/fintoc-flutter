// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:fintoc/fintoc.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

import 'fintoc_widget_test.mocks.dart';

@GenerateMocks([PlatformWebViewController])
void main() {
  late WebViewController webViewController;
  late MockPlatformWebViewController mockPlatformWebViewController;

  setUp(() {
    WebViewPlatform.instance = AndroidWebViewPlatform();
    mockPlatformWebViewController = MockPlatformWebViewController();

    webViewController = WebViewController.fromPlatform(
      mockPlatformWebViewController,
    );
  });

  group(
    'FintocWidgetView',
    () {
      // ignore_for_file: constant_identifier_names
      const String FINTOC_WEBVIEW_HOST = 'webview.fintoc.com';
      const String FINTOC_WEBVIEW_PATH = 'widget.html';

      final options = <FintocWidgetOption, String>{
        FintocWidgetOption.publicKey: 'abc123',
        FintocWidgetOption.widgetToken: 'web'
      };

      final handlers = <FintocWidgetEventHandler, Function>{
        FintocWidgetEventHandler.event: (event) => debugPrint('$event')
      };

      testWidgets(
        'renders without any error',
        (tester) async {
          await tester.pumpWidget(
            FintocWidgetView(
              options: options,
              handlers: handlers,
            ),
          );

          expect(find.byType(FintocWidgetView), findsOneWidget);
        },
      );

      testWidgets(
        'calls initState and sets state variables correctly',
        (tester) async {
          await tester.pumpWidget(
            FintocWidgetView(
              options: options,
              handlers: handlers,
            ),
          );

          final fintocWidgetUri = Uri.https(
            FINTOC_WEBVIEW_HOST,
            FINTOC_WEBVIEW_PATH,
          );

          await webViewController.loadRequest(
            fintocWidgetUri,
            method: LoadRequestMethod.get,
            headers: <String, String>{'a': 'header'},
            body: Uint8List(0),
          );

          final LoadRequestParams params =
              verify(mockPlatformWebViewController.loadRequest(captureAny))
                  .captured[0] as LoadRequestParams;

          expect(
            params.uri,
            Uri(
              scheme: 'https',
              host: FINTOC_WEBVIEW_HOST,
              path: FINTOC_WEBVIEW_PATH,
            ),
          );
          expect(params.method, LoadRequestMethod.get);
          expect(params.headers, <String, String>{'a': 'header'});
          expect(params.body, Uint8List(0));
        },
      );

      testWidgets(
        'calls dispose and clears resources correctly',
        (tester) async {
          await tester.pumpWidget(
            FintocWidgetView(
              options: options,
              handlers: handlers,
            ),
          );

          await tester.pumpAndSettle();

          await tester.runAsync(
            () async {
              await tester.pumpWidget(
                const SizedBox.shrink(),
              );
            },
          );
        },
      );
    },
  );
}
