import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news2/view/screens/homescreen.dart';
import 'package:news2/view/screens/registerationscreen.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import '../../control/providers/authprovider.dart';
import '../../widgets/backgroudimage.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  UserCredential? userCredential;
  var  mypassword,myemail;
  GlobalKey<FormState>formstate=GlobalKey<FormState>();
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
        BackgroundImage( image:"assets/images/news4.jpg",),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(child:
              Center(
                child: Text(
                  "Sign In",style:TextStyle(
                    color: Colors.lightBlue,fontSize: 60,fontWeight: FontWeight.bold
                ),
                ),
              )
              ),


              Form(
                key: formstate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      onSaved: (value){
                        emailController!=value  ;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "email cannot be null";
                        }
                        if(value.length<2){
                          return "email cannot be less than 2 letters";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,

                          prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(Icons.email, size: 28,
                                color: Kwhite,)
                          ),

                          hintText:" enter your Email",
                          hintStyle: KBodyText
                      ),
                      controller: emailController,
                      style: KBodyText,
                      keyboardType:TextInputType.emailAddress,
                      textInputAction:TextInputAction.next,
                    ),

                    TextFormField(
                      onSaved: (value){
                        emailController!=value ;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "password cannot be null";
                        }
                        if(value.length<4){
                          return "password cannot be less than 4 letters";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,

                          prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(Icons.lock, size: 28,
                                color: Kwhite,)
                          ),

                          hintText:" enter your Password",
                          hintStyle: KBodyText
                      ),
                      controller: passwordController,
                      style: KBodyText,
                      keyboardType:TextInputType.number,
                      textInputAction:TextInputAction.next,
                    ),
                    SizedBox(height: 25,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: ElevatedButton(

                        onPressed: ()async {
                          await Login();
                          await context.read<AuthProvider>().SignIn(passwordController.text,
                              emailController.text);

                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (
                              context) =>
                              HomeScreen(),));
                        },

                        child: Text("Sign in"),style:ElevatedButton.styleFrom(primary: Colors.white,onPrimary: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))) ,),
                    ),
                    SizedBox(height: 25,
                    ),

                  ],
                ),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return Registeration();
                  }));
                },
                child: Container(
                  child: Text(
                      "Register",style:KBodyText
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: Kwhite
                          )
                      )
                  ),
                ),
              ),


            ],
          ),
        )


      ],
    );
  }
}

