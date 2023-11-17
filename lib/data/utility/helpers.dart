
String? inputValidate(dynamic? value, String errorMessage) {
  if(value?.trim().isEmpty ?? true) {
    return errorMessage;
  }
  return null;
}
