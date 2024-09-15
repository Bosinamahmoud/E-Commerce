import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/providers/CartItemsProvider.dart';
import 'package:ecommerce/providers/CartItemsProvider.dart';
import 'package:ecommerce/providers/DeleteProvider.dart';
import 'package:ecommerce/providers/ThemeProvider.dart';
import 'package:ecommerce/providers/TotalProvider.dart';
import 'package:ecommerce/providers/cartProvider.dart';
import 'package:ecommerce/providers/counter_provider.dart';
import 'package:ecommerce/providers/userProvider.dart';
import 'package:ecommerce/screens/Checkout.dart';
import 'package:ecommerce/screens/Home.dart';
import 'package:ecommerce/screens/start.dart';
import 'package:ecommerce/themes/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options:DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>Themeprovider()),
        ChangeNotifierProvider(create: (_)=> userProvider()),
        ChangeNotifierProvider(create: (_)=> CounterProvider()),
        ChangeNotifierProvider(create: (_)=> CartProvider()),
        ChangeNotifierProvider(create: (_)=> TotalProvider()),
        ChangeNotifierProvider(create: (_)=> DeleteProvider()),




      ],
      child: Consumer<Themeprovider>(builder: (context,provider,child){return   MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home:

        splash() ,
        theme:provider.isLight?lightTheme:darkTheme ,
      ); })

    );
  }
}
splash(){
  if(FirebaseAuth.instance.currentUser !=null){
    return Home();
  }
  else{
    return start();
  }
}