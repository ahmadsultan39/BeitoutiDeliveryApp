// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i6;
import 'package:location/location.dart' as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import 'app/data/data_sources/local/app_local_data_source.dart' as _i16;
import 'app/data/data_sources/local/app_local_data_source_Imp.dart' as _i17;
import 'app/data/data_sources/remote/app_remote_data_source.dart' as _i18;
import 'app/data/data_sources/remote/app_remote_data_source_imp.dart' as _i19;
import 'app/data/repositories/app_repository_imp.dart' as _i50;
import 'app/domain/repositories/app_repository.dart' as _i49;
import 'app/domain/use_cases/get_pusher_options_use_case.dart' as _i57;
import 'app/domain/use_cases/get_user_id_use_case.dart' as _i58;
import 'app/domain/use_cases/subscribe_to_prepared_order_channel_use_case.dart'
    as _i62;
import 'app/presentation/bloc/app_bloc.dart' as _i63;
import 'core/data/base_local_datasource.dart' as _i26;
import 'core/data/base_repository.dart' as _i27;
import 'core/network/network_info.dart' as _i8;
import 'features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i20;
import 'features/auth/data/data_sources/local/auth_local_data_source_imp.dart'
    as _i21;
import 'features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i22;
import 'features/auth/data/data_sources/remote/auth_remote_data_source_imp.dart'
    as _i23;
import 'features/auth/data/repositories/auth_repository_imp.dart' as _i25;
import 'features/auth/domain/repositories/auth_repository.dart' as _i24;
import 'features/auth/domain/use_cases/check_code_use_case.dart' as _i28;
import 'features/auth/domain/use_cases/request_register_use_case.dart' as _i45;
import 'features/auth/domain/use_cases/send_code_use_case.dart' as _i46;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i51;
import 'features/current_delivery/data/data_sources/local/current_delivery_local_data_source.dart'
    as _i29;
import 'features/current_delivery/data/data_sources/local/current_delivery_local_data_source_imp.dart'
    as _i30;
import 'features/current_delivery/data/data_sources/remote/current_delivery_remote_data_source.dart'
    as _i31;
import 'features/current_delivery/data/data_sources/remote/current_delivery_remote_data_source_imp.dart'
    as _i32;
import 'features/current_delivery/data/repositories/current_delivery_repository_imp.dart'
    as _i34;
import 'features/current_delivery/domain/repositories/current_delivery_repository.dart'
    as _i33;
import 'features/current_delivery/domain/use_cases/get_current_delivery_use_case.dart'
    as _i35;
import 'features/current_delivery/presentation/bloc/current_delivery_bloc.dart'
    as _i55;
import 'features/home/data/data_sources/local/home_local_data_source.dart'
    as _i36;
import 'features/home/data/data_sources/local/home_local_data_source_imp.dart'
    as _i37;
import 'features/home/data/data_sources/remote/home_remote_data_source.dart'
    as _i4;
import 'features/home/data/data_sources/remote/home_remote_data_source_imp.dart'
    as _i5;
import 'features/home/data/repositories/home_repository_imp.dart' as _i39;
import 'features/home/domain/repositories/home_repository.dart' as _i38;
import 'features/home/domain/use_cases/change_availability_status_use_case.dart'
    as _i52;
import 'features/home/presentation/bloc/home_bloc.dart' as _i59;
import 'features/order/data/data_sources/local/order_local_data_source.dart'
    as _i40;
import 'features/order/data/data_sources/local/order_local_data_source_imp.dart'
    as _i41;
import 'features/order/data/data_sources/remote/order_remote_data_source.dart'
    as _i9;
import 'features/order/data/data_sources/remote/order_remote_data_source_imp.dart'
    as _i10;
import 'features/order/data/repositories/order_repository_imp.dart' as _i43;
import 'features/order/domain/repositories/order_repository.dart' as _i42;
import 'features/order/domain/use_cases/change_order_use_case.dart' as _i53;
import 'features/order/domain/use_cases/get_order_use_case.dart' as _i56;
import 'features/order/domain/use_cases/report_order_use_case.dart' as _i44;
import 'features/order/presentation/bloc/order_bloc.dart' as _i60;
import 'features/splash/data/data_sources/local/splash_local_data_source.dart'
    as _i12;
