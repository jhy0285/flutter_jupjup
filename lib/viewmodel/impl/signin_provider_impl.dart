import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_login/flutter_login.dart';
import 'package:jupjup/repo/impl/firebase_repo_impl.dart';
import 'package:jupjup/viewmodel/signin_provider.dart';

class SignInProvider extends ChangeNotifier implements ISignInProvider {
  final FirebaseRepo _repo;
  SignInProvider({FirebaseRepo? repo}) : _repo = repo ?? FirebaseRepo();

  bool _isLogin = false;
  @override
  bool get isLogin => _isLogin;

  @override
  void changeLoginState() {
    _isLogin = !isLogin;
  }

  @override
  Future<String?> loadSignIn(LoginData data) async {
    String id = data.name;
    String password = data.password;

    int? storeId = await _repo.getStoreIdByAdmin(id, password);

    if (storeId != null) {
      changeLoginState();
      return null;
    } else {
      return '로그인에실패했습니다. 입력정보를 확인해주세요';
    }
  }

  @override
  Future<String?> loadSignUp(SignupData data) async {
    Duration loginTime = Duration(milliseconds: timeDilation.ceil() * 50);
    return Future.delayed(loginTime).then((_) {
      return '기능준비중';
    });
    // Duration loginTime = Duration(milliseconds: timeDilation.ceil() * 50);
    // String? username = data.name;
    // String? password = data.password;
    // late String email;
    // late String phoneNumber;
    // late String name;

    // data.additionalSignupData?.forEach((key, value) {
    //   if (key == 'email') {
    //     email = value;
    //   } else if (key == 'phoneNumber') {
    //     phoneNumber = value;
    //   } else if (key == 'name') {
    //     name = value;
    //   }
    // });

    // int? statusCode =
    //     await repo.signUp(username!, password!, email, phoneNumber, name);

    // return Future.delayed(loginTime).then((_) {
    //   //여기다가 실패 띄우면됨
    //   if (statusCode == 200) {
    //     return null;
    //   } else {
    //     return '회원가입에 실패하였습니다.';
    //   }
    // });
  }

//db에서 처리해야하지만 일단 테스트로 만들자. 아직없어서 어쩔수없음
  // 비번까먹으면 시큐리티 스토리지에서 admin찾아서 id맞으면 비번주기
  @override
  Future<String?> recoverPassword(name) {
    Duration loginTime = Duration(milliseconds: timeDilation.ceil() * 50);
    return Future.delayed(loginTime).then((_) {
      return '기능준비중';
    });
    //   if (!users.containsKey(name)) {
    //     return 'User not exists';
    //   }
    //   return '';
    // });
  }
}
