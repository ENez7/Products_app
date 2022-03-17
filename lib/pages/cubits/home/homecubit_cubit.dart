import 'package:bloc/bloc.dart';
import 'package:ecommerce_platform/models/product.dart';

part 'homecubit_state.dart';

// Methods to be define for managing data of the cubits

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial());

  initState() {
    emit(HomeCubitLoadingState());
  }

  loadDataInList(Future<List<dynamic>> future, List<Product> products) async {
    // emit(HomeCubitLoadingState());
    products = await future as List<Product>;
    emit(HomeCubitLoadedState(products));
  }
}
