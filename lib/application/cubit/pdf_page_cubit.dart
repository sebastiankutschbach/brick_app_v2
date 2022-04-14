import 'package:bloc/bloc.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/infrastructure/moc_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'pdf_page_state.dart';

@Injectable()
class PdfPageCubit extends Cubit<PdfPageState> {
  final MocRepositoryFacade _mocRepository;

  PdfPageCubit(this._mocRepository) : super(PdfPageLoading());

  getPdfUrl(String setNum, String mocNum) async {
    emit(PdfPageLoading());

    final response = await _mocRepository.getBuildInstructionUrl(
        setNum: setNum, mocNum: mocNum);

    response.fold((failure) => emit(PdfPageError(failure)),
        (url) => emit(PdfPageLoaded(url)));
  }
}
