import 'package:bloc/bloc.dart';
import 'package:brick_app_v2/application/cubit/authentication_cubit.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/domain/moc.dart';
import 'package:brick_app_v2/infrastructure/rebrickable/set_list_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'moc_list_page_state.dart';

@Injectable()
class MocListPageCubit extends Cubit<MocListPageState> {
  final SetListRepository _setListRepository;
  final AuthenticationCubit _authenticationCubit;

  MocListPageCubit(this._setListRepository, this._authenticationCubit)
      : super(MocListPageLoading());

  Future<void> loadMocList(String setNum) async {
    emit(MocListPageLoading());
    emit(MocListPageLoaded([Moc('1', '1'), Moc('2', '2')]));
  }
}
