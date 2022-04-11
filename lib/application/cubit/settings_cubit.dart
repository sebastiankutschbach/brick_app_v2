import 'package:brick_app_v2/application/cubit/authentication_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

@Injectable()
class SettingsCubit extends HydratedCubit<SettingsState> {
  final AuthenticationCubit _authenticationCubit;

  SettingsCubit(this._authenticationCubit)
      : super(const SettingsState(
            rebrickableUsername: '',
            rebrickablePassword: '',
            rebrickableApiKey: ''));

  @override
  SettingsState fromJson(Map<String, dynamic> json) =>
      SettingsState.fromJson(json);

  @override
  Map<String, dynamic> toJson(SettingsState state) => state.toJson();

  void setRebrickableUsername(String value) {
    emit(state.copyWith(rebrickableUsername: value));
    _loginIfPossible();
  }

  void setRebrickablePassword(String value) {
    emit(state.copyWith(rebrickablePassword: value));
    _loginIfPossible();
  }

  void setRebrickableApiKey(String value) {
    emit(state.copyWith(rebrickableApiKey: value));
    _loginIfPossible();
  }

  void _loginIfPossible() {
    if (state.rebrickableUsername.isNotEmpty &&
        state.rebrickablePassword.isNotEmpty &&
        state.rebrickableApiKey.isNotEmpty) {
      _authenticationCubit.login(
          username: state.rebrickableUsername,
          password: state.rebrickablePassword,
          apiKey: state.rebrickableApiKey);
    }
  }
}
