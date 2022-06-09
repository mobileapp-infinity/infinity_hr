class GetLeaveTypeAndReasonAndNoteStatusOne {
  int position = 0;
  int? id;
  String? ltmLeaveName;

    GetLeaveTypeAndReasonAndNoteStatusOne({required this.position,this.id, this.ltmLeaveName});

  GetLeaveTypeAndReasonAndNoteStatusOne.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ltmLeaveName = json['ltm_leave_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ltm_leave_name'] = this.ltmLeaveName;
    return data;
  }
}
