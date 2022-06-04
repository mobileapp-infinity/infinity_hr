class ChangePasswordModel {
  String? _msg;

  ChangePasswordModel({String? msg}) {
    if (msg != null) {
      _msg = msg;
    }
  }

  String? get msg {
    return _msg;
  }

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    _msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = _msg;
    return data;
  }
}
