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
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import 'app/data/data_sources/local/app_local_data_source.dart' as _i18;
import 'app/data/data_sources/local/app_local_data_source_Imp.dart' as _i19;
import 'app/data/data_sources/remote/app_remote_data_source.dart' as _i20;
import 'app/data/data_sources/remote/app_remote_data_source_imp.dart' as _i21;
import 'app/data/repositories/app_repository_imp.dart' as _i57;
import 'app/domain/repositories/app_repository.dart' as _i56;
import 'app/domain/use_cases/get_pusher_options_use_case.dart' as _i67;
import 'app/domain/use_cases/get_user_id_use_case.dart' as _i68;
import 'app/domain/use_cases/subscribe_to_prepared_order_channel_use_case.dart'
    as _i74;
import 'app/presentation/bloc/app_bloc.dart' as _i75;
import 'core/data/base_local_datasource.dart' as _i28;
import 'core/data/base_repository.dart' as _i29;
import 'core/network/network_info.dart' as _i8;
import 'features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i22;
import 'features/auth/data/data_sources/local/auth_local_data_source_imp.dart'
    as _i23;
import 'features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i24;
import 'features/auth/data/data_sources/remote/auth_remote_data_source_imp.dart'
    as _i25;
import 'features/auth/data/repositories/auth_repository_imp.dart' as _i27;
import 'features/auth/domain/repositories/auth_repository.dart' as _i26;
import 'features/auth/domain/use_cases/check_code_use_case.dart' as _i30;
import 'features/auth/domain/use_cases/request_register_use_case.dart' as _i51;
import 'features/auth/domain/use_cases/send_code_use_case.dart' as _i52;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i58;
import 'features/current_delivery/data/data_sources/local/current_delivery_local_data_source.dart'
    as _i31;
import 'features/current_delivery/data/data_sources/local/current_delivery_local_data_source_imp.dart'
    as _i32;
import 'features/current_delivery/data/data_sources/remote/current_delivery_remote_data_source.dart'
    as _i33;
import 'features/current_delivery/data/data_sources/remote/current_delivery_remote_data_source_imp.dart'
    as _i34;
import 'features/current_delivery/data/repositories/current_delivery_repository_imp.dart'
    as _i36;
import 'features/current_delivery/domain/repositories/current_delivery_repository.dart'
    as _i35;
import 'features/current_delivery/domain/use_cases/get_current_delivery_use_case.dart'
    as _i37;
import 'features/current_delivery/presentation/bloc/current_delivery_bloc.dart'
    as _i62;
import 'features/home/data/data_sources/local/home_local_data_source.dart'
    as _i38;
import 'features/home/data/data_sources/local/home_local_data_source_imp.dart'
    as _i39;
import 'features/home/data/data_sources/remote/home_remote_data_source.dart'
    as _i4;
import 'features/home/data/data_sources/remote/home_remote_data_source_imp.dart'
    as _i5;
import 'features/home/data/repositories/home_repository_imp.dart' as _i41;
import 'features/home/domain/repositories/home_repository.dart' as _i40;
import 'features/home/domain/use_cases/change_availability_use_case.dart'
    as _i59;
import 'features/home/domain/use_cases/get_availability_status_use_case.dart'
    as _i63;
import 'features/home/domain/use_cases/set_availability_use_case.dart' as _i53;
import 'features/home/presentation/bloc/home_bloc.dart' as _i69;
import 'features/order/data/data_sources/local/order_local_data_source.dart'
    as _i42;
import 'features/order/data/data_sources/local/order_local_data_source_imp.dart'
    as _i43;
import 'features/order/data/data_sources/remote/order_remote_data_source.dart'
    as _i9;
import 'features/order/data/data_sources/remote/order_remote_data_source_imp.dart'
    as _i10;
import 'features/order/data/repositories/order_repository_imp.dart' as _i45;
import 'features/order/domain/repositories/order_repository.dart' as _i44;
import 'features/order/domain/use_cases/change_order_use_case.dart' as _i60;
import 'features/order/domain/use_cases/get_order_use_case.dart' as _i65;
import 'features/order/domain/use_cases/report_order_use_case.dart' as _i50;
import 'features/order/presentation/bloc/order_bloc.dart' as _i71;
import 'features/profile/data/data_sources/local/profile_local_data_source.dart'
    as _i46;
import 'features/profile/data/data_sources/local/profile_local_data_source_imp.dart'
    as _i47;
import 'features/profile/data/data_sources/remote/profile_remote_data_source.dart'
    as _i11;
import 'features/profile/data/data_sources/remote/profile_remote_data_source_imp.dart'
    as _i12;
import 'features/profile/data/repositories/profile_repository_imp.dart' as _i49;
import 'features/profile/domain/repositories/profile_repository.dart' as _i48;
import 'features/profile/domain/use_cases/get_delivery_balance_use_case.dart'
    as _i64;
import 'features/profile/domain/use_cases/get_orders_history_use_case.dart'
    as _i66;
