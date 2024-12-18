import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DefaultPath {
  Directory getTemporaryDirectory();

  Directory getDocumentDirectory();
}

@lazySingleton
@injectable
class AppDirectory implements DefaultPath {
  AppDirectory({
    @Named('temporary') required this.temporaryDirectory,
    @Named('document') required this.documentDirectory,
  });
  final Directory temporaryDirectory;
  final Directory documentDirectory;

  @override
  Directory getTemporaryDirectory() => temporaryDirectory;

  @override
  Directory getDocumentDirectory() => documentDirectory;
}

@module
abstract class RegisterModule {
  @singleton
  Dio dio() => Dio();

  @preResolve
  Future<SharedPreferences> pref() => SharedPreferences.getInstance();

  @preResolve
  @Named('temporary')
  Future<Directory> temporaryDirectory() => getTemporaryDirectory();

  @preResolve
  @Named('document')
  Future<Directory> documentDirectory() => getApplicationDocumentsDirectory();

  @preResolve
  Future<FirebaseApp> initializeFireBase() => Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform
      );
}
