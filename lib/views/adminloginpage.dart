import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yatra1/components/mybutton.dart';
import 'package:yatra1/components/mytextfield.dart';
import 'package:yatra1/components/squaretile.dart';
import 'package:yatra1/screens/bottom_bar.dart';
import 'package:yatra1/Dashboard/dashhomescreen.dart';
import 'package:yatra1/services/auths/auth_service.dart';
import 'package:yatra1/views/forget_passwordpage.dart';
import 'package:yatra1/views/login_page.dart';
import 'package:yatra1/views/registerpage.dart';


class AdminLoginpage extends StatefulWidget {

  final Function()? onTap;
  final BuildContext context;
const  AdminLoginpage({super.key, required this.onTap, required this.context});

  //text editing controllers
 static TextEditingController emailController = TextEditingController();
static TextEditingController passwordController = TextEditingController();

void navigateToHomePage(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) {
        
        return HomeScreen();
      },
    ),
  );
}

//sign user in method
void signUserIn(BuildContext context)async{
//show loading circle

showDialog(
  context: context, // Use context here
  builder: (context) {
    return const  Center(
      child: CircularProgressIndicator(),
    );
  },
);

 //try sign in
  try{await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text, 
    password: passwordController.text,
    );
        //pop the loading circle
    Navigator.pop(context);

    // Navigate to the home page on successful sign-in
    navigateToHomePage(context);

  }on FirebaseAuthException catch (e){
        //pop the loading circle
    Navigator.pop(context);
   //show error message

   showErrorMessage(e.code);
  }
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
void registeredusermessage(){
  showAboutDialog(
    context: context,
  
  );
}

  @override
  State<AdminLoginpage> createState() => _AdminLoginpageState();
}

class _AdminLoginpageState extends State<AdminLoginpage> {
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
                // size:100,
                // ),
                Image.asset("lib/assets/images/logo.png"),
                const SizedBox(height:5),
                //welcome back,you've been missed!
                const Text("Book your Yatra here",
                style:TextStyle(
                  color: Colors.black, // Replace with the appropriate color code
                fontSize: 16,
                ),
                ),
                
                const SizedBox(height:25),
                
                //email textfield
                
                mytextfield(
                  controller:AdminLoginpage.emailController,
                  hintText: 'Your Yatra Admin email',
                  obscureText:false ,
                
                ),
                 const SizedBox(height:10),
                
                //password textfield
                
                mytextfield(
                  controller:AdminLoginpage.passwordController,
                  obscureText: true,
                  hintText: 'Admin Password',
                ),
                const SizedBox(height:10),
                
                //forget password
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:   Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
              GestureDetector(
                onTap: (){
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context){
            return const ForgotPasswordPage();
                  },
                  ),
                   ) ;
                },
                child: const Text(
                        'Forgot Password?',
                        style:
                        TextStyle(
                    color:Colors.blue,
                    fontWeight: FontWeight.bold
                    ),
                      ),
              ),
                  ],
                  ),
                ),
                const SizedBox(height:10),
                //signin button
               MyButton(
                text:'Sign In',
              onTap: () => widget.signUserIn(context),
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
                    style:TextStyle(color:Colors.black)
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
              //  Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //     //google button
              //   SquareTile(
              //     onTap: () => AuthService().signInWithGoogle(),
              //     imagePath: 'lib/images/g2.png'),
              //   const SizedBox(width:25),
              //   //apple button
              //   SquareTile(
              //     onTap: () {},
              //     imagePath: 'lib/images/a4.png')
              //   ],
              //   ),
              //   const SizedBox(height:50),
                
                //not a memeber?register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text('Not an Admin member?',
                style:TextStyle(
                  color:Colors.black
                )),
                const SizedBox(width:4),
                 GestureDetector(
               onTap: () {
                        // Navigate to the register page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Loginpage(onTap: widget.onTap, context: context),
                          ),
                        );
                      },
                   child: const Text(
                    'Log In',
                    style:TextStyle(
                    color:Colors.blue,
                    fontWeight: FontWeight.bold
                    ),
                    ),
                 )
                ],),
                      ],
                      ),
            )
      )
      )
       );
  }
  
  AuthService() {}
}