import 'features/profile/domain/use_cases/logout_use_case.dart' as _i70;
import 'features/profile/presentation/bloc/profile_bloc.dart' as _i72;
import 'features/splash/data/data_sources/local/splash_local_data_source.dart'
    as _i14;
import 'features/splash/data/data_sources/local/splash_local_data_source_imp.dart'
    as _i15;
import 'features/splash/data/data_sources/remote/splash_remote_data_source.dart'
    as _i16;
import 'features/splash/data/data_sources/remote/splash_remote_data_source_imp.dart'
    as _i17;
import 'features/splash/data/repositories/splash_repository_imp.dart' as _i55;
import 'features/splash/domain/repositories/splash_repository.dart' as _i54;
import 'features/splash/domain/use_cases/check_auth_use_case.dart' as _i61;
import 'features/splash/presentation/bloc/splash_bloc.dart' as _i73;
import 'injection.dart' as _i76; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i11.ProfileRemoteDataSource>(
      () => _i12.ProfileRemoteDataSourceImp(dio: get<_i3.Dio>()));
  await gh.factoryAsync<_i13.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i14.SplashLocalDataSource>(() =>
      _i15.SplashLocalDataSourceImp(
          sharedPreferences: get<_i13.SharedPreferences>()));
  gh.lazySingleton<_i16.SplashRemoteDataSource>(
      () => _i17.SplashRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i18.AppLocalDataSource>(() => _i19.AppLocalDataSourceImp(
      sharedPreferences: get<_i13.SharedPreferences>(),
      location: get<_i7.Location>()));
  gh.lazySingleton<_i20.AppRemoteDataSource>(
      () => _i21.AppRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i22.AuthLocalDataSource>(() => _i23.AuthLocalDataSourceImp(
      sharedPreferences: get<_i13.SharedPreferences>()));
  gh.lazySingleton<_i24.AuthRemoteDataSource>(
      () => _i25.AuthRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i26.AuthRepository>(() => _i27.AuthRepositoryImp(
      get<_i22.AuthLocalDataSource>(), get<_i24.AuthRemoteDataSource>()));
  gh.lazySingleton<_i28.BaseLocalDataSource>(() => _i28.BaseLocalDataSourceImpl(
      sharedPreferences: get<_i13.SharedPreferences>()));
  gh.lazySingleton<_i29.BaseRepository>(() => _i29.BaseRepositoryImpl(
      baseLocalDataSource: get<_i28.BaseLocalDataSource>(),
      networkInfo: get<_i8.NetworkInfo>()));
  gh.lazySingleton<_i30.CheckCodeUseCase>(
      () => _i30.CheckCodeUseCase(get<_i26.AuthRepository>()));
  gh.lazySingleton<_i31.CurrentDeliveryLocalDataSource>(() =>
      _i32.CurrentDeliveryLocalDataSourceImp(
          sharedPreferences: get<_i13.SharedPreferences>()));
  gh.lazySingleton<_i33.CurrentDeliveryRemoteDataSource>(
      () => _i34.CurrentDeliveryRemoteDataSourceImp(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i35.CurrentDeliveryRepository>(() =>
      _i36.CurrentDeliveryRepositoryImp(
          get<_i31.CurrentDeliveryLocalDataSource>(),
          get<_i33.CurrentDeliveryRemoteDataSource>(),
          baseLocalDataSource: get<_i28.BaseLocalDataSource>(),
          networkInfo: get<_i8.NetworkInfo>()));
  gh.lazySingleton<_i37.GetCurrentDeliveryUseCase>(() =>
      _i37.GetCurrentDeliveryUseCase(get<_i35.CurrentDeliveryRepository>()));
  gh.lazySingleton<_i38.HomeLocalDataSource>(() => _i39.HomeLocalDataSourceImp(
      sharedPreferences: get<_i13.SharedPreferences>()));
  gh.lazySingleton<_i40.HomeRepository>(() => _i41.HomeRepositoryImp(
      get<_i4.HomeRemoteDataSource>(), get<_i38.HomeLocalDataSource>(),
      baseLocalDataSource: get<_i28.BaseLocalDataSource>(),
      networkInfo: get<_i8.NetworkInfo>()));
  gh.lazySingleton<_i42.OrderLocalDataSource>(() =>
      _i43.OrderLocalDataSourceImp(
          sharedPreferences: get<_i13.SharedPreferences>()));
  gh.lazySingleton<_i44.OrderRepository>(() => _i45.OrderRepositoryImp(
      get<_i9.OrderRemoteDataSource>(), get<_i42.OrderLocalDataSource>(),
      baseLocalDataSource: get<_i28.BaseLocalDataSource>(),
      networkInfo: get<_i8.NetworkInfo>()));
  gh.lazySingleton<_i46.ProfileLocalDataSource>(() =>
      _i47.ProfileLocalDataSourceImp(
          sharedPreferences: get<_i13.SharedPreferences>()));
  gh.lazySingleton<_i48.ProfileRepository>(() => _i49.ProfileRepositoryImp(
      get<_i46.ProfileLocalDataSource>(), get<_i11.ProfileRemoteDataSource>(),
      baseLocalDataSource: get<_i28.BaseLocalDataSource>(),
      networkInfo: get<_i8.NetworkInfo>()));
  gh.lazySingleton<_i50.ReportOrderUseCase>(
      () => _i50.ReportOrderUseCase(get<_i44.OrderRepository>()));
  gh.lazySingleton<_i51.RequestRegisterUseCase>(
      () => _i51.RequestRegisterUseCase(get<_i26.AuthRepository>()));
  gh.lazySingleton<_i52.SendCodeUseCase>(
      () => _i52.SendCodeUseCase(get<_i26.AuthRepository>()));
  gh.lazySingleton<_i53.SetAvailabilityUseCase>(
      () => _i53.SetAvailabilityUseCase(get<_i40.HomeRepository>()));
  gh.lazySingleton<_i54.SplashRepository>(() => _i55.SplashRepositoryImp(
      get<_i14.SplashLocalDataSource>(), get<_i16.SplashRemoteDataSource>(),
      baseLocalDataSource: get<_i28.BaseLocalDataSource>(),
      networkInfo: get<_i8.NetworkInfo>()));
  gh.lazySingleton<_i56.AppRepository>(() => _i57.AppRepositoryImp(
      get<_i18.AppLocalDataSource>(), get<_i20.AppRemoteDataSource>(),
      baseLocalDataSource: get<_i28.BaseLocalDataSource>(),
      networkInfo: get<_i8.NetworkInfo>()));
  gh.factory<_i58.AuthBloc>(() => _i58.AuthBloc(get<_i30.CheckCodeUseCase>(),
      get<_i51.RequestRegisterUseCase>(), get<_i52.SendCodeUseCase>()));
  gh.lazySingleton<_i59.ChangeAvailabilityUseCase>(
      () => _i59.ChangeAvailabilityUseCase(get<_i40.HomeRepository>()));
  gh.lazySingleton<_i60.ChangeOrderStatusUseCase>(
      () => _i60.ChangeOrderStatusUseCase(get<_i44.OrderRepository>()));
  gh.lazySingleton<_i61.CheckAuthUseCase>(
      () => _i61.CheckAuthUseCase(get<_i54.SplashRepository>()));
  gh.lazySingleton<_i62.CurrentDeliveryBloc>(
      () => _i62.CurrentDeliveryBloc(get<_i37.GetCurrentDeliveryUseCase>()));
  gh.lazySingleton<_i63.GetAvailabilityStatusUseCase>(
      () => _i63.GetAvailabilityStatusUseCase(get<_i40.HomeRepository>()));
  gh.lazySingleton<_i64.GetDeliveryBalanceUseCase>(
      () => _i64.GetDeliveryBalanceUseCase(get<_i48.ProfileRepository>()));
  gh.lazySingleton<_i65.GetOrderUseCase>(
      () => _i65.GetOrderUseCase(get<_i44.OrderRepository>()));
  gh.lazySingleton<_i66.GetOrdersHistoryUseCase>(
      () => _i66.GetOrdersHistoryUseCase(get<_i48.ProfileRepository>()));
  gh.lazySingleton<_i67.GetPusherOptionsUseCase>(
      () => _i67.GetPusherOptionsUseCase(get<_i56.AppRepository>()));
  gh.lazySingleton<_i68.GetUserIdUseCase>(
      () => _i68.GetUserIdUseCase(get<_i56.AppRepository>()));
  gh.lazySingleton<_i69.HomeBloc>(() => _i69.HomeBloc(
      get<_i59.ChangeAvailabilityUseCase>(),
      get<_i63.GetAvailabilityStatusUseCase>(),
      get<_i53.SetAvailabilityUseCase>()));
  gh.lazySingleton<_i70.LogoutUseCase>(
      () => _i70.LogoutUseCase(get<_i48.ProfileRepository>()));
  gh.factory<_i71.OrderBloc>(() => _i71.OrderBloc(get<_i65.GetOrderUseCase>(),
      get<_i50.ReportOrderUseCase>(), get<_i60.ChangeOrderStatusUseCase>()));
  gh.lazySingleton<_i72.ProfileBloc>(() => _i72.ProfileBloc(
      get<_i64.GetDeliveryBalanceUseCase>(),
      get<_i66.GetOrdersHistoryUseCase>(),
      get<_i70.LogoutUseCase>()));
  gh.factory<_i73.SplashBloc>(
      () => _i73.SplashBloc(get<_i61.CheckAuthUseCase>()));
  gh.lazySingleton<_i74.UpdateCurrentLocationUseCase>(
      () => _i74.UpdateCurrentLocationUseCase(get<_i56.AppRepository>()));
  gh.lazySingleton<_i75.AppBloc>(() => _i75.AppBloc(
      get<_i74.UpdateCurrentLocationUseCase>(),
      get<_i7.Location>(),
      get<_i67.GetPusherOptionsUseCase>(),
      get<_i68.GetUserIdUseCase>()));
  return get;
}

class _$RegisterModule extends _i76.RegisterModule {}
