class Dish {
  // ID do prato
  final String id;
  // Nome do prato
  final String name;
  // Descrição do prato
  final String description;
  // Preço do prato
  final int price;
  // Caminho da imagem do prato
  final String imagePath;

  Dish({
    // Construtor do prato
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
  // Método para converter o objeto Dish para um mapa
  Map<String, dynamic> toMap() {
    return {
      // Chave 'id' do mapa recebe o valor do id do prato
      'id': id,
      // Chave 'name' do mapa recebe o valor do name do prato
      'name': name,
      // Chave 'description' do mapa recebe o valor do description do prato
      'description': description,
      // Chave 'price' do mapa recebe o valor do price do prato
      'price': price,
      // Chave 'imagePath' do mapa recebe o valor do imagePath do prato
      'imagePath': imagePath,
    };
  }

  // Construtor factory para criar um objeto Dish a partir de um mapa
  factory Dish.fromMap(Map<String, dynamic> map) {
    return Dish(
      // O id do prato é atribuído a partir do mapa
      id: map['id'],
      // O nome do prato é atribuído a partir do mapa
      name: map['name'],
      // A descrição do prato é atribuída a partir do mapa
      description: map['description'],
      // O preço do prato é atribuído a partir do mapa
      price: map['price'],
      // O caminho da imagem do prato é atribuído a partir do mapa
      imagePath: map['imagePath'],
    );
  }

  @override
  String toString() {
    return 'Dish(id: $id, name: $name, description: $description, price: $price, imagePath: $imagePath)';
  }
}
