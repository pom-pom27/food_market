part of 'model.dart';

enum FoodType { new_food, popular, recommend }

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rating;
  final List<FoodType> types;

  const Food(
      {this.id,
      this.picturePath,
      this.name,
      this.types,
      this.description,
      this.ingredients,
      this.price,
      this.rating});

  @override
  List<Object> get props =>
      [id, picturePath, name, description, ingredients, price, rating];
}

Food dummyFood = const Food(
    id: 1,
    description:
        "Sate Sayur Sultan adolph menu sate vegan paling terkenal di Bandung. Sate ini di buat dari berbagai macam bahan",
    name: "Sate Sayur Sultan",
    ingredients: "Bawang Merah, Paprika, Bawang Bombay, Timun",
    picturePath: "https://picsum.photos/300/200",
    price: 150000,
    rating: 4.5,
    types: [FoodType.new_food, FoodType.popular, FoodType.recommend]);

List<Food> listFood = [
  const Food(
    id: 1,
    description:
        "Sate Sayur Sultan adalah menu sate vegan paling terkenal di Bandung. Sate ini di buat dari berbagai macam bahan",
    name: "Sate Sayur Sultan",
    ingredients: "Bawang Merah, Paprika, Bawang Bombay, Timun",
    picturePath: "https://picsum.photos/300/200",
    price: 130000,
    rating: 4.5,
    types: [
      FoodType.new_food,
      FoodType.popular,
    ],
  ),
  const Food(
    id: 2,
    description:
        "Sate Sayur Sultan adalah menu sate vegan paling terkenal di Bandung. Sate ini di buat dari berbagai macam bahan",
    name: "Sate sda Sultan",
    ingredients: "Bawang Merah, Paprika, Bawang Bombay, Timun",
    picturePath: "https://picsum.photos/300/200",
    price: 130000,
    rating: 4.5,
    types: [
      FoodType.popular,
    ],
  ),
  const Food(
    id: 3,
    description:
        "Sate Sayur Sultan adalah menu sate vegan paling terkenal di Bandung. Sate ini di buat dari berbagai macam bahan",
    name: "Sate Sayur dfd",
    ingredients: "Bawang Merah, Paprika, Bawang Bombay, Timun",
    picturePath: "https://picsum.photos/300/200",
    price: 140000,
    rating: 4.5,
    types: [FoodType.recommend],
  ),
  const Food(
    id: 4,
    description:
        "Sate Sayur Sultan adalah menu sate vegan paling terkenal di Bandung. Sate ini di buat dari berbagai macam bahan",
    name: "Sate Sayur Sultasan",
    ingredients: "Bawang Merah, Paprika, Bawang Bombay, Timun",
    picturePath: "https://picsum.photos/300/200",
    price: 180000,
    rating: 4.5,
    types: [FoodType.new_food, FoodType.recommend],
  ),
  const Food(
    id: 5,
    description:
        "Sate Sayur Sultan adalah menu sate vegan paling terkenal di Bandung. Sate ini di buat dari berbagai macam bahan",
    name: "Sate Sayur Seweultan",
    ingredients: "Bawang Merah, Paprika, Bawang Bombay, Timun",
    picturePath: "https://picsum.photos/300/200",
    price: 190000,
    rating: 4.5,
    types: [FoodType.popular],
  ),
];
