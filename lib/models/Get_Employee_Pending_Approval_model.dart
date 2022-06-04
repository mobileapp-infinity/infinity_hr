class GetEmployeePendingApproval {
  String? _webLink;
  String? _appType;
  int? _penCount;

  GetEmployeePendingApproval(
      {String? webLink, String? appType, int? penCount}) {
    if (webLink != null) {
      _webLink = webLink;
    }
    if (appType != null) {
      _appType = appType;
    }
    if (penCount != null) {
      _penCount = penCount;
    }
  }

  String? get webLink => _webLink;
  String? get appType => _appType;
  int? get penCount => _penCount;

  GetEmployeePendingApproval.fromJson(Map<String, dynamic> json) {
    _webLink = json['WebLink'];
    _appType = json['app_type'];
    _penCount = json['pen_count'];
  }
}
