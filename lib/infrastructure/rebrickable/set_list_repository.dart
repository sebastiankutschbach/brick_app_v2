import 'package:brick_app_v2/application/cubit/authentication_cubit.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/domain/set_list.dart';
import 'package:brick_app_v2/infrastructure/rebrickable/rebrickable_api_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SetListRepository {
  final Dio _dio;
  final AuthenticationCubit _authenticationCubit;

  SetListRepository(this._dio, this._authenticationCubit);

  Future<Either<Failure, List<SetList>>> getAllSetLists() async {
    if (_authenticationCubit.state is AuthenticationAuthenticated) {
      final userToken =
          (_authenticationCubit.state as AuthenticationAuthenticated).userToken;
      try {
        final response = await _dio
            .get(setListsUrlTemplate.expand({'user_token': userToken}));

        print(response.data);
        return right([]);
      } on DioError catch (e) {
        return left(Failure(e.message));
      }
    } else {
      return left(const Failure('Unauthenticated'));
    }
  }
}
