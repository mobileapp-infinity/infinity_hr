import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommonUtils {

  static final String ANNOUNCEMENT_FOR_FACULTY = "1";
  static final String ANNOUNCEMENT_FOR_STUDENT = "2";

  static const int ROW_PER_PAGE = 25;
  static const String FOLDER_NAME = 'Infinity HR';
  static const int LOGIN_TYPE_FACULTY = 1;
  static const int LOGIN_TYPE_STUDENT = 2;

  static const int CONNECTION_TIME_OUT_IN_MILL_SEC = 180000;
  static const int RECEIVE_TIME_OUT_IN_MILL_SEC = 180000;

  static const String FONT_FAMILY_UBUNTU_REGULAR = "Ubuntu-Regular";
  static const String FONT_FAMILY_UBUNTU_MEDIUM = "Ubuntu-Medium";
  static const String FONT_FAMILY_UBUNTU_Bold = "Ubuntu-Bold";
  static const String RESET_PASS_USER_ID = "ResetPassUserId";
  static const String RESET_PASS_INSTITUTE_ID = "ResetPassInstituteId";
  static const String FORGOT_PASSWORD_USER_NAME = "ForgotPasswordUserName";

  static const String FORCE_UPDATE = "ForceUpdate";
  static const String OPTIONAL_UPDATE = "OptionalUpdate";

  static const String FACULTY_OR_STUDENT = "facultyOrStudent";
  static const String INSTITUTE_ID_FOR_FORGET_PASSWORD =
      "InstituteIdForForgetPassword";
  static const String IM_OTP_BASE_FORGET_PASSWORD = "imOtpBasedForgotPassword";

  static const double FONT_SIZE_8 = 8.0;
  static const double FONT_SIZE_10 = 10.0;
  static const double FONT_SIZE_11 = 11.0;
  static const double FONT_SIZE_12 = 12.0;
  static const double FONT_SIZE_13 = 13.0;
  static const double FONT_SIZE_14 = 14.0;
  static const double FONT_SIZE_16 = 16.0;
  static const double FONT_SIZE_18 = 18.0;
  static const double FONT_SIZE_20 = 20.0;
  static const double FONT_SIZE_22 = 22.0;
  static const double FONT_SIZE_24 = 24.0;
  static const double FONT_SIZE_26 = 26.0;
  static const double FONT_SIZE_28 = 28.0;
  static const double FONT_SIZE_30 = 30.0;

  static const String INSTITUTE_ID_FOR_VERIFY_OTP = "InstituteIdForVerifyOtp";
  static const String USERNAME_FOR_VERIFY_OTP = "UsernameForVerifyOtp";
  static const String USER_ID_VERIFY_OTP = "UserIdForVerifyOtp";
  static const String ENTERED_MOBILE_NO = "EnteredMobileNo";

  static String generateRandom6DigitOTP() {
    int min = 100000; //min and max values act as your 6 digit range
    int max = 999999;
    var randomizer = new Random();
    var rNum = min + randomizer.nextInt(max - min);
    return rNum.toString();
  }

  static bool checkIsEmptyOrNullForStringAndInt(Object object) {
    if (object == null) {
      return true;
    } else if (object.toString().isEmpty) {
      return true;
    }
    return false;
  }

  static int getMonthNoFromName(String monthName) {
    switch (monthName) {
      case "JANUARY":
        return 1;
      case "FEBRUARY":
        return 2;
      case "MARCH":
        return 3;
      case "APRIL":
        return 4;
      case "MAY":
        return 5;
      case "JUNE":
        return 6;
      case "JULY":
        return 7;
      case "AUGUST":
        return 8;
      case "SEPTEMBER":
        return 9;
      case "OCTOBER":
        return 10;
      case "NOVEMBER":
        return 11;
      case "DECEMBER":
        return 12;
    }
    return -1;
  }

  static int getMonthNoFromShortName(String monthName) {
    switch (monthName) {
      case "Jan":
        return 1;
      case "Feb":
        return 2;
      case "Mar":
        return 3;
      case "Apr":
        return 4;
      case "May":
        return 5;
      case "Jun":
        return 6;
      case "Jul":
        return 7;
      case "Aug":
        return 8;
      case "Sep":
        return 9;
      case "Oct":
        return 10;
      case "Nov":
        return 11;
      case "Dec":
        return 12;
    }
    return -1;
  }

  // -----------------------------New Utils Method For Converting Month No to Month Name and Formate Date According to Design----------Remish Varsani
  static String getMonthNameFromNumberForCalenderOnly(int monthNo) {
    String monthName = "";
    switch (monthNo) {
      case 0:
        monthName = "JANUARY";
        break;
      case 1:
        monthName = "FEBRUARY";
        break;
      case 2:
        monthName = "MARCH";
        break;
      case 3:
        monthName = "APRIL";
        break;
      case 4:
        monthName = "MAY";
        break;
      case 5:
        monthName = "JUNE";
        break;
      case 6:
        monthName = "JULY";
        break;
      case 7:
        monthName = "AUGUST";
        break;
      case 8:
        monthName = "SEPTEMBER";
        break;
      case 9:
        monthName = "OCTOBER";
        break;
      case 10:
        monthName = "NOVEMBER";
        break;
      case 11:
        monthName = "DECEMBER";
        break;
    }
    return monthName;
  }

  static String getMonthSortNameFromNumberForCalenderOnly(int monthNo) {
    String monthName = "";
    switch (monthNo) {
      case 1:
        monthName = "Jan";
        break;
      case 2:
        monthName = "Feb";
        break;
      case 3:
        monthName = "Mar";
        break;
      case 4:
        monthName = "Apr";
        break;
      case 5:
        monthName = "May";
        break;
      case 6:
        monthName = "Jun";
        break;
      case 7:
        monthName = "Jul";
        break;
      case 8:
        monthName = "Aug";
        break;
      case 9:
        monthName = "Sep";
        break;
      case 10:
        monthName = "Oct";
        break;
      case 11:
        monthName = "Nov";
        break;
      case 12:
        monthName = "Dec";
        break;
    }
    return monthName;
  }

  static String getWeekDayName(DateTime calDate) {
    return DateFormat('EEEE').format(calDate);
  }

  static const color_array_50 = [
    const Color(0xFFffebee),
    const Color(0xFFe8f5e9),
    const Color(0xFFe8eaf6),
    const Color(0xFFefebe9),
    const Color(0xFFeceff1),
    const Color(0xFFf3e5f5),
    const Color(0xFFfce4ec),
    const Color(0xFFede7f6),
    const Color(0xFFe3f2fd),
    const Color(0xFFe1f5fe),
    const Color(0xFFe0f7fa),
    const Color(0xFFe0f2f1),
    const Color(0xFFf1f8e9),
    const Color(0xFFf9fbe7),
    const Color(0xFFfffde7),
    const Color(0xFFfff8e1),
    const Color(0xFFfff3e0),
    const Color(0xFFfbe9e7),
    const Color(0xFFfafafa),
    const Color(0xFFffebee),
    const Color(0xFFe8f5e9),
    const Color(0xFFe8eaf6),
    const Color(0xFFefebe9),
    const Color(0xFFeceff1),
    const Color(0xFFf3e5f5),
    const Color(0xFFfce4ec),
    const Color(0xFFede7f6),
    const Color(0xFFe3f2fd),
    const Color(0xFFe1f5fe),
    const Color(0xFFe0f7fa),
    const Color(0xFFe0f2f1),
    const Color(0xFFf1f8e9),
    const Color(0xFFf9fbe7),
    const Color(0xFFfffde7),
    const Color(0xFFfff8e1),
    const Color(0xFFfff3e0),
    const Color(0xFFfbe9e7),
    const Color(0xFFfafafa),
  ];


  static const color_array_400 = [
    const Color(0xFFef5350),
    const Color(0xFF66bb6a),
    const Color(0xFF5c6bc0),
    const Color(0xFF8d6e63),
    const Color(0xFF78909c),
    const Color(0xFFab47bc),
    const Color(0xFFec407a),
    const Color(0xFF7e57c2),
    const Color(0xFF42a5f5),
    const Color(0xFF29b6f6),
    const Color(0xFF26c6da),
    const Color(0xFF26a69a),
    const Color(0xFF9ccc65),
    const Color(0xFFd4e157),
    const Color(0xFFffee58),
    const Color(0xFFffca28),
    const Color(0xFFffa726),
    const Color(0xFFff7043),
    const Color(0xFFbdbdbd),
    const Color(0xFFef5350),
    const Color(0xFF66bb6a),
    const Color(0xFF5c6bc0),
    const Color(0xFF8d6e63),
    const Color(0xFF78909c),
    const Color(0xFFab47bc),
    const Color(0xFFec407a),
    const Color(0xFF7e57c2),
    const Color(0xFF42a5f5),
    const Color(0xFF29b6f6),
    const Color(0xFF26c6da),
    const Color(0xFF26a69a),
    const Color(0xFF9ccc65),
    const Color(0xFFd4e157),
    const Color(0xFFffee58),
    const Color(0xFFffca28),
    const Color(0xFFffa726),
    const Color(0xFFff7043),
    const Color(0xFFbdbdbd),
  ];


  static const String Repeater_Exam_Instruction_From_1_To_5 =
      '1. Candidate has to submit supplementary examination form & fees semester wise.\n' +
      '2. Candidate Will not able to make any changes in examination form after fees payment.\n' +
      '3. Submission of false / incomplete information will attract rejection of the examination form.\n' +
      '4. Candidate has to apply for submission of supplementary examination form within given time limit.\n' +
      '5. Out of the given time limit; submission of examination form is not possible in ant case.\n';

  static const String Repeater_Exam_Instruction_6 = '6. While the process of online fee payment, if the amount of fee is deducted from your account and yet the receipt id not generated then please wait for next 24 hours OR Call on 9099076153, 9099076166.';


  static const String INSTRUCTION_1 = "Candidate has to submit supplementary examination form & fees semester wise.";
  static const String INSTRUCTION_2 = "Candidate will not able to make any changes in examination from after fee payments.";
  static const String INSTRUCTION_3 = "Submission of false/incomplete information will attract rejection of the examination form.";
  static const String INSTRUCTION_4 = "Candidate has to apply for submission of  supplementary examination form within given time limit.";
  static const String INSTRUCTION_5 = "Out of the given time limit; submission of examination form is not possible in ant case.";
  static const String INSTRUCTION_6 = "While the process of online fee payment, if the amount of fee is deducted from your account and yet the receipt id not generated then please wait for next 24 hours OR Call on 9099076153, 9099076166.";
}
