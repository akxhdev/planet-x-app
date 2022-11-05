import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planetx/services/image_upload/image_upload_service.dart';

class ImageUploadProvider with ChangeNotifier {
  final ImageUploadService imageUploadService;
  final String token;

  final StreamController<double> _progressStreamController =
      StreamController.broadcast();

  StreamSink<double> get _progressStreamSink => _progressStreamController.sink;
  Stream<double> get progressStream => _progressStreamController.stream;

  ImageUploadProvider({
    required this.imageUploadService,
    required this.token,
  });

  void onProgress(value) => _progressStreamSink.add(value);

  Future<String> uploadImage(XFile file) async {
    _progressStreamSink.add(0);

    final imageUrl =
        await imageUploadService.uploadImage(file, onProgress, token);

    return imageUrl;
  }

  @override
  void dispose() {
    _progressStreamController.close();
    super.dispose();
  }
}
