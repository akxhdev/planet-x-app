import 'dart:io';

import 'package:planetx/models/auth_request.dart';
import 'package:planetx/models/auth_response.dart';
import 'package:planetx/services/authentication/auth_service.dart';
import 'package:http/http.dart' as http;

import '../commons.dart';

class AuthServiceImpl implements AuthService {
  static AuthServiceImpl? _instance;

  static AuthServiceImpl get instance => _instance ?? AuthServiceImpl._();

  AuthServiceImpl._();

  final _hostUri = Uri.parse(endPoint[Services.auth]!);

  @override
  Future<AuthResponse> authenticate(AuthRequest request) async {
    var response = await http.post(
      _hostUri,
      body: request.toJson(),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    if (response.statusCode == HttpStatus.forbidden) {
      throw Exception("Invalid Username or Password");
    }

    var authResponse = AuthResponse.fromJson(response.body);

    return authResponse;
  }
}
