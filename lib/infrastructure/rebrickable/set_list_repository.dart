import 'dart:developer';

import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/domain/brick_set.dart';
import 'package:brick_app_v2/domain/set_list.dart';
import 'package:brick_app_v2/infrastructure/rebrickable/rebrickable_api_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SetListRepository {
  final Dio _dio;

  SetListRepository(this._dio);

  Future<Either<Failure, List<SetList>>> getAllSetLists(
      String userToken) async {
    try {
      final response =
          await _dio.get(setListsUrlTemplate.expand({'user_token': userToken}));

      final results = List<SetList>.from(
        response.data['results'].map(
          (result) => SetList.fromJson(result),
        ),
      );
      return right(results);
    } on DioError catch (e) {
      log('Error while loading set lists for userToken: $userToken: ${e.message}');
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, List<BrickSet>>> getSetList(
      String userToken, int setListId) async {
    try {
      final response = await _dio.get(userSetListDetailsUrlTemplate
          .expand({'user_token': userToken, 'list_id': setListId}));

      final results = List<BrickSet>.from(
        response.data['results'].map(
          (result) => BrickSet.fromJson(result['set']),
        ),
      );
      return right(results);
    } on DioError catch (e) {
      log('Error while loading set list for userToken ($userToken) and listId ($setListId): ${e.message}');
      return left(Failure(e.message));
    }
  }
}
