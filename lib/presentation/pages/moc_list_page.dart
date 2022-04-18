import 'package:auto_route/auto_route.dart';
import 'package:brick_app_v2/app_router.dart';
import 'package:brick_app_v2/application/cubit/moc_list_page_cubit.dart';
import 'package:brick_app_v2/domain/brick_set.dart';
import 'package:brick_app_v2/domain/moc.dart';
import 'package:brick_app_v2/injection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brick_app_v2/i18n/string.g.dart';

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

  Widget _bodyFrom(BuildContext context, MocListPageState state) {
    return state.map(
        loading: (state) => _loadingBody(context, state),
        error: (state) => _errorBody(context, state),
        loaded: (state) => _loadedBody(context, state));
  }

  Widget _loadingBody(BuildContext context, MocListPageLoading state) {
    return const Center(
        key: Key('mocListLoading'), child: CircularProgressIndicator());
  }

  Widget _errorBody(BuildContext context, MocListPageError state) {
    return Center(
      key: const Key('mocListError'),
      child: Text(t.errorLoadingMocList(error: state.failure.message)),
    );
  }

  Widget _loadedBody(BuildContext context, MocListPageLoaded state) {
    final mocsWithInstructions =
        state.mocs.where((moc) => moc.hasInstruction).toList(growable: false);
    if (mocsWithInstructions.isEmpty) {
      return Center(
        key: const Key('noMocsFound'),
        child: Text(t.noMocsFound),
      );
    }
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: Center(
        child: ListView.builder(
          itemBuilder: (context, index) =>
              _buildSetCard(context, mocsWithInstructions[index]),
          itemCount: mocsWithInstructions.length,
        ),
      ),
    );
  }

  Widget _buildSetCard(BuildContext context, Moc moc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () =>
            AutoRouter.of(context).push(PdfRoute(setNum: set.setNum, moc: moc)),
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
            Text(t.noOfParts(count: moc.numParts)),
            const SizedBox(height: 8.0),
          ]),
        ),
      ),
    );
  }
}
