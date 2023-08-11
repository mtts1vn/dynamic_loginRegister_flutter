import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

enum FormType { login, register }

class _HomeState extends State<Home> {
  FormType _formType = FormType.login;

  String hintLoginButton = "Login";
  login() {
    print('logou');
  }

  register() {
    print('registrou');
  }

  swithForm() {
    switch (_formType) {
      case FormType.login:
        setState(() {
          _formType = FormType.register;
          hintLoginButton = "Criar Conta";
        });
        break;
      case FormType.register:
        setState(() {
          _formType = FormType.login;
          hintLoginButton = "Login";
        });
        break;
    }
  }

  Widget buttonLRWidgetLogin(Function action) {
    return ElevatedButton(
      onPressed: () => action(),
      child: Text(hintLoginButton),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            height: MediaQuery.of(context).size.width * .9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    icon: Icon(Icons.email_rounded),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    icon: Icon(Icons.shield),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: buttonLRWidgetLogin(
                    _formType == FormType.login ? login : register,
                  ),
                ),
                TextButton(
                  onPressed: () => swithForm(),
                  child: Text(
                    _formType == FormType.register
                        ? 'Já tem uma conta?'
                        : 'Criar uma conta',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
