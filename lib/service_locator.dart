import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/remove_address_usecase.dart';
import 'package:ecommerce_app/features/order/data/data_source/order_remote_data_source.dart';
import 'package:ecommerce_app/features/order/data/repositories/order_repository_impl.dart';
import 'package:ecommerce_app/features/order/domain/repositories/order_repository.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/add_address_usecase.dart';
import 'package:ecommerce_app/features/order/presentation/blocs/order/order_cubit.dart';
import 'package:ecommerce_app/features/products/domain/usecases/get_fav_products_usecase.dart';
import 'package:ecommerce_app/features/products/presentation/blocs/products_bloc/products_bloc.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/order/presentation/blocs/cart/cart_cubit.dart';
import 'package:get_it/get_it.dart';

import 'core/helpers/cache_helper.dart';
import 'core/providers/global_provider.dart';
import 'features/auth/data/data_source/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/check_auth_token_usecase.dart';
import 'features/auth/domain/usecases/forgot_password_usecase.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/login_with_facebook_usecase.dart';
import 'features/auth/domain/usecases/login_with_google_usecase.dart';
import 'features/auth/domain/usecases/register_usecase.dart';
import 'features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'features/products/data/data_source/products_remote_data_source.dart';
import 'features/products/data/repositories/products_repository_impl.dart';
import 'features/products/domain/repositories/proucts_repository.dart';
import 'features/products/domain/usecases/get_category_products_usecase.dart';
import 'features/products/domain/usecases/get_product_details_usecase.dart';
import 'features/products/domain/usecases/init_data_usecase.dart';
import 'features/products/domain/usecases/toggle_favorite_usecase.dart';

import 'features/products/presentation/blocs/products_cubit/products_cubit.dart';

final sl = GetIt.instance;

void init() async {
  //! Global :
  // Dio
  sl.registerLazySingleton(() => Dio());
  // CachHelper
  sl.registerLazySingleton(() => CacheHelper());
  // Bloc

  //

  // Providers
  sl.registerLazySingleton(() => GlobalProvider(sl()));
  //! feature : Auth

  // Usecases
  sl.registerLazySingleton(() => RegisterUsecase(sl()));
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => ForgotPasswordUsecase(sl()));
  sl.registerLazySingleton(() => LoginWithFacebookUsecase(sl()));
  sl.registerLazySingleton(() => LoginWithGoogleUsecase(sl()));
  sl.registerLazySingleton(() => CheckAuthTokenUsecase(sl()));
  sl.registerLazySingleton(() => LogoutUsecase(sl()));
  sl.registerLazySingleton(() => AddAddressUsecase(sl()));
  sl.registerLazySingleton(() => RemoveAddressUsecase(sl()));
  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  // DataSources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(dio: sl()));
  // Bloc
  sl.registerLazySingleton<AuthCubit>(() =>
      AuthCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()));

  //! feature : Products
  // Usecases
  sl.registerLazySingleton(() => InitDataUsecase(sl()));
  sl.registerLazySingleton(() => GetProductDetailsUsecase(sl()));
  sl.registerLazySingleton(() => GetCategoryProductsUsecase(sl()));
  sl.registerLazySingleton(() => GetFavProductsUsecase(sl()));
  sl.registerLazySingleton<ToggleFavoriteUsecase>(
      () => ToggleFavoriteUsecase(sl()));
  // Repositories
  sl.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(sl()));
  // DataSources
  sl.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceImpl(dio: sl()));
  // Bloc
  sl.registerLazySingleton<ProductsBloc>(
      () => ProductsBloc(sl(), sl(), sl(), sl()));
  //! feature : Order

  // Usecases
  // Repositories
  sl.registerLazySingleton<OrderRepository>(() => OrderRepositoyImpl(sl()));
  // DataSources
  sl.registerLazySingleton<OrderRemoteDataSource>(
      () => OrderRemoteDataSourceImpl(dio: sl()));
  // Bloc
  sl.registerLazySingleton<CartCubit>(() => CartCubit());
  sl.registerLazySingleton<OrderCubit>(() => OrderCubit());
}
