import 'package:flutter/material.dart';
import 'package:random_dados/database/dao/contact_dao.dart';
import 'package:random_dados/models/contact.dart';
import 'package:uuid/uuid.dart';

class ContactFormScreen extends StatefulWidget {
  static const String id = 'contactformscreen';

  const ContactFormScreen({super.key});

  @override
  State<ContactFormScreen> createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends State<ContactFormScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _tellNumberController = TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome do cliente',
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
                  labelText: 'Telefone do cliente',
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
                  child: Text('Create'),
                  onPressed: () {
                    final String idContact = const Uuid().v1();
                    print('Uuid= $idContact');

                    final String name = _nameController.text;
                    final String tellNumber = _tellNumberController.text;
                    final Contact newContact =
                        Contact(idContact, name, tellNumber);
                    // ignore: avoid_print
                    print('nome: $name');
                    _dao.save(newContact).then((id) => Navigator.pop(context));
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
