import 'package:mobx/mobx.dart';

part 'signup_store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {

  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length > 6;
  String get nameError {
    if(name == null || nameValid) {
      return null;
    }
    else if(name.isEmpty) {
      return 'Campo obrigatório';
    }
    else {
      return 'Nome muito curto';
    }
  }
  
  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.contains('@');

  String get emailError {
    if(email == null || emailValid){
      return null;
    } else if(email.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'E-mail inválido';
    }
  }

  @observable
  String  phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null &&  phone.length >= 14;
  String get phoneError {
    if(phone == null || phoneValid) {
      return null;
    }  else if(phone.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Número inválido';
    }
  }

  @observable
  String password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password.length > 5;
  String get passwordError {
    if(password == null || passwordValid){
      return null;
    } else if(password.isEmpty){
      return 'Campo obrigatório';
    } else {
      return 'Senha muito curta';
    }
  }

  @observable
  String checkPassword;

  @action
  void setCheckPassword(String value) => checkPassword = value;

  @computed
  bool get checkPasswordValid => checkPassword != null && checkPassword == password;

  String get checkPasswordError {
    if(checkPassword == null || checkPasswordValid) {
      return null;
    } else {
      return 'Senhas não são iguais';
    }
  }

  @computed
  bool get isFormValid => nameValid && emailValid && phoneValid && passwordValid && checkPasswordValid;

  @computed
  Function get signUpPressed => (isFormValid && !loading) ? _signUp : null;

  @observable
  bool loading = false;

  @action
  Future<void> _signUp() async {
    loading = true;
    await Future.delayed(Duration(seconds: 3));
    loading = false;
  }
}