import 'features/splash/data/data_sources/local/splash_local_data_source_imp.dart'
    as _i13;
import 'features/splash/data/data_sources/remote/splash_remote_data_source.dart'
    as _i14;
import 'features/splash/data/data_sources/remote/splash_remote_data_source_imp.dart'
    as _i15;
import 'features/splash/data/repositories/splash_repository_imp.dart' as _i48;
import 'features/splash/domain/repositories/splash_repository.dart' as _i47;
import 'features/splash/domain/use_cases/check_auth_use_case.dart' as _i54;
import 'features/splash/presentation/bloc/splash_bloc.dart' as _i61;
import 'injection.dart' as _i64; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i4.HomeRemoteDataSource>(
      () => _i5.HomeRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i6.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i7.Location>(() => registerModule.location);
  gh.lazySingleton<_i8.NetworkInfo>(
      () => _i8.NetworkInfoImpl(get<_i6.InternetConnectionChecker>()));
  gh.lazySingleton<_i9.OrderRemoteDataSource>(
      () => _i10.OrderRemoteDataSourceImp(dio: get<_i3.Dio>()));
  await gh.factoryAsync<_i11.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i12.SplashLocalDataSource>(() =>
      _i13.SplashLocalDataSourceImp(
          sharedPreferences: get<_i11.SharedPreferences>()));
  gh.lazySingleton<_i14.SplashRemoteDataSource>(
      () => _i15.SplashRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i16.AppLocalDataSource>(() => _i17.AppLocalDataSourceImp(
      sharedPreferences: get<_i11.SharedPreferences>(),
      location: get<_i7.Location>()));
  gh.lazySingleton<_i18.AppRemoteDataSource>(
      () => _i19.AppRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i20.AuthLocalDataSource>(() => _i21.AuthLocalDataSourceImp(
      sharedPreferences: get<_i11.SharedPreferences>()));
  gh.lazySingleton<_i22.AuthRemoteDataSource>(
      () => _i23.AuthRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i24.AuthRepository>(() => _i25.AuthRepositoryImp(
      get<_i20.AuthLocalDataSource>(), get<_i22.AuthRemoteDataSource>()));
  gh.lazySingleton<_i26.BaseLocalDataSource>(() => _i26.BaseLocalDataSourceImpl(
      sharedPreferences: get<_i11.SharedPreferences>()));
  gh.lazySingleton<_i27.BaseRepository>(() => _i27.BaseRepositoryImpl(
      baseLocalDataSource: get<_i26.BaseLocalDataSource>(),
      networkInfo: get<_i8.NetworkInfo>()));
  gh.lazySingleton<_i28.CheckCodeUseCase>(
      () => _i28.CheckCodeUseCase(get<_i24.AuthRepository>()));
  gh.lazySingleton<_i29.CurrentDeliveryLocalDataSource>(() =>
      _i30.CurrentDeliveryLocalDataSourceImp(
          sharedPreferences: get<_i11.SharedPreferences>()));
  gh.lazySingleton<_i31.CurrentDeliveryRemoteDataSource>(
      () => _i32.CurrentDeliveryRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i33.CurrentDeliveryRepository>(() =>
      _i34.CurrentDeliveryRepositoryImp(
          get<_i29.CurrentDeliveryLocalDataSource>(),
          get<_i31.CurrentDeliveryRemoteDataSource>(),
          baseLocalDataSource: get<_i26.BaseLocalDataSource>(),
          networkInfo: get<_i8.NetworkInfo>()));
  gh.lazySingleton<_i35.GetCurrentDeliveryUseCase>(() =>
      _i35.GetCurrentDeliveryUseCase(get<_i33.CurrentDeliveryRepository>()));
  gh.lazySingleton<_i36.HomeLocalDataSource>(() => _i37.HomeLocalDataSourceImp(
      sharedPreferences: get<_i11.SharedPreferences>()));
  gh.lazySingleton<_i38.HomeRepository>(() => _i39.HomeRepositoryImp(
      get<_i4.HomeRemoteDataSource>(), get<_i36.HomeLocalDataSource>(),
      baseLocalDataSource: get<_i26.BaseLocalDataSource>(),
      networkInfo: get<_i8.NetworkInfo>()));
  gh.lazySingleton<_i40.OrderLocalDataSource>(() =>
      _i41.OrderLocalDataSourceImp(
          sharedPreferences: get<_i11.SharedPreferences>()));
  gh.lazySingleton<_i42.OrderRepository>(() => _i43.OrderRepositoryImp(
      get<_i9.OrderRemoteDataSource>(), get<_i40.OrderLocalDataSource>(),
      baseLocalDataSource: get<_i26.BaseLocalDataSource>(),
      networkInfo: get<_i8.NetworkInfo>()));
  gh.lazySingleton<_i44.ReportOrderUseCase>(
      () => _i44.ReportOrderUseCase(get<_i42.OrderRepository>()));
  gh.lazySingleton<_i45.RequestRegisterUseCase>(
      () => _i45.RequestRegisterUseCase(get<_i24.AuthRepository>()));
  gh.lazySingleton<_i46.SendCodeUseCase>(
      () => _i46.SendCodeUseCase(get<_i24.AuthRepository>()));
  gh.lazySingleton<_i47.SplashRepository>(() => _i48.SplashRepositoryImp(
      get<_i12.SplashLocalDataSource>(), get<_i14.SplashRemoteDataSource>(),
      baseLocalDataSource: get<_i26.BaseLocalDataSource>(),
      networkInfo: get<_i8.NetworkInfo>()));
  gh.lazySingleton<_i49.AppRepository>(() => _i50.AppRepositoryImp(
      get<_i16.AppLocalDataSource>(), get<_i18.AppRemoteDataSource>(),
      baseLocalDataSource: get<_i26.BaseLocalDataSource>(),
      networkInfo: get<_i8.NetworkInfo>()));
  gh.factory<_i51.AuthBloc>(() => _i51.AuthBloc(get<_i28.CheckCodeUseCase>(),
      get<_i45.RequestRegisterUseCase>(), get<_i46.SendCodeUseCase>()));
  gh.lazySingleton<_i52.ChangeAvailabilityStatusUseCase>(
      () => _i52.ChangeAvailabilityStatusUseCase(get<_i38.HomeRepository>()));
  gh.lazySingleton<_i53.ChangeOrderStatusUseCase>(
      () => _i53.ChangeOrderStatusUseCase(get<_i42.OrderRepository>()));
  gh.lazySingleton<_i54.CheckAuthUseCase>(
      () => _i54.CheckAuthUseCase(get<_i47.SplashRepository>()));
  gh.lazySingleton<_i55.CurrentDeliveryBloc>(
      () => _i55.CurrentDeliveryBloc(get<_i35.GetCurrentDeliveryUseCase>()));
  gh.lazySingleton<_i56.GetOrderUseCase>(
      () => _i56.GetOrderUseCase(get<_i42.OrderRepository>()));
  gh.lazySingleton<_i57.GetPusherOptionsUseCase>(
      () => _i57.GetPusherOptionsUseCase(get<_i49.AppRepository>()));
  gh.lazySingleton<_i58.GetUserIdUseCase>(
      () => _i58.GetUserIdUseCase(get<_i49.AppRepository>()));
  gh.factory<_i59.HomeBloc>(
      () => _i59.HomeBloc(get<_i52.ChangeAvailabilityStatusUseCase>()));
  gh.factory<_i60.OrderBloc>(() => _i60.OrderBloc(get<_i56.GetOrderUseCase>(),
      get<_i44.ReportOrderUseCase>(), get<_i53.ChangeOrderStatusUseCase>()));
  gh.factory<_i61.SplashBloc>(
      () => _i61.SplashBloc(get<_i54.CheckAuthUseCase>()));
  gh.lazySingleton<_i62.UpdateCurrentLocationUseCase>(
      () => _i62.UpdateCurrentLocationUseCase(get<_i49.AppRepository>()));
  gh.lazySingleton<_i63.AppBloc>(() => _i63.AppBloc(
      get<_i62.UpdateCurrentLocationUseCase>(),
      get<_i7.Location>(),
      get<_i57.GetPusherOptionsUseCase>(),
      get<_i58.GetUserIdUseCase>()));
  return get;
}

class _$RegisterModule extends _i64.RegisterModule {}
