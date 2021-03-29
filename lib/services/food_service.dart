part of 'services.dart';

class FoodService {
  static Future<ApiReturnValue<List<Food>>> getFoods() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return ApiReturnValue(value: listFood);
  }
}
