<h1 align="center">Fintoc Flutter</h1>

<p align="center">
    <em>
        Use the <a href="https://docs.fintoc.com/docs/widget" target="_blank">Fintoc widget</a> within your Flutter application as a View.
    </em>
</p>

## Installation

Install using flutter pub

```sh
flutter pub add fintoc_flutter
```

## Usage

`Fintoc Flutter` exports a single component called `FintocWidgetView`. This is a Flutter component that creates the same WebView from [the native WebView documentation](https://docs.fintoc.com/docs/widget-webview-integration#how-it-works). To use the Fintoc View, use the following _snippet_:

```dart
import 'package:fintoc/main.dart';
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

## Developing

## Acknowledgements

This implementation was written based on the input and experience of [**@marialuisaclaro**](https://github.com/marialuisaclaro) integrating the WebView using React Native, which served as a good starting point for the general idea of this library.