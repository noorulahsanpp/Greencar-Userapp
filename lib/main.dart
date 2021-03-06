import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/allscreens/loginscreen.dart';
import 'package:user_app/allscreens/mainscreen.dart';
import 'package:user_app/allscreens/registrationscreen.dart';
import 'package:user_app/datahandler/appData.dart';
import 'package:user_app/pages/home/widget/homepagesam.dart';
import 'package:user_app/util/configmaps.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
CollectionReference<Map<String, dynamic>> tripReference = FirebaseFirestore.instance.collection("trips");

// DatabaseReference _databaseReference = FirebaseDatabase.instance.reference().child("users");

CollectionReference userRef = FirebaseFirestore.instance.collection('users');


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Brand Bold",
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: FirebaseAuth.instance.currentUser == null ? LoginScreen.idScreen : HomePageSam.idScreen,
        routes: {
          RegistrationScreen.idScreen:(context) => RegistrationScreen(),
          LoginScreen.idScreen:(context) => LoginScreen(),
          MainScreen.idScreen:(context) => MainScreen(),
          HomePageSam.idScreen:(context) => HomePageSam(),
        },
        home: LoginScreen(),
      ),
    );
  }
}

