import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/ronded_button.dart';
import 'components/rounded_text_field.dart';
import 'menu_screen.dart';

// ignore: must_be_immutable
class CadastroScreen extends StatelessWidget {
  static const String id = 'cadastro';

  CadastroScreen({super.key});

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App do artesão'),
      ),
      backgroundColor: Color.fromARGB(255, 13, 219, 237),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Produtos, Receitas, Loja',
                style: GoogleFonts.pacifico(
                  fontSize: 23,
                  color: Color.fromARGB(255, 14, 24, 215),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Esse App vai te ajudar a organizar suas receitas, entregas, '
                'lista de produtos disponíveis, contato de clientes, '
                'tudo num só lugar!!!',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.pacifico(
                  fontSize: 20,
                  color: Color.fromARGB(255, 14, 24, 215),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              RoundedTextField(
                text: 'Email',
                onChanged: (value) => email = value,
              ),
              const SizedBox(height: 32),
              RoundedTextField(
                text: 'Senha',
                onChanged: (value) => password = value,
                obscureText: true,
              ),
              const SizedBox(height: 64),
              RoundedButton(
                text: 'Cadastrar',
                onPressed: () => authenticateUser(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  void authenticateUser(BuildContext context) async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((userCredential) {
      Navigator.pushReplacementNamed(context, MenuScreen.id);
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message),
        ),
      );
    });
  }
}
