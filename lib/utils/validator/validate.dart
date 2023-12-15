class Validator {
  static String? requied(String? val) {
    if (val == null || val.isEmpty) {
      return "Trường này không được để trống";
    }
    return null;
  }
}
