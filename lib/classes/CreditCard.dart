class CreditCard{
  String name;
  String code;
  String type;

  CreditCard({required this.name, required this.code, required this.type});

  String obscureText(String text){
    String obscurePart='*'*(text.length-3);
    String visiblePart=text.substring(text.length-4);
    String result=obscurePart+visiblePart;
    return result;
  }
}