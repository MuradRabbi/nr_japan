class Users {
  Users({
    this.id,
    this.userId,
    this.roleId,
    this.name,
    this.email,
    this.phone,
    this.emailVerifiedAt,
    this.status,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.employeeType,
    this.employeeid,
    this.fatherName,
    this.motherName,
    this.personalEmail,
    this.secondaryContact,
    this.presentAddress,
    this.permanentAddress,
    this.departmentId,
    this.departmentUnitId,
    this.salaryGradeId,
    this.designationId,
    this.joiningDate,
    this.endDate,
    this.isReleased,
    this.releaseDate,
    this.salary,
    this.accountNumber,
    this.gender,
    this.maritalStatus,
    this.bloodGroup,
    this.nationality,
    this.haveProvidentFund,
    this.providentFundType,
    this.providentFundAmount,
    this.minimumDaysProvidentFund,
    this.taxDeductionId,
    this.reportingBossId,
    this.disbursementId,
  });

  int? id;
  int? userId;
  int ?roleId;
  String? name;
  String? email;
  String? phone;
  dynamic emailVerifiedAt;
  int? status;
  String? image;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  int? employeeType;
  String? employeeid;
  dynamic fatherName;
  dynamic motherName;
  dynamic personalEmail;
  dynamic secondaryContact;
  dynamic presentAddress;
  dynamic permanentAddress;
  int? departmentId;
  dynamic? departmentUnitId;
  int? salaryGradeId;
  dynamic designationId;
  String? joiningDate;
  dynamic endDate;
  int? isReleased;
  dynamic releaseDate;
  int? salary;
  dynamic accountNumber;
  int? gender;
  int? maritalStatus;
  int? bloodGroup;
  dynamic nationality;
  int? haveProvidentFund;
  int? providentFundType;
  int? providentFundAmount;
  int? minimumDaysProvidentFund;
  int? taxDeductionId;
  int? reportingBossId;
  int? disbursementId;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    userId: json["user_id"],
    roleId: json["role_id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    emailVerifiedAt: json["email_verified_at"],
    status: json["status"],
    image: json["image"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
    employeeType: json["employee_type"],
    employeeid: json["employeeid"],
    fatherName: json["father_name"],
    motherName: json["mother_name"],
    personalEmail: json["personal_email"],
    secondaryContact: json["secondary_contact"],
    presentAddress: json["present_address"],
    permanentAddress: json["permanent_address"],
    departmentId: json["department_id"],
    departmentUnitId: json["department_unit_id"],
    salaryGradeId: json["salary_grade_id"],
    designationId: json["designation_id"],
    joiningDate: json["joining_date"],
    endDate: json["end_date"],
    isReleased: json["is_released"],
    releaseDate: json["release_date"],
    salary: json["salary"],
    accountNumber: json["account_number"],
    gender: json["gender"],
    maritalStatus: json["marital_status"],
    bloodGroup: json["blood_group"],
    nationality: json["nationality"],
    haveProvidentFund: json["have_provident_fund"],
    providentFundType: json["provident_fund_type"],
    providentFundAmount: json["provident_fund_amount"],
    minimumDaysProvidentFund: json["minimum_days_provident_fund"],
    taxDeductionId: json["tax_deduction_id"],
    reportingBossId: json["reporting_boss_id"],
    disbursementId: json["disbursement_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "role_id": roleId,
    "name": name,
    "email": email,
    "phone": phone,
    "email_verified_at": emailVerifiedAt,
    "status": status,
    "image": image,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
    "employee_type": employeeType,
    "employeeid": employeeid,
    "father_name": fatherName,
    "mother_name": motherName,
    "personal_email": personalEmail,
    "secondary_contact": secondaryContact,
    "present_address": presentAddress,
    "permanent_address": permanentAddress,
    "department_id": departmentId,
    "department_unit_id": departmentUnitId,
    "salary_grade_id": salaryGradeId,
    "designation_id": designationId,
    "joining_date": joiningDate,
    "end_date": endDate,
    "is_released": isReleased,
    "release_date": releaseDate,
    "salary": salary,
    "account_number": accountNumber,
    "gender": gender,
    "marital_status": maritalStatus,
    "blood_group": bloodGroup,
    "nationality": nationality,
    "have_provident_fund": haveProvidentFund,
    "provident_fund_type": providentFundType,
    "provident_fund_amount": providentFundAmount,
    "minimum_days_provident_fund": minimumDaysProvidentFund,
    "tax_deduction_id": taxDeductionId,
    "reporting_boss_id": reportingBossId,
    "disbursement_id": disbursementId,
  };
}
