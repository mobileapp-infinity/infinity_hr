class GetLeaveTypeAndReasonAndNoteStatusThree {
  String? notes;

  GetLeaveTypeAndReasonAndNoteStatusThree({this.notes});

  GetLeaveTypeAndReasonAndNoteStatusThree.fromJson(Map<String, dynamic> json) {
    notes = json['Notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Notes'] = this.notes;
    return data;
  }
}
