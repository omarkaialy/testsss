import 'package:dartz/dartz.dart';
import 'package:login_form/auth/data/datasource/auth_datasource.dart';
import 'package:login_form/auth/data/models/auth_model.dart';
import 'package:login_form/unified_api/handling_exception_manager.dart';

import '../../../unified_api/failures.dart';

class AuthRepo with HandlingExceptionManager {
  Future<Either<Failure, AuthModel>> login(
      String email, String password) async {
    return wrapHandling(tryCall: () async {
      final result = await AuthDataSource().login(email, password);
      return Right(result);
    });
  }
}
