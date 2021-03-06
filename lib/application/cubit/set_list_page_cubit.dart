import 'package:bloc/bloc.dart';
import 'package:brick_app_v2/application/cubit/authentication_cubit.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/domain/brick_set.dart';
import 'package:brick_app_v2/infrastructure/set_list_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_list_page_state.dart';

part 'set_list_page_cubit.freezed.dart';

@Injectable()
class SetListPageCubit extends Cubit<SetListPageState> {
  final SetListRepositoryFacade _setListRepository;
  final AuthenticationCubit _authenticationCubit;

  SetListPageCubit(this._setListRepository, this._authenticationCubit)
      : super(const SetListPageLoading());

  Future<void> loadSetList(int setListId) async {
    emit(const SetListPageLoading());
    final userTokenResponse = await _authenticationCubit.userToken;
    userTokenResponse.fold((failure) => emit(SetListPageError(failure)),
        (userToken) async {
      final setListResponse =
          await _setListRepository.getSetList(userToken, setListId);
      setListResponse.fold((failure) => emit(SetListPageError(failure)),
          (setList) => emit(SetListPageLoaded(setList)));
    });
  }
}
