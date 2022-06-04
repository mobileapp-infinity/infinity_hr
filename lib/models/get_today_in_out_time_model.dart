class GetTodayInOutTimeModel {
  String? _inTime;
  String? _outTime;

  GetTodayInOutTimeModel({String? inTime, String? outTime}) {
    if (intime != null) {
      _inTime = intime;
    }
    if (outtime != null) {
      _outTime = outtime;
    }
  }

  String? get intime => _inTime;
  String? get outtime => _outTime;

  GetTodayInOutTimeModel.fromJson(Map<String, dynamic> json) {
    _inTime = json['intime'] ?? "-";
    _outTime = json['outtime'] ?? "-";
  }
}
