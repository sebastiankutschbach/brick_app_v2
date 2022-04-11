import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/domain/set_list.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SetListRepository {
  Future<Either<Failure, List<SetList>>> getAllSetLists() async {
    return left(Failure('not implemented'));
  }
}
