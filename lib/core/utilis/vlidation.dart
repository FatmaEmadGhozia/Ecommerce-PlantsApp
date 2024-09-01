//validate in username textfield
class Rgisteration_validation {
  String? name_validate(String? input) {
    if ((input?.length ?? 0) > 2) {
      return null;
    }
    return "invalid name";
  }
}


//validate on email
class Rgisteration_validation_email {
  String? email_validate(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter an email';
    }
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(input)) {
      return 'Please enter a valid email';
    }
    return null;
  }
}


//validate on password
class Rgisteration_validation_password {
  String? password_validate(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter a password';
    }
    if (input.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }
}




