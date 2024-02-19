class AppValidator {
  static String? name(
    String? value, {
    String? first,
    String? last,
    int minLength = 3,
  }) {
    if (first == null || first.isEmpty) {
      return 'First name cannot be empty';
    }
    if (last == null || last.isEmpty) {
      return 'Last name cannot be empty';
    }
    if (value == null || value.isEmpty) {
      return 'Name filed cannot be empty';
    } else if (first.length < minLength || last.length < minLength) {
      return 'Name cannot be less than $minLength characters';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
      //  return "Email field cannot be empty";
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? username(String? value) {
    if (value == null || value.isEmpty) {
      return "Username field cannot be empty";
    } else if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Username should not include special characters i.e /@!#\$%";
    }

    return null;
  }

  static String? password(String? password, {int minLength = 8}) {
    if (password == null || password.isEmpty) {
      return 'Please enter a password';
      // return "password field cannot be empty";
    } else if (password.length < minLength) {
      return 'Password must be at least $minLength characters long';
      // return "Password should have min $minimumLength characters";
    } else if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    } else if (!password.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    } else if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    } else if (!password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  static String? confirmPwd(
      {String? value, String? newPwdValue, int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return null;
    } else if (value.length < minLength) {
      return "Password should have min $minLength characters";
    } else if (newPwdValue != value) {
      return "Passwords did not match";
      // return "Password mismatch";
    }
    return null;
  }

  static String? otp({String? value, int minLength = 4}) {
    if (value == null || value.isEmpty) {
      return "Otp field cannot be empty";
    } else if (value.length < minLength) {
      return "Otp should have min $minLength characters";
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return "Otp can only be numeric";
    }
    return null;
  }

  static String? number(String? value, {int minLength = 10}) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
      // return 'Phone number field cannot be empty';
    } else if (value.length < minLength) {
      return 'Phone number should have a min $minLength characters';
    } else if (!value.contains(
        RegExp(r"^(?:\+234\s?|0)([789]\d{2})[-\s]?(\d{3})[-\s]?(\d{4})$"))) {
      return 'Phone number invalid';
    }
    return null;
  }
}

// const numPattern = r"^\+234[789][01]\d{8}$"
//     r"^(?:\+234\s?|0)([789]\d{2})[-\s]?(\d{3})[-\s]?(\d{4})$"
//     r"^(?:(?:\+234)|(0)|(\+234))(?:(?:(?:(7[01])|(8[01]))\d{7})|(?:(?:(7[01])|(8[01]))[-\s]?\d{3}[-\s]?\d{4}))(?![\d-])$";
