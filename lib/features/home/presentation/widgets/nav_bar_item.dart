import 'package:flutter/material.dart';
import '../../domian/entites/bottom_nav_bar_entity.dart';
import 'active_item.dart';
import 'in_active_item.dart';


class NavBarItem extends StatelessWidget {
  const NavBarItem({super.key, required this.isSelected, required this.bottomNavBarEntity});
  final bool isSelected ;
  final BottomNavBarEntity bottomNavBarEntity;
  @override
  Widget build(BuildContext context) {
    return  isSelected ? ActiveItem(
      image: bottomNavBarEntity.activeImage,
      text: bottomNavBarEntity.name,
    ) : InActiveItem(image: bottomNavBarEntity.inActiveImage);
  }
}
