import 'package:flutter/material.dart';
import '../cubits/cart_cubit.dart';
import '../widgets/bottom_nav_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/main_view_body_bloc_consumer.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String routeName = 'home';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => CartCubit(),
        child: Scaffold(
          bottomNavigationBar: BottomNavBar(onItemtrapped: (int value) {
            setState(() {
              currentIndex = value;
            });
          }),
          body: MainViewBodyBlocConsumer(currentIndex: currentIndex),
        ),
      ),
    );
  }
}


