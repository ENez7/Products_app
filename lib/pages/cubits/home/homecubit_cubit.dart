import 'package:bloc/bloc.dart';
import 'package:ecommerce_platform/models/product.dart';

part 'homecubit_state.dart';

// Methods to be define for managing data of the cubits

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial());

  initState() {
    emit(HomeCubitLoadingState());
  }

  loadDataInList(Stream stream, List<Product> products) async {
    await for (var data in stream) {
      products.add(data);
    }
    emit(HomeCubitLoadedState(products));
  }
}
