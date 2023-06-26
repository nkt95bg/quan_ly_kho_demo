// import 'package:viis/generated/l10n.dart';

class Validator {
//   static final RegExp _phoneRegex = RegExp(r'(\+84|0)\d{9}$');
//   static final RegExp _emailRegex = RegExp(
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

//   String? checkPhoneNumber(String phoneNumber) {
//     if (phoneNumber.trim().isEmpty) {
//       return S.current.please_input_phone_number;
//     } else if (!_phoneRegex.hasMatch(phoneNumber.trim())) {
//       return S.current.phone_not_valid;
//     } else {
//       return null;
//     }
//   }

//   String? checkFullName(String value) {
//     if (value.trim().isEmpty) {
//       return S.current.please_input_full_name;
//     } else {
//       return null;
//     }
//   }

//   String? checkNameDevice(String value) {
//     if (value.trim().isEmpty) {
//       return "Vui lòng nhập tên hẹn giờ";
//     } else {
//       return null;
//     }
//   }

//   String? checkPass(String value) {
//     if (value.trim().isEmpty) {
//       return S.current.please_input_password;
//     }
//     if (value.trim().length < 6) {
//       return S.current.password_short;
//     }
//     return null;
//   }

//   String? checkOldPass(String value) {
//     if (value.trim().isEmpty) {
//       return S.current.please_input_password;
//     } else if (value.length < 6) {
//       return S.current.pass_valid;
//     } else {
//       return null;
//     }
//   }

//   String? checkNewPass(String value) {
//     if (value.trim().isEmpty) {
//       return S.current.please_input_password;
//     } else if (value.length < 6) {
//       return S.current.pass_valid;
//     } else {
//       return null;
//     }
//   }

//   String? checkConfirmPass(String newPass, String confirmPass) {
//     if (confirmPass.trim().isEmpty) {
//       return S.current.please_input_password;
//     } else if (confirmPass != newPass) {
//       return S.current.pass_not_match;
//     } else {
//       return null;
//     }
//   }

//   String? checkEmail(String email) {
//     if (email.isEmpty) {
//       return S.current.please_input_email;
//     } else if (!_emailRegex.hasMatch(email.trim())) {
//       return S.current.email_not_valid;
//     } else {
//       return null;
//     }
//   }

//   String? checkAccount(String account) {
//     if (account.isEmpty) {
//       return S.current.please_input_account;
//     } else {
//       return null;
//     }
//   }

//   String? checkName(String account) {
//     if (account.isEmpty) {
//       return S.current.please_input_account_name;
//     } else {
//       return null;
//     }
//   }

  String? checkRGB(int value) {
    if (value.toString().isEmpty) {
      return "Vui lòng nhập giá trị";
    }
    if (value < 0 && value > 255) {
      return "Giá trị không hợp lệ";
    } else {
      return null;
    }
  }

  String? checkRequired(String? value) {
    if (value == '' || value == null) {
      return "Vui lòng nhập giá trị";
    }
    return null;
  }
}
