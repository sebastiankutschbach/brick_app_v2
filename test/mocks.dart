import 'package:bloc_test/bloc_test.dart';
import 'package:brick_app_v2/application/cubit/authentication_cubit.dart';
import 'package:brick_app_v2/infrastructure/rebrickable/set_list_repository.dart';
import 'package:brick_app_v2/infrastructure/rebrickable/user_token_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationCubit extends MockCubit<AuthenticationState>
    implements AuthenticationCubit {}

class MockSetListRepository extends Mock implements SetListRepository {}

class MockUserTokenRepository extends Mock implements UserTokenRepository {}

class MockStorage extends Mock implements Storage {}

T mockHydratedStorage<T>(
  T Function() body, {
  Storage? storage,
}) {
  return HydratedBlocOverrides.runZoned<T>(
    body,
    storage: storage ?? _buildMockStorage(),
  );
}

Storage _buildMockStorage() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final storage = MockStorage();
  when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
  return storage;
}
