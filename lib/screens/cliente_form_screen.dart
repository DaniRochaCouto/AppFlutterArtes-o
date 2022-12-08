import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_dados/database/dao/contact_dao.dart';
import 'package:random_dados/models/contact.dart';
import 'package:uuid/uuid.dart';

import 'cadastro_secreen.dart';
import 'components/ronded_button.dart';
import 'components/rounded_text_field.dart';
import 'menu_screen.dart';

class ClienteFormScreen extends StatelessWidget {
  static const String id = 'clienteform';

  ClienteFormScreen({super.key});
  FirebaseFirestore db = FirebaseFirestore.instance;

  CollectionReference cliente =
      FirebaseFirestore.instance.collection('cliente');
  String name = '';
  String tellNumber = '';
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Clientes'),
      ),
      backgroundColor: Color.fromARGB(255, 13, 219, 237),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Insira os dados do novo cliente',
                style: GoogleFonts.pacifico(
                  fontSize: 23,
                  color: Color.fromARGB(255, 14, 24, 215),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              RoundedTextField(
                text: 'Nome',
                onChanged: (value) => name = value,
              ),
              const SizedBox(height: 32),
              RoundedTextField(
                text: 'Telefone',
                onChanged: (value) => tellNumber = value,
                obscureText: false,
              ),
              const SizedBox(height: 64),
              RoundedButton(
                  text: 'Salvar',
                  onPressed: () {
                    final String idContact = const Uuid().v1();
                    print('Uuid= $idContact');

                    final Contact newContact =
                        Contact(idContact, name, tellNumber);
                    print('nome: $newContact');
                    _dao.save(newContact).then((id) => Navigator.pop(context));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
