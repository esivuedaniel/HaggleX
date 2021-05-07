import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hagglex/Constant.dart';
import 'package:hagglex/component/AppBarCustom.dart';
import 'package:hagglex/component/MyButton.dart';
import 'package:hagglex/ui/VerificationScreen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  static String id="signup_screen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isObscure = true;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController usernameController=TextEditingController();
  TextEditingController refererController=TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();


  String _phone, _email, _password,_username, _referrer;

  @override
  Widget build(BuildContext context) {

    final emailTextInput = TextField(
      controller: emailController,
        autofocus: false,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onChanged: (value) {
          //do something
        },
        style: KTextColor.copyWith(
            color: Colors.black,
                fontSize: 12
        ),
        decoration: kTextFieldDecorationBlack.copyWith(
          labelText: "Email Address",
        ));
    final passwordInputText = TextField(
      controller: passwordController,
      obscureText: _isObscure,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        //do something
      },
      style: KTextColor.copyWith(
          color: Colors.black,
          fontSize: 12
      ),
      decoration: kTextFieldDecorationBlack.copyWith(
          labelText: "Password [Min. 8 characters]",
          suffix: GestureDetector(
            child: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
              color: Color(0xFFBA3AF9),
            ),
            onTap: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          )),
    );
    final usernameTextInput = TextField(
      controller: usernameController,
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
          labelText: "Create a username",

        ));
    final phoneNumberTextInput =    IntlPhoneField(
      textInputAction: TextInputAction.next,
      style: KTextColor.copyWith(
          color: Colors.black,
          fontSize: 12
      ),
      decoration: kTextFieldDecorationBlack.copyWith(
        labelText: "Enter your phone number",),
      initialCountryCode: 'IN',
      onChanged: (phone) {
        print(phone.completeNumber);
        _phone=phone.completeNumber;
        print('Country code changed to: ' + phone.countryCode);
      },

    );
    final referralCodeTextInput = TextField(
      controller: refererController,
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
          labelText: "Referral code (optional)",

        ));
    final termsandcondition=Text('By signing, you agree to HaggleX terms and privacy policy.',
      style: TextStyle(
        color: Colors.black,
        fontSize: 10,
        fontWeight: FontWeight.w700,
        fontFamily: 'Grotesquepro',
      ),
    );
    final loginButton = MyButton(title: 'SIGN UP',colorText: Colors.white,
      colorCradient1: Color(0xFF432B7B),
      colorCradient2: Color(0xFF6A4BBC),
      onPressed: (){
        _formKey.currentState.validate();

        _email=emailController.text;
        _password=passwordController.text;
        _username=usernameController.text;
        _referrer=refererController.text;
        _phone;

        Navigator.pushNamed(context, VerificationScreen.id);
      print("my phone number==${_phone}");
      },);

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Color(0xFF2E1963),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Hero(
                    tag: 'logo',
                    child: AppBarCustom(onTap:  (){
                      Navigator.pop(context);
                    },),
                  ),
                  SizedBox(height: 20,),

                  Expanded(
                    child: Container(
                      //width: double.infinity,
                     // height: MediaQuery.of(context).size.height-100,
                      margin: EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 27, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           // SizedBox(height: 30,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Text('Create a new account',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Grotesquepro',
                                ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Expanded(child: emailTextInput),
                            Expanded(child: passwordInputText),
                            Expanded(child: usernameTextInput),
                            Expanded(child: phoneNumberTextInput),
                            Expanded(child: referralCodeTextInput),
                            Expanded(child: termsandcondition),
                            loginButton,
                            SizedBox(height: 40,)
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40,),

                ],
              ),
            ),
          )),
    );
  }
}


