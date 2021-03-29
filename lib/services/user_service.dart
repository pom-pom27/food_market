part of 'services.dart';

class UserService {
  static Future<ApiReturnValue<User>> signIn(
      String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return ApiReturnValue(value: userDummy);
    // return ApiReturnValue(message: 'Wrong password or email');
  }
}
