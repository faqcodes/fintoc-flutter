enum FintocWidgetOptions {
  publicKey,
  holderType,
  product,
  country,
  institutionId,
  username,
  webhookUrl,
  widgetToken,
}

extension FintocWidgetOptionsExtension on FintocWidgetOptions {
  static const names = {
    FintocWidgetOptions.publicKey: 'public_key',
    FintocWidgetOptions.holderType: 'holder_type',
    FintocWidgetOptions.product: 'product',
    FintocWidgetOptions.country: 'country',
    FintocWidgetOptions.institutionId: 'institution_id',
    FintocWidgetOptions.username: 'username',
    FintocWidgetOptions.webhookUrl: 'webhook_url',
    FintocWidgetOptions.widgetToken: 'widget_token',
  };

  String? get name => names[this];
}
