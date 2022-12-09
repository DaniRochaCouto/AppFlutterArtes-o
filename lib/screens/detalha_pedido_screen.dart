import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_dados/database/dao/pedido_dao.dart';
import 'package:random_dados/models/pedido.dart';
import 'package:random_dados/screens/contacts_list_screen.dart';
import 'package:random_dados/screens/menu_screen.dart';
import 'package:uuid/uuid.dart';

class DetalhaPedidoScreen extends StatelessWidget {
  static const String id = 'DetalhaPedidocreen';

  DetalhaPedidoScreenArguments arguments;

  DetalhaPedidoScreen({
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
        title: Text('Detalhes do Pedido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Nome cliente:',
                  style: GoogleFonts.archivo(
                    fontSize: 26,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  arguments.nameCliente,
                  style: GoogleFonts.archivo(
                    fontSize: 26,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Descrição:',
                  style: GoogleFonts.archivo(
                    fontSize: 26,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  arguments.descricao,
                  style: GoogleFonts.archivo(
                    fontSize: 26,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Data entrega:',
                  style: GoogleFonts.archivo(
                    fontSize: 26,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  arguments.data,
                  style: GoogleFonts.archivo(
                    fontSize: 26,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              'Edite informando os novos campos ou delete',
              textAlign: TextAlign.center,
              style: GoogleFonts.archivo(
                fontSize: 26,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _dataController,
              decoration: InputDecoration(
                labelText: 'Nova Data da Entrega do Pedido',
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
                  labelText: 'Nova Descriçao do Pedido',
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
                  child: Text('Edite'),
                  onPressed: () {
                    final String idPedido = arguments.idPedido;
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: TextButton(
                  // ignore: prefer_const_constructors
                  child: Text('Delete'),
                  onPressed: () {
                    final String idPedido = arguments.idPedido;

                    final String idCliente = arguments.idCliente;
                    final String name = arguments.nameCliente;
                    final String descricao = arguments.descricao;
                    final String data = arguments.data;
                    final Pedido newPedido =
                        Pedido(idPedido, idCliente, name, descricao, data);
                    // ignore: avoid_print
                    print('nome: $name');
                    _dao.delete(newPedido).then((id) => Navigator.pushNamed(
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
                  child: Text('Novo Pedido para o Cliente'),
                  onPressed: () {
                    final String idPedido = const Uuid().v1();
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

class DetalhaPedidoScreenArguments {
  DetalhaPedidoScreenArguments(
      {required this.idCliente,
      required this.idPedido,
      required this.nameCliente,
      required this.descricao,
      required this.data});
  String descricao;
  String data;
  String idCliente;
  String idPedido;
  String nameCliente;
}
