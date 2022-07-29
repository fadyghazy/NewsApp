import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news2/view/screens/registerationscreen.dart';
import 'package:news2/view/screens/signinscreen.dart';

import '../../constant.dart';
import '../../widgets/backgroudimage.dart';



class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  UserCredential? userCredential;
  var  mypassword,myemail;
  GlobalKey<FormState>formstate=GlobalKey<FormState>();
  final _auth=FirebaseAuth.instance;
  Login()async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print("valid");
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          BackgroundImage( image:"assets/images/news2.jpg",),
          Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                  children: [

                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4),
                        child: Text(
                          "New Day : great News ",style:TextStyle(
                            color:Colors.grey,fontSize:35,fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                    ),
                    SizedBox(height:20),

                    Row(
                        children:[
                          Expanded(
                            child: ElevatedButton(

                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) =>LoginScreen()));




                              }, child: Text("Sign in"),style:ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))) ,),
                          ),
                          SizedBox(height:MediaQuery.of(context).size.height*0.1,)
                        ]),

                    Row(
                        children: [
                          Expanded(

                            child: ElevatedButton(
                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) =>Registeration()));




                              }, child: Text("Register"),style:ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))) ,),
                          ),
















                        ]
                    )
                  ]
              )
          )
        ]
    );





  }
}

