import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import  'package:flutter/material.dart';

class CustomBlocObserver extends BlocObserver {
  @override

  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode){
      debugPrint('${bloc.runtimeType} $change');
    }
    }

    // Handle error

}