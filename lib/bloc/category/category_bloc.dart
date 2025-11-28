import 'package:bloc/bloc.dart';
import 'package:flutter_shop_sample/Data/repository/category_repository.dart';
import 'package:flutter_shop_sample/bloc/category/category_event.dart';
import 'package:flutter_shop_sample/bloc/category/category_state.dart';
import 'package:flutter_shop_sample/di/di.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ICategoryRepository _repository = locator.get();

  CategoryBloc() : super(CategoryInitState()) {
    on<CategoryRequestEvent>((event, emit) async {
      emit(CategoryLoadingState());
      var response = await _repository.getCategories();
      emit(CategoryResponseState(response));
    });
  }
}
