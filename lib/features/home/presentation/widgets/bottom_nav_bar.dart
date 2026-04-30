import 'package:flutter/material.dart';
import 'package:fruity_app/core/utils/App_colours.dart';
import 'package:fruity_app/features/home/domian/entites/bottom_nav_bar_entity.dart';
import 'nav_bar_item.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key,required this.onItemtrapped});
final ValueChanged<int>onItemtrapped;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectefdIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: bottomNavBarItems.asMap().entries.map((e) {
            var index = e.key;
            var entity = e.value;
            return Expanded(
              flex: index == selectefdIndex?3:2,
              child: GestureDetector(
                onTap: () {
                  widget.onItemtrapped(index);
                  setState(() {
                    selectefdIndex = index;
                  });
                },
                child: NavBarItem(
                  isSelected: selectefdIndex == index,
                
                  bottomNavBarEntity: entity,
                ),
              ),
            );
          }).toList(),

      ),
    );
  }
}
