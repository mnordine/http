// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:html' show HttpRequest;

/// An exception caused by an error in a pkg/http client.
class ClientException implements Exception {
  final String message;
  final HttpRequest request;

  /// The URL of the HTTP request or response that failed.
  final Uri uri;

  ClientException(this.message, [this.uri, this.request]);

  String toString() {
    final buffer = StringBuffer(message);

    if (request != null) {
      buffer.write(', status code: ${request.status}, response text: ${request.responseText}');
    }

    return buffer.toString();
  }
}
