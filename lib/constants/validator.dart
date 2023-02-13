String? userIdValidator(value) {
  if (value!.isEmpty) {
    return '아이디를 반드시 입력해주세요';
  }
  return null;
}

String? passWordValidator(value) {
  if (value!.isEmpty) {
    return '비밀번호를 반드시 입력해주세요';
  }

  return null;
}
