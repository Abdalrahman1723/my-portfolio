import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> sendEmailWithEmailJS({
  required String name,
  required String email,
  required String message,
}) async {
  const serviceId = 'service_q3avyan';
  const templateId = 'template_igz4d6p';
  const userId = 'g96HzaSMeWS7_josT'; // Sometimes called user_id or public key

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': {
        'from_name': name,
        'from_email': email,
        'message': message,
      },
    }),
  );
  log('Status: ${response.statusCode}');
  log('Body: ${response.body}');
  return response.statusCode == 200;
}
