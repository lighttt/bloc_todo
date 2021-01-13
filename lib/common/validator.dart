class Validator {
  static String titleValidator(String value) {
    return value.trim().isEmpty ? "Title cannot be empty" : null;
  }

  static String descriptionValidator(String value) {
    return value.trim().isEmpty ? "Description cannot be empty" : null;
  }
}
