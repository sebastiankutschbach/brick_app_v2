import 'package:brick_app_v2/infrastructure/rebrickable/rebrickable_api_constants.dart';
import 'package:brick_app_v2/infrastructure/rebrickable/set_list_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

main() {
  const userToken = 'userToken';

  final Dio dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);

  group('getAllSetLists', () {
    test('returns set lists fetched from api', () async {
      dioAdapter.onGet(setListsUrlTemplate.expand({'user_token': userToken}),
          (request) => request.reply(200, setListsResponse));

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
  });

  group('getSetLists', () {
    const setListId = 613289;

    test('returns set lists fetched from api', () async {
      dioAdapter.onGet(
          userSetListDetailsUrlTemplate
              .expand({'user_token': userToken, 'list_id': setListId}),
          (request) => request.reply(200, setListResponse));

      final response =
          await SetListRepository(dio).getSetList(userToken, setListId);

      response.fold((failure) => fail('should not happen'), (sets) {
        expect(sets.length, 7);
        expect(sets.first.name, 'Mighty Dinosaurs');
      });
    });

    test('returns failure in case of api error', () async {
      dioAdapter.onGet(
          userSetListDetailsUrlTemplate
              .expand({'user_token': userToken, 'list_id': setListId}),
          (request) => request.reply(429, ''));

      final response =
          await SetListRepository(dio).getSetList(userToken, setListId);

      response.fold((failure) => expect(failure.message, contains('429')),
          (r) => fail('should not happen'));
    });
  });
}

final setListsResponse = {
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

final setListResponse = {
  "count": 7,
  "next": null,
  "previous": null,
  "results": [
    {
      "list_id": 613289,
      "quantity": 1,
      "include_spares": true,
      "set": {
        "set_num": "31058-1",
        "name": "Mighty Dinosaurs",
        "year": 2017,
        "theme_id": 672,
        "num_parts": 174,
        "set_img_url":
            "https://cdn.rebrickable.com/media/sets/31058-1/30803.jpg",
        "set_url": "https://rebrickable.com/sets/31058-1/mighty-dinosaurs/",
        "last_modified_dt": "2021-09-03T04:27:39.904512Z"
      }
    },
    {
      "list_id": 613289,
      "quantity": 1,
      "include_spares": true,
      "set": {
        "set_num": "31032-1",
        "name": "Red Creatures",
        "year": 2015,
        "theme_id": 672,
        "num_parts": 221,
        "set_img_url":
            "https://cdn.rebrickable.com/media/sets/31032-1/13188.jpg",
        "set_url": "https://rebrickable.com/sets/31032-1/red-creatures/",
        "last_modified_dt": "2018-11-29T04:57:15.213112Z"
      }
    },
    {
      "list_id": 613289,
      "quantity": 1,
      "include_spares": true,
      "set": {
        "set_num": "31111-1",
        "name": "Cyber Drone",
        "year": 2021,
        "theme_id": 672,
        "num_parts": 113,
        "set_img_url":
            "https://cdn.rebrickable.com/media/sets/31111-1/77695.jpg",
        "set_url": "https://rebrickable.com/sets/31111-1/cyber-drone/",
        "last_modified_dt": "2020-12-11T18:27:04.236245Z"
      }
    },
    {
      "list_id": 613289,
      "quantity": 1,
      "include_spares": true,
      "set": {
        "set_num": "31102-1",
        "name": "Fire Dragon",
        "year": 2020,
        "theme_id": 672,
        "num_parts": 234,
        "set_img_url":
            "https://cdn.rebrickable.com/media/sets/31102-1/18092.jpg",
        "set_url": "https://rebrickable.com/sets/31102-1/fire-dragon/",
        "last_modified_dt": "2019-12-01T13:54:10.985876Z"
      }
    },
    {
      "list_id": 613289,
      "quantity": 1,
      "include_spares": true,
      "set": {
        "set_num": "31088-1",
        "name": "Deep Sea Creatures",
        "year": 2019,
        "theme_id": 672,
        "num_parts": 230,
        "set_img_url":
            "https://cdn.rebrickable.com/media/sets/31088-1/15354.jpg",
        "set_url": "https://rebrickable.com/sets/31088-1/deep-sea-creatures/",
        "last_modified_dt": "2019-01-19T15:12:52.035119Z"
      }
    },
    {
      "list_id": 613289,
      "quantity": 1,
      "include_spares": true,
      "set": {
        "set_num": "31112-1",
        "name": "Wild Lion",
        "year": 2021,
        "theme_id": 672,
        "num_parts": 224,
        "set_img_url":
            "https://cdn.rebrickable.com/media/sets/31112-1/77677.jpg",
        "set_url": "https://rebrickable.com/sets/31112-1/wild-lion/",
        "last_modified_dt": "2020-12-11T18:25:05.514578Z"
      }
    },
    {
      "list_id": 613289,
      "quantity": 1,
      "include_spares": true,
      "set": {
        "set_num": "31101-1",
        "name": "Monster Truck",
        "year": 2020,
        "theme_id": 672,
        "num_parts": 163,
        "set_img_url":
            "https://cdn.rebrickable.com/media/sets/31101-1/18082.jpg",
        "set_url": "https://rebrickable.com/sets/31101-1/monster-truck/",
        "last_modified_dt": "2019-12-01T13:53:56.261684Z"
      }
    }
  ]
};
