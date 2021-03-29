part of 'food_cubit.dart';

abstract class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object> get props => [];
}

class FoodInitial extends FoodState {}

class FoodsLoaded extends FoodState {
  final List<Food> foods;

  const FoodsLoaded(this.foods);

  @override
  List<Object> get props => [foods];
}

class FoodLoadingFailed extends FoodState {
  final String message;

  const FoodLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
