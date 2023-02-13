import 'package:firebase_database/ui/firebase_sorted_list.dart';
import 'package:flutter/material.dart';
import 'package:jupjup/view/page/login_page.dart';
import 'package:jupjup/view/page/main_page.dart';
import 'package:jupjup/view/page/menu_complete_and_cancel_page.dart';
import 'package:jupjup/view/page/menu_confirm_page.dart';
import 'package:jupjup/view/page/menu_detail_page.dart';
import 'package:jupjup/viewmodel/impl/kakao_alarm_talk_provider_impl.dart';
import 'package:jupjup/viewmodel/impl/menu_provider_impl.dart';
import 'package:jupjup/viewmodel/impl/signin_provider_impl.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //
  // FirebaseFirestore db = FirebaseFirestore.instance;
  // final docRef = db.collection("admin").doc("1");
  // docRef.get().then(
  //   (DocumentSnapshot doc) {
  //     final data = doc.data() as Map<String, dynamic>;
  //     print(data['password']);
  //   },
  //   onError: (e) => print("Error getting document: $e"),
  // );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => SignInProvider()),
    ChangeNotifierProvider(create: (_) => MenuProvider()),
    ChangeNotifierProvider(create: (_) => KakaoAlarmTalkProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'login': (context) => LoginPage(),
        'main': (context) => MainPage(),
        'detail': (context) => DetailPage(),
        'confirm': (context) => ConfirmPage(),
        'completeAndCancel': (context) => CompleteAndCancelPage(),
      },
      initialRoute: "login",
      title: 'First app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}
