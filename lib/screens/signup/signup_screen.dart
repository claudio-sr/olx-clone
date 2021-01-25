import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo_clone/screens/signup/field_title.dart';

class SignUpScreen extends StatelessWidget {
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
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Exemplo: José Silva',
                      isDense: true,
                    ),
                  ),
                  const SizedBox(height: 12,),
                  FieldTitle(
                    title: 'E-mail',
                    subtitle: 'Enviaremos um e-mail de confinação',
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Exemplo: jose@gmail.com',
                      isDense: true,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 12,),
                  FieldTitle(
                    title: 'Celular',
                    subtitle: 'Proteja sua conta',
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Exemplo: (99) 99999-9999',
                      isDense: true,
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  FieldTitle(
                    title: 'Senha',
                    subtitle: 'Use letras, búmeros e caracteres especiais',
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      isDense: true,
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 12,),
                  FieldTitle(
                    title: 'Confirmar senha',
                    subtitle: 'Repita a senha',
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      isDense: true,
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 12,),
                  Container(
                    height: 40,
                    child: RaisedButton(
                      color: Colors.orange,
                      child: Text('CADASTRAR'),
                      textColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: (){},
                    ),
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
