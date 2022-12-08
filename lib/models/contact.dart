class Contact {
  //final String? idCliente;
  final String idCliente;
  final String name;
  final String tellNumber;

  // Contact(
  //   this.name,
  //   this.tellNumber, {
  //   this.idCliente,
  // });

  Contact(
    this.idCliente,
    this.name,
    this.tellNumber,
  );
  @override
  String toString() {
    return 'Contact{idCliente: $idCliente, name: $name, tellNumber: $tellNumber}';
  }
}
