import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

@Singleton()
class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit()
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
  }

  void setRebrickablePassword(String value) {
    emit(state.copyWith(rebrickablePassword: value));
  }

  void setRebrickableApiKey(String value) {
    emit(state.copyWith(rebrickableApiKey: value));
  }
}
