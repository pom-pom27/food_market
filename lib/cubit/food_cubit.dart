import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_market/models/api_return_value.dart';
import 'package:food_market/models/model.dart';
import 'package:food_market/services/services.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<void> getFoods() async {
    final ApiReturnValue<List<Food>> result = await FoodService.getFoods();

    if (result.value != null) {
      emit(FoodsLoaded(result.value));
    } else {
      emit(FoodLoadingFailed(result.message));
    }
  }
}
