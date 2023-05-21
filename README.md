# Fintoc Flutter

[![Pub Package](https://img.shields.io/pub/v/fintoc.svg)](https://pub.dartlang.org/packages/fintoc)
[![Dart Publish](https://github.com/faqcodes/fintoc-flutter/actions/workflows/publish.yml/badge.svg)](https://github.com/faqcodes/fintoc/actions/workflows/publish.yml)
[![Coverage Status](https://codecov.io/gh/faqcodes/fintoc-flutter/branch/main/graph/badge.svg?token=THZUBKL6ZR)](https://codecov.io/gh/faqcodes/fintoc-flutter)
[![GitHub Issues](https://img.shields.io/github/issues/faqcodes/fintoc-flutter.svg?branch=main)](https://github.com/faqcodes/fintoc-flutter/issues)
[![GitHub Forks](https://img.shields.io/github/forks/faqcodes/fintoc-flutter.svg?branch=main)](https://github.com/faqcodes/fintoc-flutter/network)
[![GitHub Stars](https://img.shields.io/github/stars/faqcodes/fintoc-flutter.svg?branch=main)](https://github.com/faqcodes/fintoc-flutter/stargazers)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

Use the <a href="https://docs.fintoc.com/docs/widget" target="_blank">Fintoc widget</a> within your Flutter application as a View.

## Installation

Install using flutter

```sh
flutter pub add fintoc
```

Install using dart

```sh
dart pub add fintoc
```

This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):

```dart
dependencies:
  fintoc: ^1.0.0
```

## Usage

`Fintoc Flutter` exports a component called `FintocWidgetView`. This is a Flutter component that creates the same WebView from [the native WebView documentation](https://docs.fintoc.com/docs/widget-webview-integration#how-it-works). To use the `Fintoc Flutter`, use the following _snippet_:

```dart
import 'package:fintoc/fintoc.dart';
```

After retrieving the `FintocWidgetView` component, you are ready to instantiate the widget:

```dart
final options = { ... };

final handlers = { ... };

void onSuccess(String data) {
  debugPrint('onSucess from FintocWidgetView: $data');
}

void onExit(String data) {
  debugPrint('onExit from FintocWidgetView: $data');
}

void onError(dynamic error) {
  debugPrint('onError from FintocWidgetView: $error');
}

void onEvent(String eventName) {
  debugPrint('onEvent from FintocWidgetView: $eventName');
  // Event Name: opened, payment_error, closed ...etc.
}

return Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Expanded(
      child: FintocWidgetView(
        options: options,
        handlers: handlers,
      ),
    ),
  ],
);
```

Here, `options` corresponds to an object with the parameters received by the widget (you can read more about these parameters [here](https://docs.fintoc.com/docs/widget-webview-integration#how-it-works)), and `onSuccess`, `onEvent` and `onExit` correspond to the WebView redirections detailed [here](https://docs.fintoc.com/docs/widget-webview-integration#webview-redirections).


## Acknowledgements

This implementation was written based on the input and experience of [**@marialuisaclaro**](https://github.com/marialuisaclaro) integrating the WebView using React Native, which served as a good starting point for the general idea of this library.