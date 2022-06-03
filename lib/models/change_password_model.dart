class ChangePasswordModel {
  String? _msg;

  ChangePasswordModel({String? msg}) {
    if (msg != null) {
      this._msg = msg;
    }
  }

  String? get msg => _msg;
  set msg(String? msg) => _msg = msg;

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    _msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this._msg;
    return data;
  }
}
