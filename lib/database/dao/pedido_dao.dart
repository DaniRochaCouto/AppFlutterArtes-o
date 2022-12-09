import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:random_dados/models/pedido.dart';

class PedidoDao {
  static const String _tableName = 'Pedido';
  static const String _idPedido = 'idPedido';
  static const String _nameCliente = 'nameCliente';
  static const String _descricao = 'descricao';
  static const String _dataEntrega = 'dataEntrega';

  FirebaseFirestore db = FirebaseFirestore.instance;

  CollectionReference pedidocol =
      FirebaseFirestore.instance.collection(_tableName);

  Future<void> save(Pedido pedido) {
    // ignore: avoid_print
    print('nome: $pedido');
    // Call the user's CollectionReference to add a new user
    Map<String, dynamic> pedidoMap = _toMap(pedido);
    // ignore: avoid_print
    //print(contactMap);
    return pedidocol
        .doc(pedido.idPedido)
        .set({
          "idPedido": pedido.idPedido,
          "idCliente": pedido.idCliente,
          "nameCliente": pedido.nameCliente,
          "descricao": pedido.descricao,
          "dataEntrega": pedido.dataEntrega,
        })
        .then((doc) =>
            // ignore: avoid_print
            print("DocumentSnapshot added with ID: ${pedido.idPedido}"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> delete(Pedido pedido) {
    // ignore: avoid_print
    print('nome: $pedido');
    // Call the user's CollectionReference to add a new user
    Map<String, dynamic> pedidoMap = _toMap(pedido);

    return pedidocol
        .doc(pedido.idPedido)
        .delete()
        .then((doc) =>
            // ignore: avoid_print
            print("DocumentSnapshot deletado with ID: $pedido"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<List<Pedido>> findAll() async {
    List<Pedido> result = [];

    QuerySnapshot query = await db.collection(_tableName).get();
    query.docs.forEach((element) {
      String idPedido = element.get(_idPedido);
      String idCliente = element.get("idCliente");
      String nameCliente = element.get(_nameCliente);
      String descricao = element.get(_descricao);
      String dataEntrega = element.get(_dataEntrega);

      //print(idCliente);
      final Pedido newPedido =
          Pedido(idPedido, idCliente, nameCliente, descricao, dataEntrega);
      print(newPedido.idCliente);
      print(newPedido.descricao);
      result.add(newPedido);
    });
    return result;
  }

  Map<String, dynamic> _toMap(Pedido pedido) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_idPedido] = pedido.idPedido;
    contactMap['idCliente'] = pedido.idCliente;
    contactMap[_nameCliente] = pedido.nameCliente;
    contactMap[_descricao] = pedido.descricao;
    contactMap[_dataEntrega] = pedido.dataEntrega;
    return contactMap;
  }

  List<Pedido> _toList(List<Map<String, dynamic>> result) {
    final List<Pedido> pedidos = [];
    for (Map<String, dynamic> row in result) {
      final Pedido pedido = Pedido(
        row[_idPedido],
        row['_idCliente'],
        row[_nameCliente],
        row[_descricao],
        row[_dataEntrega],
      );
      pedidos.add(pedido);
    }
    return pedidos;
  }
}
