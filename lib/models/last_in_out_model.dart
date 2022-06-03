class LastInOutModel {
  String? _lastDate;
  String? _lastIn;
  String? _lastOut;
  int? _isParent;
  int? _coffIsDisplay;

  LastInOutModel(
      {String? lastDate,
      String? lastIn,
      String? lastOut,
      int? isParent,
      int? coffIsDisplay}) {
    if (lastDate != null) {
      this._lastDate = lastDate;
    }
    if (lastIn != null) {
      this._lastIn = lastIn;
    }
    if (lastOut != null) {
      this._lastOut = lastOut;
    }
    if (isParent != null) {
      this._isParent = isParent;
    }
    if (coffIsDisplay != null) {
      this._coffIsDisplay = coffIsDisplay;
    }
  }

  String? get lastDate => _lastDate;
  set lastDate(String? lastDate) => _lastDate = lastDate;
  String? get lastIn => _lastIn;
  set lastIn(String? lastIn) => _lastIn = lastIn;
  String? get lastOut => _lastOut;
  set lastOut(String? lastOut) => _lastOut = lastOut;
  int? get isParent => _isParent;
  set isParent(int? isParent) => _isParent = isParent;
  int? get coffIsDisplay => _coffIsDisplay;
  set coffIsDisplay(int? coffIsDisplay) => _coffIsDisplay = coffIsDisplay;

  LastInOutModel.fromJson(Map<String, dynamic> json) {
    _lastDate = json['LastDate'];
    _lastIn = json['Last_in'];
    _lastOut = json['Last_Out'];
    _isParent = json['IsParent'];
    _coffIsDisplay = json['coff_is_display'];
  }
}
