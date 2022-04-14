import 'package:brick_app_v2/infrastructure/brick_set_repository.dart';
import 'package:brick_app_v2/infrastructure/rebrickable_api_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

main() {
  const String setNum = "setNum";
  final Dio dio = Dio();
  final DioAdapter dioAdapter = DioAdapter(dio: dio);

  test('returns brick sets fetched from api', () async {
    dioAdapter.onGet(setMocListUrlTemplate.expand({'set_num': setNum}),
        (request) => request.reply(200, brickSetJson));

    final response = await BrickSetRepository(dio).loadMocs(setNum: setNum);

    response.fold((failure) => fail('should not happen'), (setLists) {
      expect(setLists.length, 2);
      expect(setLists.first.mocNum, "MOC-56901");
      expect(setLists.first.name, "cole's desert car");
    });
  });

  test('returns failure if api call fails', () async {
    dioAdapter.onGet(setMocListUrlTemplate.expand({'set_num': setNum}),
        (request) => request.reply(429, '429'));

    final response = await BrickSetRepository(dio).loadMocs(setNum: setNum);

    response.fold((failure) => expect(failure.message, contains('429')),
        (setLists) => fail('should not happen'));
  });
}

final brickSetJson = {
  "count": 2,
  "next": null,
  "previous": null,
  "results": [
    {
      "set_num": "MOC-56901",
      "name": "cole's desert car",
      "year": 2020,
      "theme_id": 435,
      "num_parts": 165,
      "moc_img_url": "https://cdn.rebrickable.com/media/mocs/moc-56901.jpg",
      "moc_url":
          "https://rebrickable.com/mocs/MOC-56901/trainsrkool176/coles-desert-car/",
      "designer_name": "trainsrkool176",
      "designer_url": "https://rebrickable.com/users/trainsrkool176/mocs/"
    },
    {
      "set_num": "MOC-69836",
      "name": "Cole´s Stone Bike",
      "year": 2021,
      "theme_id": 435,
      "num_parts": 195,
      "moc_img_url": "https://cdn.rebrickable.com/media/mocs/moc-69836.jpg",
      "moc_url":
          "https://rebrickable.com/mocs/MOC-69836/dorianbricktron/cole-s-stone-bike/",
      "designer_name": "dorianbricktron",
      "designer_url": "https://rebrickable.com/users/dorianbricktron/mocs/"
    }
  ]
};
