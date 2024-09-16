import 'package:ecommerce/classes/CreditCard.dart';
import 'package:flutter/cupertino.dart';

class CreditProvider extends ChangeNotifier{
  List<CreditCard> creditCards=[
    // CreditCard(name: "Touka Agra", code: '123456812345678', type: "visa" , expiredDate: "12/08" , cvv: "123"),
    // CreditCard(name: "Bosina Mahmoud", code: '1234123412341298', type: "MasterCard", expiredDate: "08/20" , cvv: "123"),
  ];

  CreditCard? selectedCard;

  addCard(CreditCard card){
    creditCards.add(card);
    notifyListeners();
  }

  removeCard(CreditCard card){
    creditCards.remove(card);
    notifyListeners();
  }

  updteSelectedCard(CreditCard card){
    selectedCard=card;
    notifyListeners();
  }
}