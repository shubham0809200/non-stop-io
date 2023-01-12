import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:non_stop_io/models/product.model.dart';
import 'package:non_stop_io/services/product_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  PoroductRepo productRepo;

  HomeBloc({required this.productRepo}) : super(HomeInitial()) {
    on(<FetchHomeEvent>(event, emit) => {
          emit(HomeLoading()),
          productRepo.getProducts().then((products) {
            emit(HomeLoaded(products: products));
          }).catchError((e) {
            emit(HomeError(message: e.toString()));
          })
        });
  }

  HomeState get initialState => HomeInitial();

  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is FetchHomeEvent) {
      yield HomeLoading();
      try {
        final products = await productRepo.getProducts();
        yield HomeLoaded(products: products);
      } catch (e) {
        yield HomeError(message: e.toString());
      }
    }
  }
}
