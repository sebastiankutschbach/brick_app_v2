import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'settings_state.dart';

part 'settings_cubit.freezed.dart';
part 'settings_cubit.g.dart';

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
