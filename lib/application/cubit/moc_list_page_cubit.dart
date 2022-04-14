import 'package:bloc/bloc.dart';
import 'package:brick_app_v2/application/cubit/authentication_cubit.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/domain/moc.dart';
import 'package:brick_app_v2/infrastructure/moc_repository.dart';
import 'package:brick_app_v2/infrastructure/brick_set_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'moc_list_page_state.dart';

@Injectable()
class MocListPageCubit extends Cubit<MocListPageState> {
  final BrickSetRepositoryFacade _brickSetRepository;
  final MocRepositoryFacade _mocRepository;

  MocListPageCubit(this._brickSetRepository, this._mocRepository)
      : super(MocListPageLoading());

  Future<void> loadMocList(String setNum) async {
    emit(MocListPageLoading());

    final mocsResponse = await _brickSetRepository.loadMocs(setNum: setNum);
    mocsResponse.fold((failure) => emit(MocListPageError(failure)),
        (mocs) async {
      final existingMocNums =
          await _mocRepository.areBuildInstructionsAvailable(
        setNum: setNum,
        mocNums: List<String>.from(
          mocs.map((moc) => moc.mocNum),
        ),
      );
      for (final moc in mocs) {
        moc.hasInstruction = existingMocNums.contains(moc.mocNum);
      }
      emit(MocListPageLoaded(mocs));
    });
  }
}
