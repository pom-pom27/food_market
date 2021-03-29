import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_market/cubit/food_cubit.dart';
import 'package:food_market/cubit/transaction_cubit.dart';
import 'package:food_market/cubit/user_cubit.dart';
import 'package:food_market/ui/screens/screen.dart';
import 'package:get/get.dart';
import 'package:food_market/models/model.dart';
import 'package:supercharged/supercharged.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FoodCubit()),
        BlocProvider(create: (_) => TransactionCubit()),
        BlocProvider(create: (_) => UserCubit()),
      ],
      child: GetMaterialApp(
        getPages: [
          GetPage(name: '/signin', page: () => const SignInScreen()),
          GetPage(name: '/signup', page: () => const SignUpScreen()),
          GetPage(
              name: '/signup_address', page: () => const SignUpAddressScreen()),
          GetPage(name: '/main', page: () => MainScreen()),
          // GetPage(
          //   name: '/food',
          //   page: () => FoodDetailScreen(
          //     transaction: Transaction(food: dummyFood),
          //   ),
          // ),

          GetPage(
            name: '/success_order',
            page: () => const SuccessOrderScreen(),
          ),
          GetPage(
            name: '/success_signup',
            page: () => const SuccessSignUpScreen(),
          ),
          GetPage(
            name: '/profile',
            page: () => const ProfileScreen(),
          ),
          GetPage(
            name: '/payment',
            page: () => PaymentScreen(
              transaction: Transaction(
                food: dummyFood,
                user: userDummy,
                quantity: 2,
              ),
            ),
          ),
        ],
        initialRoute: '/signin',
        unknownRoute: GetPage(
          name: '/profile',
          page: () => const ProfileScreen(),
        ),
      ),
    );
  }
}
