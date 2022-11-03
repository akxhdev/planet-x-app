import 'package:planetx/models/auth_request.dart';
import 'package:planetx/models/auth_response.dart';

abstract class AuthService {
  Future<AuthResponse> authenticate(AuthRequest request);
}
