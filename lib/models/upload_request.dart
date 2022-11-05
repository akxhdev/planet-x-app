import 'dart:async';

import 'package:http/http.dart';

class UploadRequest extends MultipartRequest {
  final void Function(double)? onProgress;
  UploadRequest(super.method, super.url, {this.onProgress});

  int _count = 0;

  @override
  ByteStream finalize() {
    final byteStream = super.finalize();

    final st = StreamTransformer<List<int>, List<int>>.fromHandlers(
      handleData: (data, sink) {
        _count += data.length;
        if (onProgress != null) {
          onProgress!(_count / super.contentLength);
        }

        sink.add(data);
      },
    );

    return ByteStream(byteStream.transform(st));
  }
}
