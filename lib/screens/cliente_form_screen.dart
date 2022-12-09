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

  ClienteFormScreenArguments arguments;

  FirebaseFirestore db = FirebaseFirestore.instance;

  CollectionReference cliente =
      FirebaseFirestore.instance.collection('cliente');

  String tellNumber = '';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _tellNumberController = TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reeditando o cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: arguments.name,
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _tellNumberController,
                decoration: InputDecoration(
                  labelText: arguments.tellNumber,
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: TextButton(
                  // ignore: prefer_const_constructors
                  child: Text('Salve os dados alterados'),
                  onPressed: () {
                    final String idContact = arguments.idCliente;

                    final String name = _nameController.text;
                    final String tellNumber = _tellNumberController.text;
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
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: TextButton(
                  // ignore: prefer_const_constructors
                  child: Text('Delete o cliente'),
                  onPressed: () {
                    final String idContact = arguments.idCliente;

                    final String name = _nameController.text;
                    final String tellNumber = _tellNumberController.text;
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
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: TextButton(
                  // ignore: prefer_const_constructors
                  child: Text('Insira uma pedido para o cliente'),
                  onPressed: () {
                    final String idContact = arguments.idCliente;

                    final String name = arguments.name;
                    final String tellNumber = _tellNumberController.text;
                    final Contact newContact =
                        Contact(idContact, name, tellNumber);
                    // ignore: avoid_print
                    print('nome: $name');
                    Navigator.pushNamed(
                        context,
                        // ignore: prefer_const_constructors
                        PedidoFormScreen.id,
                        arguments: PedidoFormScreenArguments(
                          idCliente: newContact.idCliente,
                          nameCliente: newContact.name,
                          // idCliente: "dani",
                          // name: "dani",
                          // tellNumber: "26726826",
                        ));
                  },
                ),
              ),
            )
          ],
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


//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cadastro de Clientes'),
//       ),
//       backgroundColor: Color.fromARGB(255, 13, 219, 237),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Insira os dados do novo cliente',
//                 style: GoogleFonts.pacifico(
//                   fontSize: 23,
//                   color: Color.fromARGB(255, 14, 24, 215),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 32),
//               RoundedTextField(
//                 text: 'Nome',
//                 onChanged: (value) => arguments.name = value,
//               ),
//               const SizedBox(height: 32),
//               RoundedTextField(
//                 text: 'Telefone',
//                 onChanged: (value) => arguments.tellNumber = value,
//                 obscureText: false,
//               ),
//               const SizedBox(height: 64),
//               RoundedButton(
//                   text: 'Salvar',
//                   onPressed: () {
//                     final String idContact = arguments.idCliente;

//                     final Contact newContact =
//                         Contact(idContact, name, tellNumber);
//                     //print('nome: $newContact');
//                     _dao.save(newContact).then((id) => Navigator.pop(context));
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


