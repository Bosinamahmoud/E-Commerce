import 'package:ecommerce/classes/CreditCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/CreditProvider.dart';

class PaymentSheet extends StatelessWidget {
  TextEditingController nameController=TextEditingController();
  TextEditingController codeController=TextEditingController();
  TextEditingController typeController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController cvvController=TextEditingController();

  GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              blurRadius: 20,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
              height: MediaQuery.of(context).size.height*0.7,
              child: Column(
                children: [
                  Text("Add Card",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(height: 15),
                  Form(
                    key:formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller:nameController,
                          validator: (value){
                            if(value!.isEmpty) return "Name can't be Empty";
                          },
                          decoration: InputDecoration(
                              labelText: "Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )
                          ),
                        ),

                        SizedBox(height: 10),
                        TextFormField(
                          controller:codeController,
                          keyboardType: TextInputType.number,
                          validator: (value){
                            if(value!.isEmpty) return "Card code can't be Empty";
                            else if(value.length!=16) return "Must be 16 digits";
                          },
                          decoration: InputDecoration(
                              labelText: "Code",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )
                          ),
                        ),

                        SizedBox(height: 10),
                        TextFormField(
                          controller:typeController,
                          validator: (value){
                            if(value!.isEmpty) return "Type can't be Empty";
                          },
                          decoration: InputDecoration(
                              labelText: "Type",
                              hintText: "(e.g. Visa, MasterCard)",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )
                          ),
                        ),

                        SizedBox(height: 10),
                        TextFormField(
                          controller:dateController,
                          keyboardType: TextInputType.datetime,
                          validator: (value){
                            if(value!.isEmpty) return "Expiration date can't be Empty";
                            else if(value.length!=5 || !RegExp(r"\d{2}/\d{2}").hasMatch(value)) return "Must be MM/YY format";
                          },
                          decoration: InputDecoration(
                              labelText: "Expiration Date",
                              hintText: "(MM/YY)",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )
                          ),
                        ),

                        SizedBox(height: 10),
                        TextFormField(
                          controller:cvvController,
                          keyboardType: TextInputType.number,
                          validator: (value){
                            if(value!.isEmpty) return "CVV can't be Empty";
                            else if(value.length!=3) return "Must be 3 digits";
                          },
                          decoration: InputDecoration(
                              labelText: "CVV",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )
                          ),
                        ),

                        SizedBox(height: 15),
                        TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.red),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                                )
                            ),
                            onPressed: (){
                              if(formKey.currentState!.validate()){
                                CreditCard card=CreditCard(name: nameController.text, code: codeController.text, type: typeController.text, expiredDate: dateController.text, cvv: cvvController.text);
                                Provider.of<CreditProvider>(context , listen:false).addCard(card);
                                Navigator.pop(context);
                              }
                            },
                            child: Text("Add Card", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15))),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}