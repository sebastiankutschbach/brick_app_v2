import 'dart:convert';

import 'package:brick_app_v2/infrastructure/rebrickable/rebrickable_api_constants.dart';
import 'package:brick_app_v2/infrastructure/rebrickable/set_list_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

main() {
  const userToken = 'userToken';
  const apiKey = 'apiKey';

  final Dio dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);

  test('returns set lists fetched from api', () async {
    dioAdapter.onGet(setListsUrlTemplate.expand({'user_token': userToken}),
        (request) => request.reply(200, setListResponse));

    final response = await SetListRepository(dio).getAllSetLists(userToken);

    response.fold((failure) => fail('should not happen'), (setLists) {
      expect(setLists.length, 7);
      expect(setLists.first.id, 613289);
      expect(setLists.first.name, 'Creator');
      expect(setLists.first.numberSets, 7);
    });
  });

  test('returns failure in case of api error', () async {
    dioAdapter.onGet(setListsUrlTemplate.expand({'user_token': userToken}),
        (request) => request.reply(429, ''));

    final response = await SetListRepository(dio).getAllSetLists(userToken);

    response.fold((failure) => expect(failure.message, contains('429')),
        (r) => fail('should not happen'));
  });
}

final setListResponse = {
  "count": 7,
  "next": null,
  "previous": null,
  "results": [
    {"id": 613289, "is_buildable": true, "name": "Creator", "num_sets": 7},
    {"id": 585076, "is_buildable": true, "name": "Lego Technic", "num_sets": 5},
    {"id": 613223, "is_buildable": true, "name": "Marvell/DC", "num_sets": 7},
    {"id": 548040, "is_buildable": true, "name": "Ninjago", "num_sets": 21},
    {
      "id": 613557,
      "is_buildable": true,
      "name": "Ninjago Dragons",
      "num_sets": 10
    },
    {"id": 521857, "is_buildable": true, "name": "Other stuff", "num_sets": 8},
    {"id": 548280, "is_buildable": true, "name": "Set List", "num_sets": 1}
  ]
};
