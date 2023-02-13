import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_login/flutter_login.dart';
import 'package:jupjup/constants/validator.dart';
import 'package:jupjup/viewmodel/impl/signin_provider_impl.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 50);

  @override
  Widget build(BuildContext context) {
    SignInProvider providerRead =
        Provider.of<SignInProvider>(context, listen: false);

    return FlutterLogin(
      title: 'JupJup Login',
      userValidator: userIdValidator,
      passwordValidator: passWordValidator,

      theme: LoginTheme(
        bodyStyle: const TextStyle(color: Colors.blueGrey),
        primaryColor: const Color(0x398F89A1),
        accentColor: Colors.lightBlue,
        errorColor: Colors.redAccent,
        titleStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        buttonTheme: const LoginButtonTheme(
          splashColor: Colors.blue,
          backgroundColor: Colors.cyan,
        ),
      ),
      onLogin: providerRead.loadSignIn,
      onSignup: providerRead.loadSignUp,
      messages: LoginMessages(
          signUpSuccess: "회원가입 성공하셨습니다!",
          confirmPasswordHint: "비밀번호 확인",
          confirmPasswordError: "비밀번호가 일치하지 않습니다",
          loginButton: '로그인',
          signupButton: '회원가입(준비중)',
          userHint: '아이디',
          passwordHint: '비밀번호',
          goBackButton: "뒤로가기"),
      onRecoverPassword: providerRead.recoverPassword,
      // additionalSignupFields: [
      //   UserFormField(
      //       icon: Icon(Icons.alternate_email),
      //       keyName: 'email',
      //       displayName: '이메일',
      //       fieldValidator: providerRead.emailValidator),
      //   UserFormField(
      //       icon: Icon(Icons.badge),
      //       keyName: 'name',
      //       displayName: '성함',
      //       fieldValidator: providerRead.nameValidator),
      //   UserFormField(
      //       icon: Icon(Icons.phone),
      //       keyName: 'phoneNumber',
      //       displayName: '휴대전화',
      //       fieldValidator: providerRead.phoneNumberValidator),
      // ],
      initialAuthMode: AuthMode.login,
      scrollable: false,
      hideProvidersTitle: false,
      disableCustomPageTransformer: true,
      onSubmitAnimationCompleted: () {
        if (providerRead.isLogin == true) {
          Fluttertoast.showToast(
              msg: "성공적으로 로그인 하였습니다!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.blueAccent,
              textColor: Colors.white,
              fontSize: 16.0);
        }

        Navigator.pushNamed(context, 'main');
      },
    );
  }
}
