import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_dados/screens/cliente_form_screen.dart';
import 'package:random_dados/screens/contact_form_screen.dart';
import 'package:random_dados/screens/produto_screen.dart';

import 'components/ronded_button.dart';
import 'dice_screen.dart';
import 'login_screen.dart';

class MenuScreen extends StatelessWidget {
  static const String id = 'menu_screen';

  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 146, 75, 209),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Menu inicial',
                style: GoogleFonts.pacifico(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: double.infinity,
                height: 32,
              ),
              // RoundedButton(
              //   text: 'Cartão pessoal',
              //   onPressed: () {
              //     Navigator.pushNamed(context, PersonalCardScreen.id,
              //         arguments: PersonalCardScreenArguments(
              //           phone: '11 123456789',
              //           email: 'teste@testinho.com',
              //         ));
              //   },
              // ),
              RoundedButton(
                text: 'Entregas',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    DiceScreen.id,
                  );
                },
              ),
              const SizedBox(height: 16),
              RoundedButton(
                text: 'Receitas',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    DiceScreen.id,
                  );
                },
              ),
              const SizedBox(height: 16),
              RoundedButton(
                text: 'Clientes',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    // ignore: prefer_const_constructors
                    ClienteFormScreen.id,
                  );
                },
              ),
              // const SizedBox(height: 16),
              // RoundedButton(
              //   text: 'Quiz',
              //   onPressed: () {
              //     Navigator.pushNamed(
              //       context,
              //       QuizScreen.id,
              //     );
              //   },
              // ),
              const SizedBox(height: 16),
              RoundedButton(
                text: 'Lista de Produtos',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    ProdutoScreen.id,
                  );
                },
              ),
              const SizedBox(height: 16),
              RoundedButton(
                text: 'Desestresse',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    DiceScreen.id,
                  );
                },
              ),
              const SizedBox(height: 16),
              RoundedButton(
                text: 'Sair',
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(
                    context,
                    LoginScreen.id,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
