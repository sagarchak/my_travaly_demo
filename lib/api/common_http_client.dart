import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_travaly_demo/controller/home_controller.dart';

import 'package:my_travaly_demo/enum/http_method.dart';
import 'package:http/http.dart' as https;

class CommonHttpsClient {
  Map<String, String> headers = <String, String>{};
  Map<String, dynamic>? body = <String, dynamic>{};
  String url = '';
  final _authToken = '71523fdd8d26f585315b4233e39d9263';
  String visitor_token = '';
  HttpMethod method = HttpMethod.Post;
  bool showLoading = false;

  CommonHttpsClient(
    this.url, {
    this.body,
    this.method = HttpMethod.Post,
    this.showLoading = false,
    this.visitor_token = '',
  });

  initHeaders() {
    headers = visitor_token.isNotEmpty
        ? {
            'authtoken': _authToken,
            'visitorToken': visitor_token,
            // 'Accept': 'application/json',
          }
        : {
            'authtoken': _authToken,
            // 'Accept': 'application/json',
          };
    // Initialize headers here
  }

  initBody() {
    body ??= <String, dynamic>{};
    // Initialize body here
  }

  Future<Response?> getResponse() async {
    initHeaders();
    initBody();
    https.Response? response;
    if (body != null && body!.isNotEmpty && url.isNotEmpty) {
      switch (method) {
        case HttpMethod.Get:
          response = await https.get(
            Uri.parse(url),
            headers: headers,
          );
          break;
        default:
          // If body is a Map (JSON), encode it and set content-type
          dynamic requestBody = jsonEncode(body);

          response = await https.post(
            Uri.parse(url),
            headers: headers,
            body: requestBody,
          );
      }
    }
    return response;
  }
}
