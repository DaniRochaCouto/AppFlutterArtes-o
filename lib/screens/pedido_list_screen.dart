import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:random_dados/database/dao/contact_dao.dart';
import 'package:random_dados/database/dao/pedido_dao.dart';
import 'package:random_dados/models/contact.dart';
import 'package:random_dados/models/pedido.dart';
import 'package:random_dados/screens/cliente_form_screen.dart';
import 'package:random_dados/screens/contact_form_screen.dart';
import 'package:random_dados/screens/detalha_pedido_screen.dart';
import 'package:random_dados/screens/pedido_form_screen.dart';

class PedidoList extends StatefulWidget {
  static const String id = 'pedidolist';

  // ignore: prefer_const_constructors_in_immutables
  PedidoList({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _PedidoListState createState() => _PedidoListState();
}

class _PedidoListState extends State<PedidoList> {
  final PedidoDao _dao = PedidoDao();
  List<Pedido> _pedidoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Pedidos'),
      ),
      body: FutureBuilder<List<Pedido>>(
        // ignore: deprecated_member_use
        initialData: _pedidoList,
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
              Stream<List<Pedido>> ListStream = _dao.findAll().asStream();
              _pedidoList = snapshot.data!;
              //_contactsList = snapshot.
              //print(ListStream);
              //snapshot.data!.docs.map((DocumentSnapshot document) {
              //Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Pedido pedido = _pedidoList[index];
                  return _PedidoItem(pedido);
                },
                itemCount: _pedidoList.length,
              );
              break;
          }
          return Text('Unknown error');
        },
      ),
    );
  }
}

class _PedidoItem extends StatelessWidget {
  final Pedido pedido;

  _PedidoItem(this.pedido);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          pedido.descricao,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          'Cliente: ${pedido.nameCliente}, data de entrega: ${pedido.dataEntrega}',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        onTap: () => {
          Navigator.pushNamed(context, DetalhaPedidoScreen.id,
              arguments: DetalhaPedidoScreenArguments(
                descricao: pedido.descricao,
                data: pedido.dataEntrega,
                idPedido: pedido.idPedido,
                idCliente: pedido.idCliente,
                nameCliente: pedido.nameCliente,
              )).then(
            (value) => setState(() {}),
          )
        },
      ),
    );
  }

  setState(Null Function() param0) {}
}
