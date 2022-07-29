import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news2/view/screens/homescreen.dart';
import 'package:news2/view/screens/welcomescreen.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';
import 'control/providers/authprovider.dart';
import 'control/providers/newsprovider.dart';

bool?  islogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var authStateChanges= FirebaseAuth.instance.currentUser;
  if(authStateChanges==null){
    islogin=false;
  }else{
    islogin=true;
  }

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthProvider(),),
          ChangeNotifierProvider(create: (context) => NewsProvider(),),



        ],
        child:
        MaterialApp(
            title: 'News',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.blue,
                textTheme:GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)


            ),
            home: AnimatedSplashScreen(
              splash: Center(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset('assets/images/breakingnews.jpg',fit:BoxFit.cover),

                ),
              ),
              splashIconSize: double.infinity,
              duration: 4000,
              nextScreen:  islogin == false ?
              WelcomeScreen(): HomeScreen(),
              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: PageTransitionType.bottomToTop,
            )
        )
    );

  }
}