import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cadastro_secreen.dart';
import 'components/ronded_button.dart';
import 'components/rounded_text_field.dart';
import 'login_screen.dart';
import 'menu_screen.dart';

// ignore: must_be_immutable
class InicioScreen extends StatelessWidget {
  static const String id = 'inicio';

  InicioScreen({super.key});

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
              RoundedButton(
                text: 'Login',
                onPressed: () => Navigator.pushNamed(
                  context,
                  LoginScreen.id,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Ou...',
                style: GoogleFonts.pacifico(
                  fontSize: 23,
                  color: Color.fromARGB(255, 14, 24, 215),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              RoundedButton(
                text: 'Cadastro',
                onPressed: () => Navigator.pushNamed(
                  context,
                  CadastroScreen.id,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
