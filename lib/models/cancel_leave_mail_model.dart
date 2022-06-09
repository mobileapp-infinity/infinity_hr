class CancelLeaveMail {
  String? Data;

  CancelLeaveMail({this.Data});

  CancelLeaveMail.fromJson(Map<String,dynamic> jsonData){
    Data = jsonData['Data'] ?? '';
  }
}

