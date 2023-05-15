import 'package:fintoc/fintoc.dart';

import 'backend.dart';

Future<Map<FintocWidgetOption, String>> initializeOptions(double amount) async {
  final value = await paymentIntent(amount);
  final widgetToken = value['widget_token'].toString();

  return Future.value(
    {
      FintocWidgetOption.publicKey: 'pk_test_E-3Tq4kF6UBx8E4HeES7Hu47cLJT7nxD',
      FintocWidgetOption.holderType: 'individual',
      FintocWidgetOption.product: 'payments',
      FintocWidgetOption.country: 'cl',
      FintocWidgetOption.institutionId: '',
      FintocWidgetOption.username: '',
      FintocWidgetOption.webhookUrl: '',
      FintocWidgetOption.widgetToken: widgetToken,
    },
  );
}
