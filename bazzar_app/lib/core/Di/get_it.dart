import 'package:bazzar_app/core/api/api_service.dart';
import 'package:bazzar_app/features/Authors/data/data_sources/author_remote_data_source.dart';
import 'package:bazzar_app/features/Authors/data/repositories/author_repository_impl.dart';
import 'package:bazzar_app/features/Authors/domain/repositories/author_repository.dart';
import 'package:bazzar_app/features/Authors/presentation/cubit/author_cubit.dart';

import 'package:bazzar_app/features/Books/data/data_sources/books_remote_data_source.dart';
import 'package:bazzar_app/features/Books/data/repositories/books_repository_impl.dart';
import 'package:bazzar_app/features/Books/domain/repositories/book_details_repository.dart';
import 'package:bazzar_app/features/Books/domain/use_cases/get_all_books_use_case.dart';
import 'package:bazzar_app/features/Books/domain/use_cases/get_book_categories_use_case.dart';
import 'package:bazzar_app/features/Books/domain/use_cases/get_book_use_case.dart';
import 'package:bazzar_app/features/Books/presentation/cubit/book_cubit.dart';
import 'package:bazzar_app/features/Books/presentation/cubit/quantity_cubit.dart';
import 'package:bazzar_app/features/Vendors/data/data_sources/vendor_remote_data_source.dart';
import 'package:bazzar_app/features/Vendors/data/repositories/vendor_repository_impl.dart';
import 'package:bazzar_app/features/Vendors/domain/repositories/vendor_repository.dart';
import 'package:bazzar_app/features/Vendors/domain/use_cases/get_vendor_use_case.dart';
import 'package:bazzar_app/features/Vendors/presentation/cubit/vendor_cubit.dart';
import 'package:bazzar_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:bazzar_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:bazzar_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:bazzar_app/features/auth/domain/use_cases/check_email_verification_use_case.dart';
import 'package:bazzar_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:bazzar_app/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:bazzar_app/features/auth/domain/use_cases/register_use_case.dart';
import 'package:bazzar_app/features/auth/domain/use_cases/send_email_verification_use_case.dart';
import 'package:bazzar_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bazzar_app/features/categories/data/repositories/categories_repository_impl.dart';
import 'package:bazzar_app/features/categories/domain/repositories/categories_repository.dart';
import 'package:bazzar_app/features/categories/domain/use_cases/get_categories_use_case.dart';
import 'package:bazzar_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:bazzar_app/features/favorites/data/data_sources/favorites_remote_data_source.dart';
import 'package:bazzar_app/features/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:bazzar_app/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:bazzar_app/features/favorites/domain/use_cases/add_favorite_use_case.dart';
import 'package:bazzar_app/features/favorites/domain/use_cases/get_favorites_use_case.dart';
import 'package:bazzar_app/features/favorites/domain/use_cases/remove_favorite_use_case.dart';
import 'package:bazzar_app/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:bazzar_app/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:bazzar_app/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:bazzar_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:bazzar_app/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:bazzar_app/features/profile/domain/use_cases/save_profile_use_case.dart';
import 'package:bazzar_app/features/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:bazzar_app/features/profile/domain/use_cases/upload_profile_image_use_case.dart';
import 'package:bazzar_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bazzar_app/features/search/data/data_sources/history_local_data_source.dart';
import 'package:bazzar_app/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:bazzar_app/features/search/data/repositories/history_repository_impl.dart';
import 'package:bazzar_app/features/search/data/repositories/search_repository_impl.dart';
import 'package:bazzar_app/features/search/domain/repositories/history_repository.dart';
import 'package:bazzar_app/features/search/domain/repositories/search_repository.dart';
import 'package:bazzar_app/features/search/domain/use_cases/get_search_history_use_case.dart';
import 'package:bazzar_app/features/search/domain/use_cases/save_search_history_use_case.dart';
import 'package:bazzar_app/features/search/domain/use_cases/search_books_by_title_use_case.dart';
import 'package:bazzar_app/features/search/domain/use_cases/search_books_use_case.dart';
import 'package:bazzar_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> setupGetIt() async {
  //////////////////////Auth//////////////////////
  ///
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource());
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<AuthRemoteDataSource>()),
  );

  sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
  sl.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(sl()));
  sl.registerLazySingleton<SendEmailVerificationUseCase>(
    () => SendEmailVerificationUseCase(sl()),
  );
  sl.registerLazySingleton<CheckEmailVerifiedUseCase>(
    () => CheckEmailVerifiedUseCase(sl()),
  );

  sl.registerFactory<AuthCubit>(() => AuthCubit(sl(), sl(), sl(), sl(), sl()));

  //========================Book=======================
  sl.registerLazySingleton<ApiService>(() => ApiService());

  sl.registerLazySingleton<BooksRemoteDataSource>(
    () => BooksRemoteDataSource(sl<ApiService>()),
  );

  sl.registerLazySingleton<BooksRepository>(
    () => BooksRepositoryImpl(sl<BooksRemoteDataSource>()),
  );

  sl.registerLazySingleton<GetBookUseCase>(() => GetBookUseCase(sl()));

  sl.registerLazySingleton(() => GetAllBooksUseCase(sl()));

  sl.registerLazySingleton<GetBooksByCategory>(() => GetBooksByCategory(sl()));

  sl.registerFactory<BookCubit>(() => BookCubit(sl(), sl(), sl()));

  sl.registerFactory<QuantityCubit>(() => QuantityCubit(0));

  //========================Author=======================

  sl.registerLazySingleton<AuthorRemoteDataSource>(
    () => AuthorRemoteDataSource(apiService: sl<ApiService>()),
  );
  sl.registerLazySingleton<AuthorRepository>(() => AuthorRepositoryImpl(sl()));

  sl.registerFactory<AuthorCubit>(() => AuthorCubit(sl()));

  //========================Vendor=======================

  sl.registerLazySingleton<VendorRemoteDataSource>(
    () => VendorRemoteDataSource(),
  );

  sl.registerLazySingleton<VendorRepository>(() => VendorRepositoryImpl(sl()));

  sl.registerLazySingleton<GetVendorUseCase>(() => GetVendorUseCase(sl()));

  sl.registerFactory<VendorCubit>(() => VendorCubit(sl()));

  //========================Category=======================//

  sl.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(sl()),
  );

  sl.registerFactory<CategoryCubit>(() => CategoryCubit(sl()));

  //========================Search=======================//
  final prefs = await SharedPreferences.getInstance();

  sl.registerSingleton<SharedPreferences>(prefs);

  sl.registerLazySingleton<HistoryLocalDataSource>(
    () => HistoryLocalDataSource(sl<SharedPreferences>()),
  );

  sl.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSource(sl()),
  );

  sl.registerLazySingleton<HistoryRepository>(
    () => HistoryRepositoryImpl(sl<HistoryLocalDataSource>()),
  );

  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(sl<SearchRemoteDataSource>()),
  );

  sl.registerLazySingleton(() => SearchBooksUseCase(sl()));
  sl.registerLazySingleton(() => SearchBooksByTitleUseCase(sl()));

  sl.registerLazySingleton(() => GetSearchHistoryUseCase(sl()));
  sl.registerLazySingleton(() => SaveSearchUseCase(sl()));

  sl.registerFactory<SearchCubit>(() => SearchCubit(sl(), sl(), sl(), sl()));

  ///////////////////////////Favorites//////////////////////////
  sl.registerLazySingleton<FavoriteRemoteDataSource>(
    () => FavoriteRemoteDataSource(),
  );

  sl.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(sl<FavoriteRemoteDataSource>()),
  );
  sl.registerLazySingleton(() => AddFavoriteUseCase(sl()));
  sl.registerLazySingleton(() => GetFavoritesUseCase(sl()));
  sl.registerLazySingleton(() => RemoveFavoriteUseCase(sl()));

  sl.registerFactory<FavoritesCubit>(() => FavoritesCubit(sl(), sl(), sl()));

  ////////////////////////profile//////////////////////////
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSource(),
  );

  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(sl<ProfileRemoteDataSource>()),
  );

  sl.registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase(sl()));
  sl.registerLazySingleton<SaveProfileUseCase>(() => SaveProfileUseCase(sl()));
  sl.registerLazySingleton<UpdateProfileUseCase>(
    () => UpdateProfileUseCase(sl()),
  );
  sl.registerLazySingleton<UploadProfileImageUseCase>(
    () => UploadProfileImageUseCase(sl()),
  );

  sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl(), sl(), sl(), sl()));
}
