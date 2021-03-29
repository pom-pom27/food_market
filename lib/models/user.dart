part of 'model.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final String picturePath;

  const User(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.houseNumber,
      this.phoneNumber,
      this.city,
      this.picturePath});

  @override
  List<Object> get props =>
      [id, name, email, address, houseNumber, phoneNumber, city, picturePath];
}

User userDummy = const User(
  id: 1,
  name: 'Dababy',
  address: 'Jl Makmur',
  city: 'Bekasi',
  houseNumber: 'A3',
  phoneNumber: '089223312',
  email: 'wawo@gmail.com',
  picturePath: 'https://static.thenounproject.com/png/630729-200.png',
);
