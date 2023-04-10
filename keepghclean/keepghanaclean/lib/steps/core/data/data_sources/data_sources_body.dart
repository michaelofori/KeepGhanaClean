import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'package:logging/logging.dart';

import '../error/exceptions/application_exception.dart';

Future<T> returnOrThrow<T>(Future<T> Function() fun) async {
  try {
    return await fun();
  } on FirebaseException catch (e) {
    firebaseErrorDecoder(e);
  } on Exception catch (e, s) {
    if (kDebugMode) {
      log("DataSourceError:\n $e", level: Level.SEVERE.value, stackTrace: s);
    }
    throw GenericApplicationException(message: 'Something went wrong!');
  } catch (e, s) {
    if (kDebugMode) {
      log("DataSourceError:\n $e", level: Level.SEVERE.value, stackTrace: s);
    }
    throw GenericApplicationException(message: 'Something went wrong!');
  }
  throw GenericApplicationException(message: 'Something went wrong!');
}
