class LeaveDetail {
  String? id;
  String? Leave_Status;
  String? ela_is_approve_value;
  String? ela_emp_id;
  String? ela_emp_name;
  String? ela_leave_type_id;
  String? leave_balance;
  String? ela_from_dnt;
  String? ela_to_dnt;
  String? ela_days;
  String? ela_reason;
  String? ela_leave_reason;
  String? ela_address_while_on_leave;
  String? ela_contact_no;
  String? ela_load_adjusted;
  String? ela_emergency_leave;
  String? Approvedby;

  LeaveDetail(
      {this.id,
      this.Leave_Status,
      this.ela_is_approve_value,
      this.ela_emp_id,
      this.ela_emp_name,
      this.ela_leave_type_id,
      this.leave_balance,
      this.ela_from_dnt,
      this.ela_to_dnt,
      this.ela_days,
      this.ela_reason,
      this.ela_leave_reason,
      this.ela_address_while_on_leave,
      this.ela_contact_no,
      this.ela_load_adjusted,
      this.ela_emergency_leave,
      this.Approvedby});

  LeaveDetail.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'] ?? '';
    Leave_Status = jsonData['Leave_Status'] ?? '';
    ela_is_approve_value = jsonData['ela_is_approve_value'] ?? '';
    ela_emp_id = jsonData['ela_emp_id'] ?? '';
    ela_emp_name = jsonData['ela_emp_name'] ?? '';
    ela_leave_type_id = jsonData['ela_leave_type_id'] ?? '';
    leave_balance = jsonData['leave_balance'] ?? '';
    ela_from_dnt = jsonData['ela_from_dnt'] ?? '';
    ela_to_dnt = jsonData['ela_to_dnt'] ?? '';
    ela_days = jsonData['ela_days'] ?? '';
    ela_reason = jsonData['ela_reason'] ?? '';
    ela_leave_reason = jsonData['ela_leave_reason'] ?? '';
    ela_address_while_on_leave = jsonData['ela_address_while_on_leave'] ?? '';
    ela_contact_no = jsonData['ela_contact_no'] ?? '';
    ela_load_adjusted = jsonData['ela_load_adjusted'] ?? '';
    ela_emergency_leave = jsonData['ela_emergency_leave'] ?? '';
    Approvedby = jsonData['Approvedby'] ?? '';
  }
}
