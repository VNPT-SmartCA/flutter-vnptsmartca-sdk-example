extension StringExt on String {
  String operator -(String rhs) => replaceAll(rhs, '');

  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[\W_]).{8,}$',
    );
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    // final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    final phoneRegExp = RegExp("^(?:0[89])?[0-9]{10}\$");
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidPassport {
    final phoneRegExp = RegExp("[A-Z]{1}[0-9]{7}");
    return phoneRegExp.hasMatch(this);
  }
}
