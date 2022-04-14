import 'package:bloc/bloc.dart';
import 'package:brick_app_v2/application/cubit/authentication_cubit.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/domain/set_list.dart';
import 'package:brick_app_v2/infrastructure/set_list_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

@Injectable()
class HomePageCubit extends Cubit<HomePageState> {
  final SetListRepository _setListRepository;
  final AuthenticationCubit _authenticationCubit;

  HomePageCubit(this._setListRepository, this._authenticationCubit)
      : super(HomePageLoading());

  Future<void> _loadSetLists(String userToken) async {
    final loadResult = await _setListRepository.getAllSetLists(userToken);
    loadResult.fold(
      (failure) => emit(
        HomePageError(failure),
      ),
      (setLists) => emit(
        HomePageLoaded(setLists),
      ),
    );
  }

  Future<void> loadSetLists() async {
    final userTokenResponse = await _authenticationCubit.userToken;
    userTokenResponse.fold(
      (failure) => emit(HomePageError(failure)),
      (userToken) async => await _loadSetLists(userToken),
    );
  }
}
