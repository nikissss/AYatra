

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yatra1/components/mybutton.dart';
import 'package:yatra1/components/mytextfield.dart';
import 'package:yatra1/components/squaretile.dart';
import 'package:yatra1/screens/bottom_bar.dart';
import 'package:yatra1/screens/homescreen.dart';
import 'package:yatra1/services/auths/auth_service.dart';
import 'package:yatra1/views/login_page.dart';

class RegisterPage extends StatefulWidget {

  final Function()? onTap;
  final BuildContext context;
 const RegisterPage({super.key, required this.onTap, required this.context});
 

  //text editing controllers
 static TextEditingController emailController = TextEditingController();
static TextEditingController passwordController = TextEditingController();
static TextEditingController confirmpasswordController = TextEditingController();
//sign user in method
void signUserUp() async{
//show loading circle

showDialog(
  context: context, // Use context here
  builder: (context) {
    return const  Center(
      child: CircularProgressIndicator(),
    );
  },
);

 //try creating the user
  try{
    //check if password is confirmed 
    if(passwordController.text == confirmpasswordController.text){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController.text, 
    password: passwordController.text,
    );
    }else {
      //show error message password dont match
      showErrorMessage("Passwords don't match ");

    }
        //pop the loading circle
    Navigator.pop(context);

  }on FirebaseAuthException catch (e){
        //pop the loading circle
    Navigator.pop(context);
   //show error message

   showErrorMessage(e.code);
  }

    navigateToHomePage(context);
}

void loginpage ()async{
//show loading circle
showDialog(
  context: context, // Use context here
  builder: (context) {
    return const  Center(
      child: CircularProgressIndicator(),
    );
  },
);
    navigateToLoginPage(context);
}
// Method to navigate to the home page
void navigateToHomePage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return BottomBar();
        },
      ),
    );
  }
  void navigateToLoginPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Loginpage(onTap: () {  },context: context,);
        },
      ),
    );
  }
//error messsage to user
void showErrorMessage(String message){
  showDialog(
    context: context, 
    builder: (context){
    return    AlertDialog(
      backgroundColor: const Color.fromARGB(255, 133, 172, 192),
        title:Center(
        child:  Text(
            message,
            style:const TextStyle(color:Colors.black),
            ),
      ),
      ) ;
    },
    );
}
//wrong email message popup 
void wrongPasswordMessage(){
  showDialog(
    context: context, 
    builder: (context){
     return const  AlertDialog(
      backgroundColor: Colors.amber,
        title:Text('Incorrect Password'),
      );
    },
    );
}

  @override
  State<StatefulWidget> createState() {
 return _RegisterPageState();
  }
 
}

class _RegisterPageState extends State<RegisterPage> {
  get signUserIn => null;

  @override
  Widget build(BuildContext context) {
    // double w = MediaQuery.of(context).size.width;
    // double h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body:SafeArea(
          child:Center(
            child:SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                 const SizedBox(height:50),
                //logo
                // const  Icon(
                //   Icons.lock,
                // size:50,
                // ),
                Image.asset("lib/assets/images/logo.png"),
                const SizedBox(height:50),
                //Create your Account!
                const Text("Let's Create an Account!",
                style:TextStyle(
                  color: Color(0xFF616161), // Replace with the appropriate color code
                fontSize: 16,
                ),
                ),
                
                const SizedBox(height:25),
                
                //email textfield
                
                mytextfield(
                  controller:RegisterPage.emailController,
                  hintText: 'email',
                  obscureText:false ,
                
                ),
                 const SizedBox(height:10),
                
                //password textfield
                
                mytextfield(
                  controller:RegisterPage.passwordController,
                  obscureText: true,
                  hintText: 'Password',
                ),
                    const SizedBox(height:10),
                
                //confirm password textfield
                
                mytextfield(
                  controller:RegisterPage.confirmpasswordController,
                  obscureText: true,
                  hintText: 'Confirm Password',
                ),
                const SizedBox(height:10),
                
                //forget password
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:   Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
              Text(
                      'Forget Password?',
                      style:TextStyle(color:Colors.grey[600]),
                    ),
                  ],
                  ),
                ),
                const SizedBox(height:10),
                //signin button
                MyButton(
                  text:"SignUp",
                  onTap:widget.signUserUp,
                ),
                const SizedBox(height:50),
                //or continue with
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0),
                  child:   Row(
                  children:[
                  Expanded(
                  child:Divider(
                    thickness:0.5,
                    color:Colors.grey[400],
                  ),
                  ),
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Text(
                    'OR',
                    style:TextStyle(color:Colors.grey[700])
                    ),
                  ),
                  Expanded(
                  child: Divider(
                    thickness:0.5,
                    color:Colors.grey[700],
                  ),
                  ),
                  ],
                  ),
                ),
                const SizedBox(height:50),
              //   //google + apple sign in button
              // Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //     //google button
              //   SquareTile(
              //     onTap: () => AuthService().signInWithGoogle(),
              //     imagePath: 'lib/images/g2.png'),
              //   const SizedBox(width:25),
              //   //apple button
              //   // SquareTile(
              //   //   onTap: () {},
              //   //   imagePath: 'lib/img/a4.png')
              //   ],
              //   ),
                const SizedBox(height:50),
                
                //not a memeber?register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text('Already have an account!',
                style:TextStyle(
                  color:Colors.grey[700]
                )),
                const SizedBox(width:4),
                 GestureDetector(
                  onTap:()=>widget.loginpage(),
                    
                
                   child: const Text(
                    'Login now',
                    style:TextStyle(
                    color:Colors.blue,
                    fontWeight: FontWeight.bold
                    ),),
                 ),
                ],)
                      ],
                      ),
            )
      )
      )
       );
  }
  
  AuthService() {}
}