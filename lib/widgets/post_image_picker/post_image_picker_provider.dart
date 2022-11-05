import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planetx/pages/new_post/new_post_page_provider.dart';

class PostImagePickerProvider with ChangeNotifier {
  final Function(NewPostForm, XFile?) onChangeField;

  XFile? _imageFile;

  PostImagePickerProvider({required this.onChangeField});

  set imageFile(XFile? imageFile) {
    _imageFile = imageFile;
    onChangeField(NewPostForm.image, _imageFile);
    notifyListeners();
  }

  XFile? get imageFile => _imageFile;
}
