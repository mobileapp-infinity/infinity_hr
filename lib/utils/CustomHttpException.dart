import 'package:flutter/cupertino.dart';

class CustomHttpException {
  final String? exceptionMsg;

  CustomHttpException({
    @required this.exceptionMsg,
  });

  @override
  String toString() {
    return exceptionMsg!;
  }
}
