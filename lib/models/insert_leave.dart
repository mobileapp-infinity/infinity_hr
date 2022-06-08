class InertLeave {
   String? msg;

   InertLeave({this.msg});

   InertLeave.fromJson(Map<String,dynamic> jsonData){
    msg = jsonData['msg'] ?? '';
  }
}

