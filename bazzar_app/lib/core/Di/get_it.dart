import 'package:bazzar_app/core/api/api_service.dart';
import 'package:bazzar_app/features/Authors/data/data_sources/author_remote_data_source.dart';
import 'package:bazzar_app/features/Authors/data/repositories/author_repository_impl.dart';
import 'package:bazzar_app/features/Authors/domain/repositories/author_repository.dart';
import 'package:bazzar_app/features/Authors/domain/use_cases/get_author_use_case.dart';
import 'package:bazzar_app/features/Authors/presentation/cubit/author_cubit.dart';

import 'package:bazzar_app/features/Books/data/data_sources/books_remote_data_source.dart';
import 'package:bazzar_app/features/Books/data/repositories/books_repository_impl.dart';
import 'package:bazzar_app/features/Books/domain/repositories/book_details_repository.dart';
import 'package:bazzar_app/features/Books/domain/use_cases/get_all_books_use_case.dart';
import 'package:bazzar_app/features/Books/domain/use_cases/get_book_categories_use_case.dart';
import 'package:bazzar_app/features/Books/domain/use_cases/get_book_use_case.dart';
import 'package:bazzar_app/features/Books/presentation/cubit/book_cubit.dart';
import 'package:bazzar_app/features/Vendors/data/data_sources/vendor_remote_data_source.dart';
import 'package:bazzar_app/features/Vendors/data/repositories/vendor_repository_impl.dart';
import 'package:bazzar_app/features/Vendors/domain/repositories/vendor_repository.dart';
import 'package:bazzar_app/features/Vendors/domain/use_cases/get_vendor_use_case.dart';
import 'package:bazzar_app/features/Vendors/presentation/cubit/vendor_cubit.dart';
import 'package:bazzar_app/features/categories/data/repositories/categories_repository_impl.dart';
import 'package:bazzar_app/features/categories/domain/repositories/categories_repository.dart';
import 'package:bazzar_app/features/categories/domain/use_cases/get_categories_use_case.dart';
import 'package:bazzar_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void setupGetIt() {
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

  sl.registerFactory<BookCubit>(() => BookCubit(sl(), sl()));

  //========================Author=======================

  sl.registerLazySingleton<AuthorRemoteDataSource>(
    () => AuthorRemoteDataSource(),
  );
  sl.registerLazySingleton<AuthorRepository>(
    () => AuthorRepositoryImpl(sl<AuthorRemoteDataSource>()),
  );
  sl.registerLazySingleton<GetAuthorUseCase>(() => GetAuthorUseCase(sl()));

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

  sl.registerFactory<CategoryCubit>(() => CategoryCubit(sl(), sl()));
}
