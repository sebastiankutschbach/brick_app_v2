import 'package:brick_app_v2/application/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return SettingsList(
            sections: [
              SettingsSection(
                title: const Text('Rebrickable'),
                tiles: [
                  _rebrickableUsernameTile(state),
                  _rebrickablePasswordTile(state),
                  _rebrickableApiKeyTile(state)
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  SettingsTile _rebrickableUsernameTile(SettingsState state) {
    return SettingsTile.navigation(
      leading: const Icon(Icons.person),
      title: const Text('Username'),
      value: Text(state.rebrickableUsername),
      onPressed: (context) {
        _displayTextInputDialog(
          context,
          title: 'Enter username',
          hint: 'Rebrickable username',
          initialValue: state.rebrickableUsername,
          onChanged: (value) =>
              context.read<SettingsCubit>().setRebrickableUsername(value),
        );
      },
    );
  }

  SettingsTile _rebrickablePasswordTile(SettingsState state) {
    return SettingsTile.navigation(
      leading: const Icon(Icons.lock),
      title: const Text('Password'),
      value: Text(
        '*' * state.rebrickablePassword.length,
      ),
      onPressed: (context) {
        _displayTextInputDialog(
          context,
          title: 'Enter password',
          hint: 'Rebrickable password',
          initialValue: state.rebrickablePassword,
          onChanged: (value) =>
              context.read<SettingsCubit>().setRebrickablePassword(value),
        );
      },
    );
  }

  SettingsTile _rebrickableApiKeyTile(SettingsState state) {
    return SettingsTile.navigation(
      leading: const Icon(Icons.token),
      title: const Text('API Key'),
      value: Text(
        state.rebrickableApiKey,
      ),
      onPressed: (context) {
        _displayTextInputDialog(
          context,
          title: 'Enter API Key',
          hint: 'Rebrickable API Key',
          initialValue: state.rebrickableApiKey,
          onChanged: (value) =>
              context.read<SettingsCubit>().setrebrickableApiKey(value),
        );
      },
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context,
      {required String title,
      required String hint,
      required String initialValue,
      required Function(String value) onChanged}) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: TextFormField(
              onChanged: onChanged,
              decoration: InputDecoration(hintText: hint),
              initialValue: initialValue,
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('CLOSE'),
              )
            ],
          );
        });
  }
}
