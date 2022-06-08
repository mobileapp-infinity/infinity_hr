class GetEmployeeLeaveDays {
  String? days;
  String? msg;

  GetEmployeeLeaveDays({this.days, this.msg});

  GetEmployeeLeaveDays.fromJson(Map<String, dynamic> json) {
    days = json['days'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['days'] = this.days;
    data['msg'] = this.msg;
    return data;
  }
}
