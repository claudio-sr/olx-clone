import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.contains("@");
  String get emailError => email == null || emailValid ? null : 'E-mail é inválido';

  @observable
  String password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password.length >= 4;
  String get passwordError => password == null || passwordValid ? null : 'Senha inválida';
  
  
}