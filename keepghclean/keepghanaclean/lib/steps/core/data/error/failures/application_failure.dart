import 'package:keepghanaclean/steps/core/data/error/failures/firebase_auth_failure.dart';

import '../exceptions/application_exception.dart';
import '../exceptions/firebase_auth_exception_app.dart';

abstract class Failure {}

/// Can be used when the list of exceptions is exhausted.
/// Also, It maps to [GenericApplicationException].
class GenericFailure extends Failure {
  final String message;

  GenericFailure({required this.message});
}

Failure firebaseExceptionsDecoder(ApplicationException e) {
  if (e is FirebaseAuthExceptionApp) {
    return e.when(
      operationNotAllowed: (msg) =>
          FirebaseAuthFailure.operationNotAllowed(message: msg),
    );
  } else {
    return GenericFailure(message: 'Something went wrong!');
  }
}
