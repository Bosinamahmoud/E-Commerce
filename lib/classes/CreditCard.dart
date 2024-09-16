class CreditCard {
  String name;
  String code;
  String type;
  String expiredDate;
  String cvv;

  CreditCard(
      {required this.name,
      required this.code,
      required this.type,
      required this.expiredDate,
      required this.cvv});

  String obscureText(String text) {
    String obscurePart = '*' * (text.length - 3);
    String visiblePart = text.substring(text.length - 4);
    String result = obscurePart + visiblePart;
    return result;
  }
}
