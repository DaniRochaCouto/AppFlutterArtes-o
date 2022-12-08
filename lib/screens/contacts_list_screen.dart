import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:random_dados/database/dao/contact_dao.dart';
import 'package:random_dados/models/contact.dart';
import 'package:random_dados/screens/contact_form_screen.dart';

class ContactsList extends StatefulWidget {
  static const String id = 'clientelist';

  // ignore: prefer_const_constructors_in_immutables
  ContactsList({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();
  List<Contact> _contactsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
        // ignore: deprecated_member_use
        initialData: _contactsList,
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading')
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              print("conection done");
              print(snapshot);
              Stream<List<Contact>> ListStream = _dao.findAll().asStream();
              _contactsList = snapshot.data!;
              //_contactsList = snapshot.
              //print(ListStream);
              //snapshot.data!.docs.map((DocumentSnapshot document) {
              //Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = _contactsList[index];
                  return _ContactItem(contact);
                },
                itemCount: _contactsList.length,
              );
              break;
          }
          return Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  // ignore: prefer_const_constructors
                  builder: (context) => ContactFormScreen(),
                ),
              )
              .then(
                (value) => setState(() {}),
              );
        },
        // ignore: prefer_const_constructors
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contact.tellNumber.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        onTap: () => {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  // ignore: prefer_const_constructors
                  builder: (context) => ContactFormScreen(),
                ),
              )
              .then(
                (value) => setState(() {}),
              )
        },
      ),
    );
  }

  setState(Null Function() param0) {}
}
