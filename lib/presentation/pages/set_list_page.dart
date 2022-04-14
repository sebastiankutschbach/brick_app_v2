import 'package:brick_app_v2/application/cubit/set_list_page_cubit.dart';
import 'package:brick_app_v2/domain/set.dart';
import 'package:brick_app_v2/domain/set_list.dart';
import 'package:brick_app_v2/injection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetListPage extends StatelessWidget {
  final SetList setList;

  const SetListPage(this.setList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SetListPageCubit>(
      create: (context) => getIt<SetListPageCubit>()..loadSetList(setList.id),
      child: BlocBuilder<SetListPageCubit, SetListPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('${setList.name} (${setList.numberSets} sets)'),
            ),
            body: _bodyFrom(context, state),
          );
        },
      ),
    );
  }

  _bodyFrom(BuildContext context, SetListPageState state) {
    switch (state.runtimeType) {
      case SetListPageLoading:
        return _loadingBody(context, state as SetListPageLoading);
      case SetListPageError:
        return _errorBody(context, state as SetListPageError);
      case SetListPageLoaded:
        return _loadedBody(context, state as SetListPageLoaded);
    }
  }

  _loadingBody(BuildContext context, SetListPageLoading state) {
    return const Center(
        key: Key('setListLoading'), child: CircularProgressIndicator());
  }

  _errorBody(BuildContext context, SetListPageError state) {
    return Center(
      key: const Key('setListError'),
      child: Text(
          'There was an error while loading your set lists: ${state.failure.message}'),
    );
  }

  _loadedBody(BuildContext context, SetListPageLoaded state) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: Center(
        child: ListView.builder(
          itemBuilder: (context, index) =>
              _buildSetCard(context, state.sets[index]),
          itemCount: state.sets.length,
        ),
      ),
    );
  }

  _buildSetCard(BuildContext context, Set set) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        key: Key('setCard-${set.setNum}'),
        child: Column(children: [
          CachedNetworkImage(
            imageUrl: set.setImgUrl.toString(),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: 150,
            width: 150,
          ),
          const SizedBox(height: 8.0),
          Text(
            set.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text('${set.numParts} parts'),
          const SizedBox(height: 8.0),
        ]),
      ),
    );
  }
}
