import 'dart:io';

import 'package:planetx/models/alien.dart';
import 'package:planetx/models/update_alien_request.dart';
import 'package:planetx/models/create_alien_request.dart';
import 'package:planetx/services/alien/alien_service.dart';
import 'package:http/http.dart' as http;
import 'package:planetx/services/commons.dart';

class AlienServiceImpl implements AlienService {
  final _hostUri = Uri.parse(endPoint[Services.alien]!);

  @override
  Future<Alien> createAlien(CreateAlienRequest request, String token) async {
    var response = await http.post(
      _hostUri,
      body: request.toJson(),
      headers: {HttpHeaders.authorizationHeader: token},
    );

    return Alien.fromJson(response.body);
  }

  @override
  Future<Alien> updaetAlien(UpdateAlienRequest request, String token) async {
    var response = await http.patch(
      _hostUri,
      body: request.toJson(),
      headers: {HttpHeaders.authorizationHeader: token},
    );

    return Alien.fromJson(response.body);
  }
}
