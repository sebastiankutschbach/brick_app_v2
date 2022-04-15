import 'package:auto_route/auto_route.dart';
import 'package:brick_app_v2/app_router.dart';
import 'package:brick_app_v2/application/cubit/home_page_cubit.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/domain/set_list.dart';
import 'package:brick_app_v2/injection.dart';
import 'package:brick_app_v2/presentation/widgets/brick_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const String errMsgMissingCredentials =
    'You have not yet configured your rebrickable credentials. Please go to the settings page and enter them.';
const String errMsgWrongCredentials =
    'You have entered wrong rebrickable credentials. Please go to the settings page and enter the correct ones.';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (context) => getIt<HomePageCubit>()..loadSetLists(),
      child: BlocConsumer<HomePageCubit, HomePageState>(
        listener: (context, state) {
          if (state is HomePageError) {
            if (state.failure is CredentialsMissingFailure) {
              _showMaterialBanner(context, errMsgMissingCredentials);
            } else if (state.failure is WrongCredentialsFailure) {
              _showMaterialBanner(context, errMsgWrongCredentials);
            }
          }
        },
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
        return _loadingBody(context, state as HomePageLoading);
      case HomePageError:
        return _errorBody(context, state as HomePageError);
      case HomePageLoaded:
        return _loadedBody(context, state as HomePageLoaded);
    }
  }

  _loadingBody(BuildContext context, HomePageLoading state) {
    return const Center(
        key: Key('setListLoading'), child: CircularProgressIndicator());
  }

  _errorBody(BuildContext context, HomePageError state) {
    final errMsg = state.failure is CredentialsMissingFailure
        ? const Text(errMsgMissingCredentials)
        : state.failure is WrongCredentialsFailure
            ? const Text(errMsgWrongCredentials)
            : Text(
                'There was an error while loading your set lists:\n${state.failure.message}');
    return Center(key: const Key('setListError'), child: errMsg);
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
      key: Key('setListTile-${setList.id}'),
      leading: const Icon(Icons.list),
      title: Text(setList.name),
      subtitle: Text('${setList.numberSets} sets'),
      onTap: () => AutoRouter.of(context).push(
        SetListRoute(setList: setList),
      ),
    );
  }

  _showMaterialBanner(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () =>
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
              child: const Text('Dismiss')),
          ElevatedButton(
            child: const Text('To the settings page'),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              AutoRouter.of(context).push(
                const SettingsRoute(),
              );
            },
          ),
        ],
        forceActionsBelow: true,
      ),
    );
  }
}
