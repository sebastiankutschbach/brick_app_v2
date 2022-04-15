import 'package:bloc_test/bloc_test.dart';
import 'package:brick_app_v2/application/cubit/authentication_cubit.dart';
import 'package:brick_app_v2/application/cubit/home_page_cubit.dart';
import 'package:brick_app_v2/application/cubit/moc_list_page_cubit.dart';
import 'package:brick_app_v2/application/cubit/pdf_page_cubit.dart';
import 'package:brick_app_v2/application/cubit/set_list_page_cubit.dart';
import 'package:brick_app_v2/application/cubit/settings_cubit.dart';
import 'package:brick_app_v2/infrastructure/brick_set_repository.dart';
import 'package:brick_app_v2/infrastructure/moc_repository.dart';
import 'package:brick_app_v2/infrastructure/set_list_repository.dart';
import 'package:brick_app_v2/infrastructure/user_token_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationCubit extends MockCubit<AuthenticationState>
    implements AuthenticationCubit {}

class MockSettingsCubit extends MockCubit<SettingsState>
    implements SettingsCubit {}

class MockHomePageCubit extends MockCubit<HomePageState>
    implements HomePageCubit {}

class MockSetListPageCubit extends MockCubit<SetListPageState>
    implements SetListPageCubit {}

class MockMocListPageCubit extends MockCubit<MocListPageState>
    implements MocListPageCubit {}

class MockPdfPageCubit extends MockCubit<PdfPageState> implements PdfPageCubit {
}

class MockSetListRepository extends Mock implements SetListRepositoryFacade {}

class MockBrickSetRepository extends Mock implements BrickSetRepositoryFacade {}

class MockUserTokenRepository extends Mock
    implements UserTokenRepositoryFacade {}

class MockMocRepository extends Mock implements MocRepositoryFacade {}

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
