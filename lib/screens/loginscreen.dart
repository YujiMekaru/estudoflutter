import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _ctrlLogin = TextEditingController();
  final _ctrlSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        padding: EdgeInsets.only(top: 100, left: 30, right: 30),
        child: Form(
          child: ListView(
            children: [
              Text(
                'Faça o Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              TextFormField(
                controller: _ctrlLogin,
                decoration: InputDecoration(
                  labelText: "Login",
                  hintText: "Digite o Login",
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _ctrlSenha,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  hintText: "Digite a Senha",
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _clickButton(context);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.lightBlue),
                  child: Text('Entrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _clickButton(BuildContext context) async {}
}
