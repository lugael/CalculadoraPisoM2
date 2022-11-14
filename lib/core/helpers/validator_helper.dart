class ValidatorHelper {
  static String? isValidText(String? text) {
    return text == null || text.isEmpty ? 'Campo Obrigatório' : null;
  }
}
