import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit()
      : super(const SettingsState(
            rebrickableUsername: '',
            rebrickablePassword: '',
            rebrickableApiToken: ''));

  @override
  SettingsState fromJson(Map<String, dynamic> json) =>
      SettingsState.fromJson(json);

  @override
  Map<String, dynamic> toJson(SettingsState state) => state.toJson();

  void setRebrickableUsername(String value) {
    emit(state.copyWith(rebrickableUsername: value));
  }

  void setRebrickablePassword(String value) {
    emit(state.copyWith(rebrickablePassword: value));
  }

  void setRebrickableApiToken(String value) {
    emit(state.copyWith(rebrickableApiToken: value));
  }
}
