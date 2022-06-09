class GetLeaveTypeAndReasonAndNoteStatusTwo {
  int position = 0;
  int? ebdValue;
  String? ebdName;

  GetLeaveTypeAndReasonAndNoteStatusTwo({required this.position,this.ebdValue, this.ebdName});

  GetLeaveTypeAndReasonAndNoteStatusTwo.fromJson(Map<String, dynamic> json) {
    ebdValue = json['ebd_value'];
    ebdName = json['ebd_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ebd_value'] = this.ebdValue;
    data['ebd_name'] = this.ebdName;
    return data;
  }
}
