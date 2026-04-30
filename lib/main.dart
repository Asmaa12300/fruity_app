import 'package:flutter/material.dart';
import 'app/fruity_app.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/get_it.dart';
import 'core/services/shared_prefrences_singlton.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bloc/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = CustomBlocObserver();
  await SharedPreferencesSingleton.init();
  setupGetIt();
  runApp(FruityApp());
}
