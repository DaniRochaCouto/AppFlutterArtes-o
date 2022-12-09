// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:random_dados/screens/cadastro_secreen.dart';
import 'package:random_dados/screens/cliente_form_screen.dart';
import 'package:random_dados/screens/contact_form_screen.dart';
import 'package:random_dados/screens/contacts_list_screen.dart';
import 'package:random_dados/screens/detalha_pedido_screen.dart';
import 'package:random_dados/screens/inicio_screen.dart';
import 'package:random_dados/screens/pedido_form_screen.dart';
import 'package:random_dados/screens/pedido_list_screen.dart';
import 'package:random_dados/screens/produto_screen.dart';

import 'firebase_options.dart';
import 'package:random_dados/screens/dice_screen.dart';
import 'package:random_dados/screens/login_screen.dart';
import 'package:random_dados/screens/menu_screen.dart';
import 'package:random_dados/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        ContactFormScreen.id: (context) => ContactFormScreen(),
        PedidoFormScreen.id: (context) => PedidoFormScreen(
              arguments: ModalRoute.of(context)!.settings.arguments
                  as PedidoFormScreenArguments,
            ),
        DetalhaPedidoScreen.id: (context) => DetalhaPedidoScreen(
              arguments: ModalRoute.of(context)!.settings.arguments
                  as DetalhaPedidoScreenArguments,
            ),
        ContactsList.id: (context) => ContactsList(),
        PedidoList.id: (context) => PedidoList(),
        SplashScreen.id: (context) => SplashScreen(),
        MenuScreen.id: (context) => MenuScreen(),
        // PersonalCardScreen.id: (context) => PersonalCardScreen(
        //       arguments: ModalRoute.of(context)!.settings.arguments
        //           as PersonalCardScreenArguments,
        //     ),
        DiceScreen.id: (context) => DiceScreen(),
        // QuizScreen.id: (context) => QuizScreen(),
        // QuizCompleteScreen.id: (context) => QuizCompleteScreen(
        //       arguments: ModalRoute.of(context)!.settings.arguments
        //           as QuizCompleteArguments,
        //     ),
        ProdutoScreen.id: (context) => ProdutoScreen(),
        CadastroScreen.id: (context) => CadastroScreen(),
        InicioScreen.id: (context) => InicioScreen(),
        ClienteFormScreen.id: (context) => ClienteFormScreen(
              arguments: ModalRoute.of(context)!.settings.arguments
                  as ClienteFormScreenArguments,
            ),
      },
    );
  }
}
