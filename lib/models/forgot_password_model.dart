class ForgotPasswordModel {
  late String? _msg;

  String? get msg => _msg;

  ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    _msg = json['msg'];
  }
}
