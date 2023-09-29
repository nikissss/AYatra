import 'package:flutter/material.dart';
import 'package:yatra1/components/mybutton.dart';
import 'package:yatra1/components/mytextfield.dart';
import 'package:yatra1/components/squaretile.dart';

class Loginpage extends StatefulWidget {
 Loginpage({Key? key}): super(key: key);

  //text editing controllers
 static TextEditingController usernameController = TextEditingController();
static TextEditingController passwordController = TextEditingController();

//sign user in method
void signUserIn() {}

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  get signUserIn => null;

  @override
  Widget build(BuildContext context) {
    // double w = MediaQuery.of(context).size.width;
    // double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:SafeArea(
        child:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
 SizedBox(height:50),
//logo
 Icon(
  Icons.lock,
size:100,
),
 SizedBox(height:50),
//welcome back,you've been missed!
Text("Welcome back!",
style:TextStyle(
  color: const Color(0xFF616161), // Replace with the appropriate color code
fontSize: 16,
),
),

SizedBox(height:25),

//username textfield

mytextfield(
  controller:Loginpage.usernameController,
  hintText: 'Username',
  obscureText:false ,

),
 SizedBox(height:10),

//password textfield

mytextfield(
  controller:Loginpage.passwordController,
  obscureText: true,
    hintText: 'Password',
),
SizedBox(height:10),

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
SizedBox(height:10),
//signin button
MyButton(
  onTap: signUserIn,
),
SizedBox(height:50),
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
      'Or continue with',
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
SizedBox(height:50),
//google + apple sign in button
const Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  //google button
SquareTile(imagePath: 'lib/img/g2.png'),
SizedBox(width:25),
//apple button
SquareTile(imagePath: 'lib/img/a4.png')
],
),
SizedBox(height:50),

//not a memeber?register now
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
Text('Not a member?',
style:TextStyle(
  color:Colors.grey[700]
)),
 SizedBox(width:4),
 Text(
  'Register now',
  style:TextStyle(
    color:Colors.blue,
    fontWeight: FontWeight.bold
  ),),
],)
        ],
        )
    )
    )
   );
  }
}