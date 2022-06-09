class DeleteLeave {
  String? msg;

  DeleteLeave({this.msg});

  DeleteLeave.fromJson(Map<String,dynamic> jsonData){
    msg = jsonData['msg'] ?? '';
  }
}

