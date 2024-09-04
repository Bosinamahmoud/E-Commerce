import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PayDialog extends StatefulWidget {
  const PayDialog({super.key});

  @override
  State<PayDialog> createState() => _PayDialogState();
}

class _PayDialogState extends State<PayDialog> {
  TextEditingController passController=TextEditingController();

  GlobalKey<FormState> formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Confirm Payment",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: 15),
            Form(
              key:formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller:passController,
                    obscureText: true,
                    keyboardType: TextInputType.phone,
                    validator: (value){
                      if(value!.isEmpty) return "Can't be Empty";
                      else if(value.length!=4) return "Must be 4 characters";
                    },
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )
                    ),
                  ),
        
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.red),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                                )
                            ),
                            onPressed: (){
                              if(formKey.currentState!.validate()) showDialog(context: context, builder: (context){
                                return AlertDialog(
                                  title: Text("Done",),
                                  content: Text('Payment Success'),
                                  actions: [
                                    TextButton(
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Colors.red),
                                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                                            )
                                        ),
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        child: Text("Ok", style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15))),
                                  ],
                                );

                              }
                              );
                            },
                            child: Text("Confirm", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15))),
                        TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.red),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                                )
                            ),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text("Cancel", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15))),
                      ],
                    ),
                  )
        
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
