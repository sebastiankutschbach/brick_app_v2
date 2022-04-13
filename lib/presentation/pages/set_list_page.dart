import 'package:brick_app_v2/domain/set_list.dart';
import 'package:flutter/material.dart';

class SetListPage extends StatelessWidget {
  final SetList setList;

  const SetListPage(this.setList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(setList.name),
      ),
      body: Center(
        child: Text('This list contains ${setList.numberSets} sets'),
      ),
    );
  }
}
