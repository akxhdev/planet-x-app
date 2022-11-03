import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planetx/models/new_post_request.dart';

class NewPostPageProvider with ChangeNotifier {
  final _formData = <NewPostForm, dynamic>{
    NewPostForm.content: "",
    NewPostForm.image: null,
  };

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  void onChangeField(NewPostForm field, dynamic value) {
    _formData[field] = value;
    notifyListeners();
  }

  XFile? get image => _formData[NewPostForm.image];

  NewPostRequest? generatePostRequest(String alienId) {
    var formState = formKey.currentState;

    if (formState != null) {
      var isValid = formState.validate();

      if (isValid) {
        return NewPostRequest(
          content: _formData[NewPostForm.content]!,
          postedBy: alienId,
        );
      }
    }

    return null;
  }
}

enum NewPostForm { content, image }
