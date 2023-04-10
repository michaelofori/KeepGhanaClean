import 'package:dartz/dartz.dart';
import '../../../../core/data/error/failures/application_failure.dart';
import '../../../../utilities/constants/enums.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> signInAnonymously(String name);
  Future<AuthStatus> hasAnAccount();
}
