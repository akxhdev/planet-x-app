import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:planetx/models/upload_request.dart';
import 'package:http/http.dart' as http;

import '../commons.dart';
import 'image_upload_service.dart';

class ImageUploadServiceImpl implements ImageUploadService {
  static ImageUploadServiceImpl? _instance;

  static ImageUploadServiceImpl get instance =>
      _instance ?? ImageUploadServiceImpl._();

  final _hostUri = Uri.parse(endPoint[Services.imageUpload]!);

  ImageUploadServiceImpl._();

  @override
  Future<String> uploadImage(
      XFile file, void Function(double value) onProgress, String token) async {
    try {
      final multipartFile =
          await http.MultipartFile.fromPath('image', file.path);

      final imagePostRequest = UploadRequest(
        'POST',
        _hostUri,
        onProgress: onProgress,
      )
        ..headers[HttpHeaders.authorizationHeader] = "Brearer $token"
        ..headers[HttpHeaders.contentTypeHeader] = "multipart/form-data"
        ..files.add(multipartFile);

      final response = await imagePostRequest.send();

      // return image url
      return String.fromCharCodes(await response.stream.first);
    } catch (e) {
      rethrow;
    }
  }
}
