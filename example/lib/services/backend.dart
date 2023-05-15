import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> paymentIntent(double amount) async {
  var body = '''
    {
        "amount": $amount,
        "currency": "CLP",
        "recipient_account": {
            "holder_id": "111111111",
            "number": "123123123",
            "type": "checking_account",
            "institution_id": "cl_banco_de_chile"
        }
    }
  ''';

  final response = await http.post(
    Uri.parse('https://api.fintoc.com/v1/payment_intents'),
    headers: <String, String>{
      'Authorization': 'sk_test_msmHabDN1cnu3oVsxijwzHhHRtcaxi7G',
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: body,
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

// RESPONSE:
// {
//     "id": "pi_V2q1ebS6MVX4wrpn",
//     "object": "payment_intent",
//     "widget_token": "pi_V2q1ebS6MVX4wrpn_sec_TspSBZg3S6NubjaoDoEESUtf",
//     "created_at": "2023-05-07T17:17:23Z",
//     "recipient_account": {
//         "holder_id": "111111111",
//         "number": "123123123",
//         "type": "checking_account",
//         "institution_id": "cl_banco_de_chile"
//     },
//     "sender_account": null,
//     "mode": "test",
//     "metadata": {},
//     "error_reason": null,
//     "amount": 5000,
//     "currency": "CLP",
//     "status": "created",
//     "reference_id": null,
//     "transaction_date": null
// }