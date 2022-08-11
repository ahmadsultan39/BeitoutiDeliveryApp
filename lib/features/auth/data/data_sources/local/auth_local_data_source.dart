import '../../../../../core/data/base_local_datasource.dart';
import '../../models/user_model.dart';

abstract class AuthLocalDataSource extends BaseLocalDataSource {
  Future<void> saveUser(UserModel user);
}