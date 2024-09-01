import 'package:flutter/material.dart';
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}


class _loginState extends State<login> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(""),),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              SizedBox(height: 20),
              TextFormField(
                onTapOutside: (value){
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // wait database
                onFieldSubmitted: (value){},
                decoration: InputDecoration(labelText: 'Name',
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey),),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                onTapOutside: (value){
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // wait database
                onFieldSubmitted: (value){},
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                    suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.grey),),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child:  ElevatedButton(
                onPressed: () {
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>signUp()));
                  // Action to perform when button is pressed
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),

                child: Text("LOGIN",style: TextStyle(fontSize: 20,color: Colors.white),),
              ), )

            ],
          ),
        ),
      ),);
  }

}