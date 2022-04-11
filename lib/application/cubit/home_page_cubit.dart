import 'package:bloc/bloc.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/domain/set_list.dart';
import 'package:brick_app_v2/infrastructure/rebrickable/set_list_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

@Injectable()
class HomePageCubit extends Cubit<HomePageState> {
  final SetListRepository setListRepository;

  HomePageCubit(this.setListRepository) : super(HomePageLoading());

  Future<void> loadSetLists() async {
    final loadResult = await setListRepository.getAllSetLists();
    loadResult.fold(
      (failure) => emit(
        HomePageError(failure),
      ),
      (setLists) => emit(
        HomePageLoaded(setLists),
      ),
    );
  }
}
