import 'package:planetx/models/alien.dart';
import 'package:planetx/models/create_alien_request.dart';
import 'package:planetx/models/update_alien_request.dart';

abstract class AlienService {
  Future<Alien> createAlien(CreateAlienRequest request, String token);
  Future<Alien> updaetAlien(UpdateAlienRequest request, String token);
}
