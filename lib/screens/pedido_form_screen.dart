import 'package:flutter/material.dart';
import 'package:random_dados/database/dao/pedido_dao.dart';
import 'package:random_dados/models/pedido.dart';
import 'package:random_dados/screens/contacts_list_screen.dart';
import 'package:random_dados/screens/menu_screen.dart';
import 'package:uuid/uuid.dart';

class PedidoFormScreen extends StatelessWidget {
  static const String id = 'Pedidoformscreen';

  PedidoFormScreenArguments arguments;

  PedidoFormScreen({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  //final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  final PedidoDao _dao = PedidoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Pedido para o Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // TextField(
            //   controller: _dataController,
            //   decoration: InputDecoration(
            //     labelText: 'Nome: ${arguments.nameCliente}',
            //   ),
            //   style: TextStyle(
            //     fontSize: 24.0,
            //   ),
            // ),
            // TextField(
            //   controller: _dataController,
            //   decoration: InputDecoration(
            //     labelText: 'Data da Entrega do Pedido',
            //   ),
            //   style: TextStyle(
            //     fontSize: 24.0,
            //   ),
            // ),
            TextField(
              controller: _dataController,
              decoration: InputDecoration(
                labelText: 'Data da Entrega do Pedido',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _descricaoController,
                decoration: InputDecoration(
                  labelText: 'Descriçao do Pedido',
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
                    final String idPedido = const Uuid().v1();
                    print('Uuid= $idPedido');

                    final String idCliente = arguments.idCliente;
                    final String name = arguments.nameCliente;
                    final String descricao = _descricaoController.text;
                    final String data = _dataController.text;
                    final Pedido newPedido =
                        Pedido(idPedido, idCliente, name, descricao, data);
                    // ignore: avoid_print
                    print('nome: $name');
                    _dao.save(newPedido).then((id) => Navigator.pushNamed(
                          context,
                          // ignore: prefer_const_constructors
                          MenuScreen.id,
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

class PedidoFormScreenArguments {
  PedidoFormScreenArguments(
      {required this.idCliente, required this.nameCliente});

  String idCliente;
  String nameCliente;
}
