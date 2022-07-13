import 'package:beitouti_delivery/features/splash/data/data_sources/local/splash_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/data/base_local_datasource.dart';

@LazySingleton(as: SplashLocalDataSource)
class SplashLocalDataSourceImp extends BaseLocalDataSourceImpl
    implements SplashLocalDataSource {
  SplashLocalDataSourceImp({required SharedPreferences sharedPreferences})
      : super(sharedPreferences: sharedPreferences);
}
