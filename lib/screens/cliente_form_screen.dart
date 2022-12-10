import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_dados/database/dao/contact_dao.dart';
import 'package:random_dados/models/contact.dart';
import 'package:random_dados/screens/contacts_list_screen.dart';
import 'package:random_dados/screens/pedido_form_screen.dart';
import 'package:random_dados/screens/pedido_list_screen.dart';
import 'package:uuid/uuid.dart';

import 'cadastro_secreen.dart';
import 'components/ronded_button.dart';
import 'components/rounded_text_field.dart';
import 'menu_screen.dart';

class ClienteFormScreen extends StatelessWidget {
  static const String id = 'clienteform';

  ClienteFormScreen({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  var idContact = '';
  var name = '';
  var tellNumber = '';

  ClienteFormScreenArguments arguments;

  FirebaseFirestore db = FirebaseFirestore.instance;

  CollectionReference cliente =
      FirebaseFirestore.instance.collection('cliente');

  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    if (arguments.idCliente.isNotEmpty) {
      idContact = arguments.idCliente;
      name = arguments.name;
      tellNumber = arguments.tellNumber;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de cliente'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Column(
            children: [
              TextFormField(
                initialValue: name,
                decoration:
                    const InputDecoration(label: Text("Nome do Cliente")),
                onChanged: (value) => name = value,
              ),
              TextFormField(
                initialValue: tellNumber,
                decoration: const InputDecoration(label: Text("Telefone")),
                onChanged: (value) => tellNumber = value,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 36),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                  ),
                ),
                onPressed: () {
                  final Contact newContact =
                      Contact(idContact, name, tellNumber);
                  // ignore: avoid_print
                  print('nome: $name');
                  _dao.save(newContact).then((id) => Navigator.pushNamed(
                        context,
                        // ignore: prefer_const_constructors
                        ContactsList.id,
                      ));
                },
                child: const Text(
                  'Salvar',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 36),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                  ),
                ),
                onPressed: () {
                  final Contact newContact =
                      Contact(idContact, name, tellNumber);
                  // ignore: avoid_print
                  print('nome: $name');
                  _dao.delete(newContact).then((id) => Navigator.pushNamed(
                        context,
                        // ignore: prefer_const_constructors
                        MenuScreen.id,
                      ));
                },
                child: const Text(
                  'Deletar',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 36),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                  ),
                ),
                onPressed: () {
                  final Contact newContact =
                      Contact(idContact, name, tellNumber);
                  // ignore: avoid_print
                  // print('nome: $name');
                  Navigator.pushNamed(
                      context,
                      // ignore: prefer_const_constructors
                      PedidoFormScreen.id,
                      arguments: PedidoFormScreenArguments(
                        idCliente: newContact.idCliente,
                        nameCliente: newContact.name,
                      ));
                },
                child: const Text(
                  'Novo Pedido para o Cliente',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClienteFormScreenArguments {
  ClienteFormScreenArguments(
      {required this.idCliente, required this.name, required this.tellNumber});

  String idCliente;
  String name;
  String tellNumber;
}
