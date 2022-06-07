import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:grocery_application/Repository/repository.dart';
import 'data_event.dart';
import 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  Repo repo = Get.put(Repo());
  var api = [].obs;
  DataBloc(this.repo) : super(DataInitialState()) {
    on<DataEvent>((event, emit) async {
      if (event is LoadDataEvent) {
        emit(DataLoadingState());
        var apiValue = (await Repo.getData())?.data!.products.results;
        if (apiValue == null) {
          emit(DataErrorState());
        } else {
          emit(DataLoadedState(api: api));
        }
      }
    });
  }
}
