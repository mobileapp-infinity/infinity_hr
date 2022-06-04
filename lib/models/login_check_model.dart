class LoginCheckModel {
  int? _status;
  int? _usrmId;
  String? _empCode;
  String? _usrmName;
  String? _usrmDisName;
  String? _fullName;
  int? _compId;
  void _usrmBrmId;
  String? _comName;
  String? _branch;
  String? _department;
  String? _designation;
  String? _finYear;
  int? _finId;
  String? _finStartDate;
  String? _finEndDate;
  int? _empId;
  String? _reportingto;
  void _userphoto;
  String? _personalEmail;
  String? _officeEmail;
  String? _mobileno;
  String? _joiningDate;

  LoginCheckModel(
      {int? status,
      int? usrmId,
      String? empCode,
      String? usrmName,
      String? usrmDisName,
      String? fullName,
      int? compId,
      void usrmBrmId,
      String? comName,
      String? branch,
      String? department,
      String? designation,
      String? finYear,
      int? finId,
      String? finStartDate,
      String? finEndDate,
      int? empId,
      String? reportingto,
      void userphoto,
      String? personalEmail,
      String? officeEmail,
      String? mobileno,
      String? joiningDate}) {
    if (status != null) {
      _status = status;
    }
    if (usrmId != null) {
      _usrmId = usrmId;
    }
    if (empCode != null) {
      _empCode = empCode;
    }
    if (usrmName != null) {
      _usrmName = usrmName;
    }
    if (usrmDisName != null) {
      _usrmDisName = usrmDisName;
    }
    if (fullName != null) {
      _fullName = fullName;
    }
    if (compId != null) {
      _compId = compId;
    }

    if (comName != null) {
      _comName = comName;
    }
    if (branch != null) {
      _branch = branch;
    }
    if (department != null) {
      _department = department;
    }
    if (designation != null) {
      _designation = designation;
    }
    if (finYear != null) {
      _finYear = finYear;
    }
    if (finId != null) {
      _finId = finId;
    }
    if (finStartDate != null) {
      _finStartDate = finStartDate;
    }
    if (finEndDate != null) {
      _finEndDate = finEndDate;
    }
    if (empId != null) {
      _empId = empId;
    }
    if (reportingto != null) {
      _reportingto = reportingto;
    }

    if (personalEmail != null) {
      _personalEmail = personalEmail;
    }
    if (officeEmail != null) {
      _officeEmail = officeEmail;
    }
    if (mobileno != null) {
      _mobileno = mobileno;
    }
    if (joiningDate != null) {
      _joiningDate = joiningDate;
    }
  }

  int? get status => _status;
  int? get usrmId => _usrmId;
  String? get empCode => _empCode;
  String? get usrmName => _usrmName;
  String? get usrmDisName => _usrmDisName;
  String? get fullName => _fullName;
  int? get compId => _compId;
  void get usrmBrmId => _usrmBrmId;
  String? get comName => _comName;
  String? get branch => _branch;
  String? get department => _department;
  String? get designation => _designation;
  String? get finYear => _finYear;
  int? get finId => _finId;
  String? get finStartDate => _finStartDate;
  String? get finEndDate => _finEndDate;
  int? get empId => _empId;
  String? get reportingto => _reportingto;
  void get userphoto => _userphoto;
  String? get personalEmail => _personalEmail;
  String? get officeEmail => _officeEmail;
  String? get mobileno => _mobileno;
  String? get joiningDate => _joiningDate;

  LoginCheckModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _usrmId = json['usrm_id'];
    _empCode = json['emp_code'];
    _usrmName = json['usrm_name'];
    _usrmDisName = json['usrm_dis_name'];
    _fullName = json['FullName'];
    _compId = json['comp_id'];
    _comName = json['com_name'];
    _branch = json['Branch'];
    _department = json['Department'];
    _designation = json['Designation'];
    _finYear = json['fin_year'];
    _finId = json['fin_id'];
    _finStartDate = json['fin_start_date'];
    _finEndDate = json['fin_end_date'];
    _empId = json['emp_id'];
    _reportingto = json['Reportingto'];
    _personalEmail = json['Personal_email'];
    _officeEmail = json['office_email'];
    _mobileno = json['mobileno'];
    _joiningDate = json['joining_date'];
  }
}
