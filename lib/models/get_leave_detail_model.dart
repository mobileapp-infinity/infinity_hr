class LeaveDetail {
  int? id;
  int? leaveStatus;
  String? elaIsApproveValue;
  int? elaEmpId;
  String? elaEmpName;
  dynamic? elaLeaveTypeId;
  dynamic? leaveBalance;
  String? elaFromDnt;
  String? elaToDnt;
  dynamic? elaDays;
  String? elaReason;
  int? elaLeaveReason;
  String? elaAddressWhileOnLeave;
  String? elaContactNo;
  int? elaLoadAdjusted;
  int? elaEmergencyLeave;
  String? approvedby;

  LeaveDetail(
      {this.id,
        this.leaveStatus,
        this.elaIsApproveValue,
        this.elaEmpId,
        this.elaEmpName,
        this.elaLeaveTypeId,
        this.leaveBalance,
        this.elaFromDnt,
        this.elaToDnt,
        this.elaDays,
        this.elaReason,
        this.elaLeaveReason,
        this.elaAddressWhileOnLeave,
        this.elaContactNo,
        this.elaLoadAdjusted,
        this.elaEmergencyLeave,
        this.approvedby});

  LeaveDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leaveStatus = json['Leave_Status'];
    elaIsApproveValue = json['ela_is_approve_value'];
    elaEmpId = json['ela_emp_id'];
    elaEmpName = json['ela_emp_name'];
    elaLeaveTypeId = json['ela_leave_type_id'];
    leaveBalance = json['leave_balance'];
    elaFromDnt = json['ela_from_dnt'];
    elaToDnt = json['ela_to_dnt'];
    elaDays = json['ela_days'];
    elaReason = json['ela_reason'];
    elaLeaveReason = json['ela_leave_reason'];
    elaAddressWhileOnLeave = json['ela_address_while_on_leave'];
    elaContactNo = json['ela_contact_no'];
    elaLoadAdjusted = json['ela_load_adjusted'];
    elaEmergencyLeave = json['ela_emergency_leave'];
    approvedby = json['Approvedby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Leave_Status'] = this.leaveStatus;
    data['ela_is_approve_value'] = this.elaIsApproveValue;
    data['ela_emp_id'] = this.elaEmpId;
    data['ela_emp_name'] = this.elaEmpName;
    data['ela_leave_type_id'] = this.elaLeaveTypeId;
    data['leave_balance'] = this.leaveBalance;
    data['ela_from_dnt'] = this.elaFromDnt;
    data['ela_to_dnt'] = this.elaToDnt;
    data['ela_days'] = this.elaDays;
    data['ela_reason'] = this.elaReason;
    data['ela_leave_reason'] = this.elaLeaveReason;
    data['ela_address_while_on_leave'] = this.elaAddressWhileOnLeave;
    data['ela_contact_no'] = this.elaContactNo;
    data['ela_load_adjusted'] = this.elaLoadAdjusted;
    data['ela_emergency_leave'] = this.elaEmergencyLeave;
    data['Approvedby'] = this.approvedby;
    return data;
  }
}
