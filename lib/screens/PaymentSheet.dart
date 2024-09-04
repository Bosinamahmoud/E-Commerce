import 'package:flutter/material.dart';

class PaymentSheet extends StatefulWidget {
  const PaymentSheet({super.key});

  @override
  State<PaymentSheet> createState() => _PaymentSheetState();
}

class _PaymentSheetState extends State<PaymentSheet> {

  TextEditingController nameController=TextEditingController();
  TextEditingController codeController=TextEditingController();
  TextEditingController typeController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController cvvController=TextEditingController();

  GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                      if(value!.isEmpty) return "Can't be Empty";
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
                    keyboardType: TextInputType.phone,
                    validator: (value){
                      if(value!.isEmpty) return "Can't be Empty";
                      else if(value.length==16) return "Must be 16";
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
                      if(value!.isEmpty) return "Can't be Empty";
                    },
                    decoration: InputDecoration(
                      labelText: "Type",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      )
                    ),
                  ),
      
                  SizedBox(height: 10),
                  TextFormField(
                    controller:dateController,
                    validator: (value){
                      if(value!.isEmpty) return "Can't be Empty";
                      else if(value.length!=5) return "Invalid Date";
                    },
                    decoration: InputDecoration(
                        labelText: "Expired Date",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )
                    ),
                  ),
      
                  SizedBox(height: 10),
                  TextFormField(
                    controller:cvvController,
                    validator: (value){
                      if(value!.isEmpty) return "Can't be Empty";
                      else if(value.length!=3) return "Must be 3 characters";
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
                        if(formKey.currentState!.validate()) Navigator.pop(context);
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
    );
  }
}
