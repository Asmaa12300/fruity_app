import 'package:fruity_app/core/repos/products_repo/products_repo.dart';
import 'package:fruity_app/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruity_app/core/services/database_service.dart';
import 'package:fruity_app/core/services/firebase_auth.dart';
import 'package:fruity_app/features/auth/domain/repos/repo.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/repos/repo_impl.dart';
import 'firestore_service.dart';



final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FireBaseAuthService>(FireBaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(fireBaseAuthService: getIt<FireBaseAuthService>(),
    databaseService: getIt<DatabaseService>()
    ),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductRepoImpl(
          getIt<DatabaseService>()
    ),
  );
}
