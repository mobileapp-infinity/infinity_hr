class EmployeeLeaveBalanceModel {
  String? balance;

  EmployeeLeaveBalanceModel({this.balance});

  EmployeeLeaveBalanceModel.fromJson(Map<String,dynamic> jsonData){
    balance = jsonData['balance'] ?? '';
  }
}

class LeaveListModel{
  dynamic? SrNo;
  dynamic? id;
  dynamic? From_date;
  dynamic? To_date;
  dynamic? Leave_Status;
  LeaveListModel({this.SrNo,this.id,this.From_date,this.To_date,this.Leave_Status});


  LeaveListModel.fromJson(Map<String,dynamic> jsonData){
    SrNo = jsonData['SrNo'] ?? '';
    id = jsonData['id'] ?? '';
    From_date = jsonData['From_date'] ?? '';
    To_date = jsonData['To_date'] ?? '';
    Leave_Status = jsonData['Leave_Status'] ?? '';
  }
}