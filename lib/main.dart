
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:grotree/screens/home.dart';
import 'package:grotree/screens/landing_page.dart';
import 'package:grotree/screens/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

Future<void> main() async {

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: GoogleFonts.robotoTextTheme(
              Theme.of(context).textTheme,
            ),
            unselectedWidgetColor: Color(0x84C9A315)
        ),
        home: HomePage(),
      )
  );
}