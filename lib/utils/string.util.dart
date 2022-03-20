extension StringValidators on String {
  bool isValidHttp() {
    final RegExp exp = RegExp(r'^(http|https)://');
    return exp.hasMatch(this);
  }
}
