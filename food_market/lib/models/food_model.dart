part of 'models.dart';

// digunakan untuk menyimpan data data makan

enum FoodType { new_food, popular, recomended }

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;
  final List<FoodType> types;

  Food(
      {this.id,
      this.picturePath,
      this.name,
      this.description,
      this.ingredients,
      this.price,
      this.rate,
      this.types = const []});

  factory Food.fromJson(Map<String, dynamic> data) => Food(
      id: data['id'],
      picturePath: data['picturePath'],
      name: data['name'],
      description: data['description'],
      ingredients: data['ingredients'],
      price: data['price'],
      rate: (data['rate'] as num).toDouble(),
      types: data['types'].toString().split(',').map((e) {
        switch (e) {
          case 'recomended':
            return FoodType.recomended;
            break;
          case 'popular':
            return FoodType.popular;
            break;
          default:
            return FoodType.new_food;
        }
      }).toList());

  @override
  List<Object> get props =>
      [id, picturePath, name, description, ingredients, price, rate];
}

// Coba untuk memasukkan salah satu data kepada box
Food mockFood = Food(
    id: 1,
    picturePath:
        "https://images.unsplash.com/photo-1467453678174-768ec283a940?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=728&q=80",
    name: "Sate Sayur Sultan",
    description: "Sate sayur sultan adalah menu vegetarian yang paling terkenal di Bandung. Sate ini dibuat dari berbagai macam bahan makanan",
    ingredients: "Bawang Merah, Prika, Bombay, Timun",
    price: 15000,
    rate: 4.5,
    types: [FoodType.new_food, FoodType.popular, FoodType.recomended]);

List<Food> mockFoods = [
  Food(
      id: 1,
      picturePath:
          "https://images.unsplash.com/photo-1467453678174-768ec283a940?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=728&q=80",
      name: "Sate Sayur Sultan",
      description:
          "Sate sayur sultan adalah menu vegetarian yang paling terkenal di Bandung. Sate ini dibuat dari berbagai macam bahan makanan",
      ingredients: "Bawang Merah, Prika, Bombay, Timun",
      price: 15000,
      types: [FoodType.new_food, FoodType.popular, FoodType.recomended],
      rate: 4.5),
  Food(
      id: 1,
      picturePath:
          "https://images.unsplash.com/photo-1467453678174-768ec283a940?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=728&q=80",
      name: "Sate Sayur Sultan",
      description: "Sate sayur sultan adalah menu vegetarian yang paling terkenal di Bandung. Sate ini dibuat dari berbagai macam bahan makanan",
      ingredients: "Bawang Merah, Prika, Bombay, Timun",
      price: 15000,
      rate: 4.5,
      types: [FoodType.new_food]),
  Food(
      id: 1,
      picturePath:
          "https://images.unsplash.com/photo-1467453678174-768ec283a940?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=728&q=80",
      name: "Sate Sayur Sultan",
      description:
          "Sate sayur sultan adalah menu vegetarian yang paling terkenal di Bandung. Sate ini dibuat dari berbagai macam bahan makanan",
      ingredients: "Bawang Merah, Prika, Bombay, Timun",
      price: 15000,
      rate: 4.5),
  Food(
      id: 1,
      picturePath:
          "https://images.unsplash.com/photo-1467453678174-768ec283a940?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=728&q=80",
      name: "Sate Sayur Sultan",
      description:
          "Sate sayur sultan adalah menu vegetarian yang paling terkenal di Bandung. Sate ini dibuat dari berbagai macam bahan makanan",
      ingredients: "Bawang Merah, Prika, Bombay, Timun",
      price: 15000,
      types: [FoodType.recomended],
      rate: 4.5)
];
