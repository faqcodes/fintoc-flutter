enum FintocWidgetOption {
  publicKey,
  holderType,
  product,
  country,
  institutionId,
  username,
  webhookUrl,
  widgetToken,
}

extension FintocWidgetOptionsExtension on FintocWidgetOption {
  static const names = {
    FintocWidgetOption.publicKey: 'public_key',
    FintocWidgetOption.holderType: 'holder_type',
    FintocWidgetOption.product: 'product',
    FintocWidgetOption.country: 'country',
    FintocWidgetOption.institutionId: 'institution_id',
    FintocWidgetOption.username: 'username',
    FintocWidgetOption.webhookUrl: 'webhook_url',
    FintocWidgetOption.widgetToken: 'widget_token',
  };

  String? get name => names[this];
}
