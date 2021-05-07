import 'package:flutter/material.dart';
import 'package:hagglex/Constant.dart';
import 'package:hagglex/component/AppBarCustom.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hagglex/component/MyButton.dart';
import 'package:hagglex/ui/CompleteSetUpScreen.dart';

class VerificationScreen extends StatefulWidget {
  static String id="verification_screen";

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController verificationCodeController=TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height/100;
    double width=MediaQuery.of(context).size.width/100;
    final verifyText = Text(
      'Verify your account',
      style: TextStyle(
          color: Colors.white,
          fontFamily: 'Grotesquepro',
          fontWeight: FontWeight.bold,
          fontSize: 23
      ),
    );
    final verificationCodeTextInput = TextField(
        controller: verificationCodeController,
        autofocus: false,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onChanged: (value) {
          //do something
        },
        style: KTextColor.copyWith(
            color: Colors.black,
            fontSize: 12
        ),
        decoration: kTextFieldDecorationBlack.copyWith(
          labelText: "Verification code",
        ));
    final loginButton = MyButton(title: 'VERIFY ME',colorText: Colors.white,
      colorCradient1: Color(0xFF432B7B),
      colorCradient2: Color(0xFF6A4BBC),
      onPressed: (){
        //_formKey.currentState.validate();
       Navigator.pushNamed(context, CompleteSetUpScreen.id);

      },);
    final expireCodeText = Text(
      'This code will expire in 10 minutes',
      style: TextStyle(
          color: Colors.black,
          fontFamily: 'Grotesquepro',
          fontWeight: FontWeight.w300,
          fontSize: 9
      ),
    );
    final resendCodeText = Text('Resend Code',
      style: TextStyle(
          color: Colors.black,
          decoration: TextDecoration.underline,
          fontFamily: 'Grotesquepro',
          fontWeight: FontWeight.bold,
          fontSize: 13
      ),
    );
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Color(0xFF2E1963),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               // SizedBox(height: 10,),
                Hero(
                  tag: 'logo',
                  child: AppBarCustom(onTap:  (){
                    Navigator.pop(context);
                  },),
                ),
                SizedBox(height: 30,),
                verifyText,

                SizedBox(height: 20,),

                Container(
                  //width: double.infinity,
                  height: 506,
                  margin: EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // SizedBox(height: 30,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Image.asset('images/mark.png'),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Expanded(child:  Text('We just sent a verification code to your email. Please enter the code',
                         textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Grotesquepro',
                          ),
                        )),
                        Expanded(child: verificationCodeTextInput),
                        loginButton,
                        SizedBox(height: 30,),
                        Expanded(child: expireCodeText),
                        Expanded(child: resendCodeText),

                      ],
                    ),
                  ),
                ),


              ],
            ),
          )),
    );
  }
}
