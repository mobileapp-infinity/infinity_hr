class LoginCheckModel {
  int? _status;
  int? _usrmId;
  String? _empCode;
  String? _usrmName;
  String? _usrmDisName;
  String? _fullName;
  int? _compId;
  Null? _usrmBrmId;
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
  Null? _userphoto;
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
      Null? usrmBrmId,
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
      Null? userphoto,
      String? personalEmail,
      String? officeEmail,
      String? mobileno,
      String? joiningDate}) {
    if (status != null) {
      this._status = status;
    }
    if (usrmId != null) {
      this._usrmId = usrmId;
    }
    if (empCode != null) {
      this._empCode = empCode;
    }
    if (usrmName != null) {
      this._usrmName = usrmName;
    }
    if (usrmDisName != null) {
      this._usrmDisName = usrmDisName;
    }
    if (fullName != null) {
      this._fullName = fullName;
    }
    if (compId != null) {
      this._compId = compId;
    }
    if (usrmBrmId != null) {
      this._usrmBrmId = usrmBrmId;
    }
    if (comName != null) {
      this._comName = comName;
    }
    if (branch != null) {
      this._branch = branch;
    }
    if (department != null) {
      this._department = department;
    }
    if (designation != null) {
      this._designation = designation;
    }
    if (finYear != null) {
      this._finYear = finYear;
    }
    if (finId != null) {
      this._finId = finId;
    }
    if (finStartDate != null) {
      this._finStartDate = finStartDate;
    }
    if (finEndDate != null) {
      this._finEndDate = finEndDate;
    }
    if (empId != null) {
      this._empId = empId;
    }
    if (reportingto != null) {
      this._reportingto = reportingto;
    }
    if (userphoto != null) {
      this._userphoto = userphoto;
    }
    if (personalEmail != null) {
      this._personalEmail = personalEmail;
    }
    if (officeEmail != null) {
      this._officeEmail = officeEmail;
    }
    if (mobileno != null) {
      this._mobileno = mobileno;
    }
    if (joiningDate != null) {
      this._joiningDate = joiningDate;
    }
  }

  int? get status => _status;
  set status(int? status) => _status = status;
  int? get usrmId => _usrmId;
  set usrmId(int? usrmId) => _usrmId = usrmId;
  String? get empCode => _empCode;
  set empCode(String? empCode) => _empCode = empCode;
  String? get usrmName => _usrmName;
  set usrmName(String? usrmName) => _usrmName = usrmName;
  String? get usrmDisName => _usrmDisName;
  set usrmDisName(String? usrmDisName) => _usrmDisName = usrmDisName;
  String? get fullName => _fullName;
  set fullName(String? fullName) => _fullName = fullName;
  int? get compId => _compId;
  set compId(int? compId) => _compId = compId;
  Null? get usrmBrmId => _usrmBrmId;
  set usrmBrmId(Null? usrmBrmId) => _usrmBrmId = usrmBrmId;
  String? get comName => _comName;
  set comName(String? comName) => _comName = comName;
  String? get branch => _branch;
  set branch(String? branch) => _branch = branch;
  String? get department => _department;
  set department(String? department) => _department = department;
  String? get designation => _designation;
  set designation(String? designation) => _designation = designation;
  String? get finYear => _finYear;
  set finYear(String? finYear) => _finYear = finYear;
  int? get finId => _finId;
  set finId(int? finId) => _finId = finId;
  String? get finStartDate => _finStartDate;
  set finStartDate(String? finStartDate) => _finStartDate = finStartDate;
  String? get finEndDate => _finEndDate;
  set finEndDate(String? finEndDate) => _finEndDate = finEndDate;
  int? get empId => _empId;
  set empId(int? empId) => _empId = empId;
  String? get reportingto => _reportingto;
  set reportingto(String? reportingto) => _reportingto = reportingto;
  Null? get userphoto => _userphoto;
  set userphoto(Null? userphoto) => _userphoto = userphoto;
  String? get personalEmail => _personalEmail;
  set personalEmail(String? personalEmail) => _personalEmail = personalEmail;
  String? get officeEmail => _officeEmail;
  set officeEmail(String? officeEmail) => _officeEmail = officeEmail;
  String? get mobileno => _mobileno;
  set mobileno(String? mobileno) => _mobileno = mobileno;
  String? get joiningDate => _joiningDate;
  set joiningDate(String? joiningDate) => _joiningDate = joiningDate;

  LoginCheckModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _usrmId = json['usrm_id'];
    _empCode = json['emp_code'];
    _usrmName = json['usrm_name'];
    _usrmDisName = json['usrm_dis_name'];
    _fullName = json['FullName'];
    _compId = json['comp_id'];
    _usrmBrmId = json['usrm_brm_id'];
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
    _userphoto = json['userphoto'];
    _personalEmail = json['Personal_email'];
    _officeEmail = json['office_email'];
    _mobileno = json['mobileno'];
    _joiningDate = json['joining_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['usrm_id'] = this._usrmId;
    data['emp_code'] = this._empCode;
    data['usrm_name'] = this._usrmName;
    data['usrm_dis_name'] = this._usrmDisName;
    data['FullName'] = this._fullName;
    data['comp_id'] = this._compId;
    data['usrm_brm_id'] = this._usrmBrmId;
    data['com_name'] = this._comName;
    data['Branch'] = this._branch;
    data['Department'] = this._department;
    data['Designation'] = this._designation;
    data['fin_year'] = this._finYear;
    data['fin_id'] = this._finId;
    data['fin_start_date'] = this._finStartDate;
    data['fin_end_date'] = this._finEndDate;
    data['emp_id'] = this._empId;
    data['Reportingto'] = this._reportingto;
    data['userphoto'] = this._userphoto;
    data['Personal_email'] = this._personalEmail;
    data['office_email'] = this._officeEmail;
    data['mobileno'] = this._mobileno;
    data['joining_date'] = this._joiningDate;
    return data;
  }
}
