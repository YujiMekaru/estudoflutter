import 'dart:async';
import 'dart:convert';

import 'package:estudoflutter/model/usuario.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  int selectedradio = 0;

  final _ctrlLogin = TextEditingController();
  final _ctrlCPF = TextEditingController();
  final _ctrlTelefone = TextEditingController();
  final _ctrlSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    selectedradio = 1;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedradio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        padding: EdgeInsets.only(top: 100, left: 30, right: 30),
        child: Form(
          key: _formKey,
          child: ListView(children: [
            Text(
              'Faça seu Cadastro',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonBar(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: selectedradio,
                      activeColor: Colors.white,
                      onChanged: (val) {
                        print("Radio $val");
                        int val2 = int.parse(val.toString());
                        setSelectedRadio(val2);
                      },
                    ),
                    Text(
                      'Cliente',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                      value: 2,
                      groupValue: selectedradio,
                      activeColor: Colors.white,
                      onChanged: (val) {
                        print("Radio $val");
                        int val2 = int.parse(val.toString());
                        setSelectedRadio(val2);
                      },
                    ),
                    Text(
                      'Mecânico',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 50),
            _textFormField(
              "Nome",
              "Digite o nome",
              controller: _ctrlLogin,
              validator: _validaLogin,
            ),
            SizedBox(height: 50),
            _textFormField(
              "Cpf",
              "Digite o CPF",
              controller: _ctrlCPF,
              validator: _validaLogin,
            ),
            SizedBox(height: 50),
            _textFormField(
              "Telefone",
              "Digite o Telefone",
              controller: _ctrlTelefone,
              validator: _validaLogin,
            ),
            SizedBox(height: 50),
            _textFormField(
              "Senha",
              "Digite a senha",
              senha: true,
              controller: _ctrlSenha,
              validator: _validaSenha,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _clickButton(context);
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, onPrimary: Colors.lightBlue),
                child: Text('Efetuar Cadastro'),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  String? _validaLogin(String? texto) {
    if (texto == "") {
      return "Preencha todos os campos";
    }
    return null;
  }

  String? _validaSenha(String? texto) {
    if (texto == "") {
      return "Digite a senha";
    }
    return null;
  }

  _textFormField(String label, String hint,
      {bool senha = false,
      required TextEditingController controller,
      required FormFieldValidator<String> validator}) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: senha,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white70),
      ),
    );
  }

  _clickButton(BuildContext context) async {
    bool formOk = _formKey.currentState!.validate();
    print('comeco');
    if (!formOk) {
      print('meio');
      return;
    }
    var url = Uri.parse('https://f40a9ab5f92d.ngrok.io/api/usuarios');

    Usuario usuario = new Usuario(
        nome: _ctrlLogin.text,
        cpf: _ctrlCPF.text,
        senha: _ctrlSenha.text,
        cargo: selectedradio,
        telefone: _ctrlTelefone.text);

    _showToast(context, "Cadastrando...");

    var response = await cadastrar(url, usuario);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    if (response.statusCode == 201) {
      _showToast(context, "Cadastrado com sucesso!");
      FocusScope.of(context).unfocus();
      Navigator.pop(context);
    } else {
      _showToast(context, "Erro ao cadastrar.");
      FocusScope.of(context).unfocus();
    }
  }

  Future<http.Response> cadastrar(Uri url, Usuario usuario) async {
    final response;
    response = await http
        .post(url,
            headers: <String, String>{
              'Content-Type': 'application/json;charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'nome': usuario.nome,
              'cpf': usuario.cpf,
              'telefone': usuario.telefone,
              'senha': usuario.senha,
              'cargo': usuario.cargo.toString()
            }))
        .timeout(Duration(seconds: 10));

    if (response.statusCode == 201) {
      print('201 criou');
    } else {
      print('erro ao cadastrar');
    }
    return response;
  }

  void _showToast(BuildContext context, String text) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
