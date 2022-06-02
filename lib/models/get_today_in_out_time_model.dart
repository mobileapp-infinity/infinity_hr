class GetTodayInOutTimeModel {
  String? _intime;
  String? _outtime;

  GetTodayInOutTimeModel({String? intime, String? outtime}) {
    if (intime != null) {
      this._intime = intime;
    }
    if (outtime != null) {
      this._outtime = outtime;
    }
  }

  String? get intime => _intime;
  set intime(String? intime) => _intime = intime;
  String? get outtime => _outtime;
  set outtime(String? outtime) => _outtime = outtime;

  GetTodayInOutTimeModel.fromJson(Map<String, dynamic> json) {
    _intime = json['intime'] ?? "-";
    _outtime = json['outtime'] ?? "-";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['intime'] = this._intime;
    data['outtime'] = this._outtime;
    return data;
  }
}
