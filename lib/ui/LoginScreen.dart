import 'package:flutter/material.dart';
import 'package:hagglex/Constant.dart';
import 'package:hagglex/component/MyButton.dart';
import 'package:hagglex/ui/DashBoard.dart';
import 'package:hagglex/ui/SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{
  bool _isObscure = true;
  AnimationController controller;
  Animation curveanimation;

  @override
  void initState() {
    controller=AnimationController(
      duration: Duration(seconds: 1,),
      vsync: this,
    );

    curveanimation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });

  }


  @override
  void dispose() {
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final welcomeText = Text(
      'Welcome!',
      style: TextStyle(
          color: Colors.white,
          fontFamily: 'Grotesquepro',
          fontWeight: FontWeight.bold,
          fontSize: curveanimation.value*40
      ),
    );
    final emailTextInput = TextField(
        autofocus: false,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onChanged: (value) {
          //do something
        },
        style: KTextColor,
        decoration: kTextFieldDecoration.copyWith(
          labelText: "Email Address",

        ));
    final passwordInputText = TextField(
      obscureText: _isObscure,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      onChanged: (value) {
        //do something
      },
      style: KTextColor,
      decoration: kTextFieldDecoration.copyWith(
          labelText: "Password [Min. 8 characters]",
          suffix: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          )),
    );
    final forgotPasswordText = Align(
        alignment: Alignment.centerRight,
        child: SmallTextWidget(
          title: 'Forgot Password?',
          onPressed: () {},
        ));
    final loginButton = MyButton(title: 'LOG IN',colorText: Color(0xFF3E0606),
    colorCradient1: Color(0xFFFFC175),
    colorCradient2: Color(0xFFFFC175),
    onPressed: (){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => DashBoard()),(Route<dynamic> route) => false);
    },);
    final registerUserText = Align(
        alignment: Alignment.center,
        child: SmallTextWidget(
          title: 'New User?Create a new account',
          onPressed: () {
           Navigator.pushNamed(context, SignUpScreen.id);
           // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpScreen() ));
          },
        ));

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xFF2E1963),
          body: Container(
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  welcomeText,
                  SizedBox(
                    height: 45,
                  ),
                  emailTextInput,
                  SizedBox(
                    height: 10,
                  ),
                  passwordInputText,
                  SizedBox(
                    height: 20,
                  ),
                  forgotPasswordText,
                  SizedBox(
                    height: 35,
                  ),
                  loginButton,
                  SizedBox(
                    height: 20,
                  ),
                  registerUserText,
                  Spacer(),
                  Spacer(),
                ],
              ),
            ),
          ),

      ),
    );
  }
}

class SmallTextWidget extends StatelessWidget {
  final String title;
  final Function onPressed;

  SmallTextWidget({this.title, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(title, textAlign: TextAlign.center, style: KTextColor),
    );
  }
}
