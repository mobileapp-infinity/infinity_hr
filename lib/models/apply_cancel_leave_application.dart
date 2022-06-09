class ApplyCancelLeaveApplication {
  String? msg;

  ApplyCancelLeaveApplication({this.msg});

  ApplyCancelLeaveApplication.fromJson(Map<String,dynamic> jsonData){
    msg = jsonData['msg'] ?? '';
  }
}

