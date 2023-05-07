import 'package:fintoc/main.dart';

class FintocSetup {
  Map<FintocWidgetOption, String>? _widgetOptions;

  Map<FintocWidgetOption, String> get widgetOptions {
    return _widgetOptions!;
  }

  FintocSetup() {
    _initializeOptions();
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
          'pi_V2q1ebS6MVX4wrpn_sec_TspSBZg3S6NubjaoDoEESUtf',
    };
  }
}
