import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_database/firebase_database.dart';

import 'package:random_dados/models/contact.dart';

class ContactDao {
  // static const String tableSql = 'CREATE TABLE $_tableName('
  //     '$_id INTEGER PRIMARY KEY, '
  //     '$_name TEXT, '
  //     '$_accountNumber INTEGER)';
  static const String _tableName = 'cliente';
  static const String _id_cliente = 'id_cliente';
  static const String _name = 'name';
  static const String _tellNumber = 'tell_number';

  FirebaseFirestore db = FirebaseFirestore.instance;
  //FirebaseDatabase database = FirebaseDatabase.instance;
  //DatabaseReference ref = FirebaseDatabase.instance.ref();
  CollectionReference cliente =
      FirebaseFirestore.instance.collection('cliente');

  Future<void> save(Contact contact) {
    // ignore: avoid_print
    print('nome: $contact');
    // Call the user's CollectionReference to add a new user
    Map<String, dynamic> contactMap = _toMap(contact);
    // ignore: avoid_print
    print(contactMap);
    //ref.set(contactMap);
    //db
    //.collection("cliente")
    return cliente
        .add(contactMap)
        .then((DocumentReference doc) =>
            // ignore: avoid_print
            print('DocumentSnapshot added with ID: ${doc.id}'))
        // return cliente
        //     .add({
        //       'name': contact.name, // Stokes and Sons
        //       'tellNumber': contact.tellNumber // 42
        //     })
        //     //   .add(contact)
        //     .then((value) => print("Client Added"))
        // ignore: avoid_print
        .catchError((error) => print("Failed to add user: $error"));
  }
  // Future<int> save(Contact contact) async {
  //   final Database db = await getDatabase();
  //   Map<String, dynamic> contactMap = _toMap(contact);
  //   return db.insert(_tableName, contactMap);
  // }

  Future<List<Contact>> findAll() async {
    List<Map<String, dynamic>> result = [];
    await db.collection("cliente").get().then((event) {
      for (var doc in event.docs) {
        result = doc as List<Map<String, dynamic>>;
        print("${doc.id} => ${doc.data()}");
      }
    });
    //   final Database db = await getDatabase();
    //final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contact> contacts = _toList(result);
    return contacts;
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_tellNumber] = contact.tellNumber;
    return contactMap;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        //row[_id_cliente],
        row[_name],
        row[_tellNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
