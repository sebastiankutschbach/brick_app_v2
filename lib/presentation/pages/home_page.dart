import 'package:brick_app_v2/presentation/widgets/brick_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrickAppBar(Text('Login')),
      body: Center(
        child: ElevatedButton(
          child: Text('Login with Rebrickable'),
          onPressed: () {},
        ),
      ),
    );
  }
}
