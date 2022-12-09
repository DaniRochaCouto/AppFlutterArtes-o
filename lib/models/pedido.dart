class Pedido {
  //final String? idCliente;
  final String idPedido;
  final String idCliente;
  final String nameCliente;
  final String descricao;
  final String dataEntrega;

  // Contact(
  //   this.name,
  //   this.tellNumber, {
  //   this.idCliente,
  // });

  Pedido(
    this.idPedido,
    this.idCliente,
    this.nameCliente,
    this.descricao,
    this.dataEntrega,
  );
  @override
  String toString() {
    return 'Contact{idCliente: $idPedido, name: $nameCliente, descricao: $descricao, dataEntrega: $dataEntrega}';
  }
}
