class Contact {
  //final String id_cliente;
  final String name;
  final String tellNumber;

  Contact(
    //this.id_cliente,
    this.name,
    this.tellNumber,
  );

  @override
  String toString() {
    return 'Contact{name: $name, tellNumber: $tellNumber}';
  }
}
