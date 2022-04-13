import 'package:brick_app_v2/application/cubit/home_page_cubit.dart';
import 'package:brick_app_v2/domain/set_list.dart';
import 'package:brick_app_v2/injection.dart';
import 'package:brick_app_v2/presentation/widgets/brick_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (context) => getIt<HomePageCubit>(),
      child: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: BrickAppBar(
              const Text('Home'),
            ),
            body: _bodyFrom(context, state),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.sync),
              onPressed: () => context.read<HomePageCubit>().loadSetLists(),
            ),
          );
        },
      ),
    );
  }

  _bodyFrom(BuildContext context, HomePageState state) {
    switch (state.runtimeType) {
      case HomePageLoading:
        return const Center(child: CircularProgressIndicator());
      case HomePageError:
        return _errorBody(context, state as HomePageError);
      case HomePageLoaded:
        return _loadedBody(context, state as HomePageLoaded);
    }
  }

  _errorBody(BuildContext context, HomePageError state) {
    return Center(
      child: Text(
          'There was an error while loading your set lists: ${state.failure.message}'),
    );
  }

  _loadedBody(BuildContext context, HomePageLoaded state) {
    return Center(
      child: ListView.builder(
        itemBuilder: (context, index) =>
            _buildSetListTile(context, state.setLists[index]),
        itemCount: state.setLists.length,
      ),
    );
  }

  _buildSetListTile(BuildContext context, SetList setList) {
    return ListTile(
      title: Text(setList.name),
      subtitle: Text('${setList.numberSets} sets'),
    );
  }
}
