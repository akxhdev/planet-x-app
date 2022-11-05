import 'package:flutter/material.dart';
import 'package:planetx/providers/image_upload_provider.dart';
import 'package:planetx/widgets/loading_spinner.dart';
import 'package:provider/provider.dart';

class ImageUploadProgress extends StatelessWidget {
  const ImageUploadProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ImageUploadProvider>(context, listen: false);

    return StreamBuilder<double>(
      stream: provider.progressStream,
      builder: (_, snapshot) => LoadingSpinner(value: 1),
      initialData: 0,
    );
  }
}
