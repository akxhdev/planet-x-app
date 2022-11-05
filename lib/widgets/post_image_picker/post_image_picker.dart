import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planetx/widgets/error_text.dart';
import 'package:planetx/widgets/loading_spinner.dart';
import 'package:planetx/widgets/post_image_picker/post_image_picker_provider.dart';
import 'package:provider/provider.dart';

class PostImagePicker extends StatelessWidget {
  const PostImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostImagePickerProvider>(
      builder: (context, provider, child) {
        final imageFile = provider.imageFile;

        return InkWell(
          onTap: () async {
            final imagePicker = ImagePicker();

            final imageFile =
                await imagePicker.pickImage(source: ImageSource.gallery);

            if (imageFile == null) return;

            provider.imageFile = imageFile;
          },
          child: Stack(
            children: [
              const Center(child: Icon(Icons.add)),
              if (imageFile != null)
                FutureBuilder(
                  future: imageFile.readAsBytes(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.memory(
                            snapshot.data!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }

                    if (snapshot.hasError) {
                      return const ErrorText(
                          errorMessage: "Unable to load image");
                    }

                    return const LoadingSpinner();
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
