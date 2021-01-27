import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_clone/screens/signup/field_title.dart';
import 'package:xlo_clone/stores/signup_store.dart';

class SignUpScreen extends StatelessWidget {

  SignUpStore signUpStore = SignUpStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FieldTitle(
                    title: 'Apelido',
                    subtitle: 'Com aparecerá em seus anúncios',
                  ),
                  Observer(builder: (_){
                    return TextField(
                      enabled: !signUpStore.loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Exemplo: José Silva',
                        isDense: true,
                        errorText: signUpStore.nameError,
                      ),
                      onChanged: signUpStore.setName,
                    );
                  },
                  ),
                  const SizedBox(height: 12,),
                  FieldTitle(
                    title: 'E-mail',
                    subtitle: 'Enviaremos um e-mail de confinação',
                  ),
                  Observer(builder: (_){
                    return TextField(
                      enabled: !signUpStore.loading,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Exemplo: jose@gmail.com',
                        isDense: true,
                        errorText: signUpStore.emailError,
                      ),
                      onChanged: signUpStore.setEmail,
                      keyboardType: TextInputType.emailAddress,
                    );
                  },
                  ),
                  const SizedBox(height: 12,),
                  FieldTitle(
                    title: 'Celular',
                    subtitle: 'Proteja sua conta',
                  ),
                  Observer(builder: (_){
                      return TextField(
                        enabled: !signUpStore.loading,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Exemplo: (99) 99999-9999',
                          isDense: true,
                          errorText: signUpStore.phoneError,
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                        onChanged: signUpStore.setPhone,
                      );
                    },
                  ),
                  const SizedBox(height: 12,),
                  FieldTitle(
                    title: 'Senha',
                    subtitle: 'Use letras, números e caracteres especiais',
                  ),
                  Observer(builder: (_){
                    return TextField(
                      enabled: !signUpStore.loading,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                        errorText: signUpStore.passwordError,
                      ),
                      obscureText: true,
                      onChanged: signUpStore.setPassword,
                    );
                  },
                  ),
                  const SizedBox(height: 12,),
                  FieldTitle(
                    title: 'Confirmar senha',
                    subtitle: 'Repita a senha',
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      enabled: !signUpStore.loading,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                        errorText: signUpStore.checkPasswordError,
                      ),
                      obscureText: true,
                      onChanged: signUpStore.setCheckPassword,
                    );
                  },
                  ),
                  const SizedBox(height: 12,),
                  Observer(builder: (_){
                    return Container(
                      height: 40,
                      child: RaisedButton(
                        color: Colors.orange,
                        child: signUpStore.loading ? CircularProgressIndicator(
                          valueColor:  AlwaysStoppedAnimation(Colors.white),
                        ) : Text('CADASTRAR'),
                        textColor: Colors.white,
                        disabledColor: Colors.orange.withAlpha(120),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: signUpStore.signUpPressed,
                      ),
                    );
                    },
                  ),
                  Divider(color: Colors.black,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Já tem conta? ',
                        style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () { Navigator.of(context).pop(); } ,
                          child: Text('Entrar',
                            style: TextStyle(decoration: TextDecoration.underline, color: Colors.purple, fontSize: 16),
                        ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
