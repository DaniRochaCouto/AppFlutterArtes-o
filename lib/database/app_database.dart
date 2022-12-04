// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// FirebaseFirestore firestore = FirebaseFirestore.instance;

// Future<void> addUser() {
//       // Call the user's CollectionReference to add a new user
//       return users
//           .add({
//             'full_name': fullName, // John Doe
//             'company': company, // Stokes and Sons
//             'age': age // 42
//           })
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }

// Future<Database> getDatabase() async {
//   final String path = join(await getDatabasesPath(), 'bytebank.db');
//   return openDatabase(
//     path,
//     onCreate: (db, version) {
//       db.execute(ContactDao.tableSql);
//     },
//     version: 1,
//   );
// }

