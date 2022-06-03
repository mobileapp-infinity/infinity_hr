class version {
  int? _isForceUpdate;
  String? _appVersion;
  int? _isAppSpecial;
  String? _apkUrl;

  version(
      {int? isForceUpdate,
      String? appVersion,
      int? isAppSpecial,
      String? apkUrl}) {
    if (isForceUpdate != null) {
      this._isForceUpdate = isForceUpdate;
    }
    if (appVersion != null) {
      this._appVersion = appVersion;
    }
    if (isAppSpecial != null) {
      this._isAppSpecial = isAppSpecial;
    }
    if (apkUrl != null) {
      this._apkUrl = apkUrl;
    }
  }

  int? get isForceUpdate => _isForceUpdate;
  set isForceUpdate(int? isForceUpdate) => _isForceUpdate = isForceUpdate;
  String? get appVersion => _appVersion;
  set appVersion(String? appVersion) => _appVersion = appVersion;
  int? get isAppSpecial => _isAppSpecial;
  set isAppSpecial(int? isAppSpecial) => _isAppSpecial = isAppSpecial;
  String? get apkUrl => _apkUrl;
  set apkUrl(String? apkUrl) => _apkUrl = apkUrl;

  version.fromJson(Map<String, dynamic> json) {
    _isForceUpdate = json['is_force_update'];
    _appVersion = json['app_version'];
    _isAppSpecial = json['is_app_special'];
    _apkUrl = json['apk_url'];
  }
}
