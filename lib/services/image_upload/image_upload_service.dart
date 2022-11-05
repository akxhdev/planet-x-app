import 'package:image_picker/image_picker.dart';

abstract class ImageUploadService {
  Future<String> uploadImage(
      XFile file, void Function(double) onProgress, String token);
}
