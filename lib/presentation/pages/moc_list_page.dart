import 'package:brick_app_v2/application/cubit/moc_list_page_cubit.dart';
import 'package:brick_app_v2/domain/brick_set.dart';
import 'package:brick_app_v2/domain/moc.dart';
import 'package:brick_app_v2/injection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MocListPage extends StatelessWidget {
  final BrickSet set;

  const MocListPage(this.set, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MocListPageCubit>(
      create: (context) => getIt<MocListPageCubit>()..loadMocList(set.setNum),
      child: BlocBuilder<MocListPageCubit, MocListPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(set.name),
            ),
            body: _bodyFrom(context, state),
          );
        },
      ),
    );
  }

  _bodyFrom(BuildContext context, MocListPageState state) {
    switch (state.runtimeType) {
      case MocListPageLoading:
        return _loadingBody(context, state as MocListPageLoading);
      case MocListPageError:
        return _errorBody(context, state as MocListPageError);
      case MocListPageLoaded:
        return _loadedBody(context, state as MocListPageLoaded);
    }
  }

  _loadingBody(BuildContext context, MocListPageLoading state) {
    return const Center(
        key: Key('setListLoading'), child: CircularProgressIndicator());
  }

  _errorBody(BuildContext context, MocListPageError state) {
    return Center(
      key: const Key('setListError'),
      child: Text(
          'There was an error while loading your set lists: ${state.failure.message}'),
    );
  }

  _loadedBody(BuildContext context, MocListPageLoaded state) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: Center(
        child: ListView.builder(
          itemBuilder: (context, index) =>
              _buildSetCard(context, state.mocs[index]),
          itemCount: state.mocs.length,
        ),
      ),
    );
  }

  _buildSetCard(BuildContext context, Moc moc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        key: Key('mocCard-${moc.mocNum}'),
        child: Column(children: [
          CachedNetworkImage(
            imageUrl: moc.imgUrl.toString(),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: 150,
            width: 150,
          ),
          const SizedBox(height: 8.0),
          Text(
            moc.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text('${moc.numParts} parts'),
          const SizedBox(height: 8.0),
        ]),
      ),
    );
  }
}
