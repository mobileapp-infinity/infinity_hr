class GetEmployeeInOutTime {
  int? id;
  String? elaFromDnt;
  String? fromTime;
  String? elaToDnt;
  String? toTime;

  GetEmployeeInOutTime(
      {this.id, this.elaFromDnt, this.fromTime, this.elaToDnt, this.toTime});

  GetEmployeeInOutTime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    elaFromDnt = json['ela_from_dnt'];
    fromTime = json['from_time'];
    elaToDnt = json['ela_to_dnt'];
    toTime = json['to_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ela_from_dnt'] = this.elaFromDnt;
    data['from_time'] = this.fromTime;
    data['ela_to_dnt'] = this.elaToDnt;
    data['to_time'] = this.toTime;
    return data;
  }
}
