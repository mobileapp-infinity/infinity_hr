class GetEmployePendingApproval {
  String? _webLink;
  String? _appType;
  int? _penCount;

  GetEmployePendingApproval({String? webLink, String? appType, int? penCount}) {
    if (webLink != null) {
      this._webLink = webLink;
    }
    if (appType != null) {
      this._appType = appType;
    }
    if (penCount != null) {
      this._penCount = penCount;
    }
  }

  String? get webLink => _webLink;
  set webLink(String? webLink) => _webLink = webLink;
  String? get appType => _appType;
  set appType(String? appType) => _appType = appType;
  int? get penCount => _penCount;
  set penCount(int? penCount) => _penCount = penCount;

  GetEmployePendingApproval.fromJson(Map<String, dynamic> json) {
    _webLink = json['WebLink'];
    _appType = json['app_type'];
    _penCount = json['pen_count'];
  }
}
