import 'package:auto_route/auto_route.dart';
import 'package:brick_app_v2/app_router.dart';
import 'package:brick_app_v2/application/cubit/set_list_page_cubit.dart';
import 'package:brick_app_v2/domain/brick_set.dart';
import 'package:brick_app_v2/domain/set_list.dart';
import 'package:brick_app_v2/injection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brick_app_v2/i18n/string.g.dart';

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
              title: Text(
                  '${setList.name} (${t.noOfSets(count: setList.numberSets)})'),
            ),
            body: _bodyFrom(context, state),
          );
        },
      ),
    );
  }

  Widget _bodyFrom(BuildContext context, SetListPageState state) {
    return state.map(
        loading: (state) => _loadingBody(context, state),
        error: (state) => _errorBody(context, state),
        loaded: (state) => _loadedBody(context, state));
  }

  Widget _loadingBody(BuildContext context, SetListPageLoading state) {
    return const Center(
        key: Key('setListLoading'), child: CircularProgressIndicator());
  }

  Widget _errorBody(BuildContext context, SetListPageError state) {
    return Center(
      key: const Key('setListError'),
      child: Text(
        t.errorLoadingSetList(error: state.failure.message),
      ),
    );
  }

  Widget _loadedBody(BuildContext context, SetListPageLoaded state) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: Center(
        child: state.sets.isEmpty
            ? Center(
                key: const Key('noSetsFound'),
                child: Text(t.noSetsFound),
              )
            : ListView.builder(
                itemBuilder: (context, index) =>
                    _buildSetCard(context, state.sets[index]),
                itemCount: state.sets.length,
              ),
      ),
    );
  }

  Widget _buildSetCard(BuildContext context, BrickSet set) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => AutoRouter.of(context).push(MocListRoute(set: set)),
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
            Text(t.noOfParts(count: set.numParts)),
            const SizedBox(height: 8.0),
          ]),
        ),
      ),
    );
  }
}
