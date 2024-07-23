part of 'categories_cubit.dart';

// Define the events
abstract class SelectedCategoryEvent {}

class SetCategory extends SelectedCategoryEvent {
  SetCategory(this.categoryId);
  final int categoryId;
}

// Define the state
class SelectedCategoryState {
  SelectedCategoryState(this.categoryId);
  final int categoryId;
}
