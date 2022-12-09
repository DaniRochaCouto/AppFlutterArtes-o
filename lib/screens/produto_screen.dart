import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:random_dados/models/produo_models.dart';

class ProdutoScreen extends StatefulWidget {
  static const String id = 'produto';

  const ProdutoScreen({super.key});

  @override
  State<ProdutoScreen> createState() => _ProdutoScreenState();
}

class _ProdutoScreenState extends State<ProdutoScreen> {
  @override
  // ignore: override_on_non_overriding_member
  bool opacidade = true;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Produtos'),
        // ignore: prefer_const_constructors
        //leading: Icon(Icons.precision_manufacturing),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1.0 : 0.8,
        duration: const Duration(milliseconds: 500),
        child: Container(
          color: const Color.fromARGB(255, 208, 221, 237),
          child: ListView(
            children: const [
              Padding(
                //aula 5.4
                padding: EdgeInsets.only(top: 8),
                child: Tasks(
                    'Elefante amigurumi',
                    'lib/assets/elefante.jpeg',
                    3,
                    'Lindo demais com 30 cm de altura lindo',
                    'Preço: 100,00 '),
              ),
              Tasks('Gola Tricot', 'lib/assets/golarosa.jpg', 5,
                  'Gola bem quentinha rosa', 'Preço: 70,00'),
              Tasks('Pinguim amigurumi', 'lib/assets/pinguim.jpg', 3,
                  'Lindo pinguim de 30 cm de altura', 'Preço: 80,00 '),
              Tasks('Boneca amigurumi', 'lib/assets/boneca.jpg', 4,
                  'Boneca de 17 cm de altura', 'Preço: 130,00 '),
              Tasks('Cachecol com bolso', 'lib/assets/cachecol.jpg', 5,
                  'Cachecol com bolso', 'Preço: 100,00 '),
              Tasks('Cachorrinho amigurumi', 'lib/assets/cao.jpg', 4,
                  'Cachorrinho mini, 10 cm', '30 reais'),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        backgroundColor: Colors.blue[100],
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Tasks extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  final String descricao;
  final String preco;

  const Tasks(
      this.nome, this.foto, this.dificuldade, this.descricao, this.preco,
      {Key? key})
      : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  int level = 1;

  void levelUp() {
    setState(() {
      level++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color.fromARGB(255, 146, 75, 209),
              ),
              height: 140,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black12,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            widget.foto,
                            height: 100,
                            width: 72,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //width: 400,
                        children: [
                          Text(
                            widget.nome,
                            textWidthBasis: TextWidthBasis.parent,
                            style: const TextStyle(
                                fontSize: 18, overflow: TextOverflow.ellipsis),
                          ),
                          Difficulty(widget.dificuldade),
                          // novo componente.
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                            ),
                          ),
                          Text(
                            widget.descricao,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        top: 8,
                      ),
                      child: Container(
                        width: 200,
                        // height: 30,
                        child: Text(
                          widget.preco,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Difficulty extends StatelessWidget {
  final int dificulty;

  const Difficulty(this.dificulty, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //aula 5.4
      child: Row(
        children: [
          Icon(Icons.star,
              size: 10,
              color: (dificulty >= 1) ? Colors.blue : Colors.blue[100]),
          Icon(Icons.star,
              size: 10,
              color: (dificulty >= 2) ? Colors.blue : Colors.blue[100]),
          Icon(Icons.star,
              size: 10,
              color: (dificulty >= 3) ? Colors.blue : Colors.blue[100]),
          Icon(Icons.star,
              size: 10,
              color: (dificulty >= 4) ? Colors.blue : Colors.blue[100]),
          Icon(Icons.star,
              size: 10,
              color: (dificulty >= 5) ? Colors.blue : Colors.blue[100]),
        ],
      ),
    );
  }
}
