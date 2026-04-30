import '../../../../generated/assets.dart';

class BottomNavBarEntity {
  final String activeImage, inActiveImage;

  final String name;

  BottomNavBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}
List<BottomNavBarEntity>get bottomNavBarItems =>[
  BottomNavBarEntity(
      activeImage: Assets.boldHome,
      inActiveImage: Assets.outlineHome,
      name: 'الرئيسية'),
  BottomNavBarEntity(
      activeImage: Assets.boldProducts,
      inActiveImage: Assets.outlineProducts,
      name: 'المنتجات'),

  BottomNavBarEntity(
      activeImage: Assets.boldShoppingCart,
      inActiveImage: Assets.outlineShoppingCart,
      name: 'سلة التسوق'),

  BottomNavBarEntity(
      activeImage: Assets.boldUser,
      inActiveImage: Assets.outlineUser,
      name: 'حسابي'),
];