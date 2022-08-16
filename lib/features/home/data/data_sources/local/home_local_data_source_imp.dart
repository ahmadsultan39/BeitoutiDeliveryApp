import 'package:beitouti_delivery/core/data/base_local_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/util/constants.dart';
import 'home_local_data_source.dart';

@LazySingleton(as: HomeLocalDataSource)
class HomeLocalDataSourceImp extends BaseLocalDataSourceImpl
    implements HomeLocalDataSource {
  HomeLocalDataSourceImp({
    required SharedPreferences sharedPreferences,
  }) : super(
          sharedPreferences: sharedPreferences,
        );
}
