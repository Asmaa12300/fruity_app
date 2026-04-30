import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruity_app/core/entities/product_input_entity.dart';
import 'package:fruity_app/core/utils/App_colours.dart';
import 'package:fruity_app/core/utils/App_text_styles.dart';
import 'package:fruity_app/features/home/presentation/cubits/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widget/custom_network_image.dart';

class FruitItem extends StatelessWidget {

  const FruitItem({super.key, required this.productEntity});
final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {print(productEntity.price);
    }
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 20),
                productEntity.imageUrl!= null ?Flexible(
                  child: CustomNetworkImage(imageUrl: productEntity.imageUrl!),
                ):SizedBox(
                  height: 100,
                  width: double.infinity,
                ),
                SizedBox(height: 20),
              ListTile(
                title: Text(
                productEntity.name,
                textAlign: TextAlign.right,
                  style: AppTextStyles.cairo300style15b.copyWith(fontWeight: FontWeight.w500),
                ),

                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${productEntity.price!}جنية',
                        style: AppTextStyles.cairo700style13lg.copyWith(color:Color(0xFFF4A91F), ),

                      ),
                      TextSpan(
                        text: '/',
                        style: AppTextStyles.cairo700style13lg.copyWith(color:Color(0xFFF4A91F).withOpacity(0.5), ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: AppTextStyles.cairo700style13lg.copyWith(color:Color(0xFFF4A91F), ),
                      ),
                      TextSpan(
                        text: 'كيلو',
                        style: AppTextStyles.cairo700style13lg.copyWith(color:Color(0xFFF4A91F).withOpacity(0.5),fontWeight: FontWeight.w600 ),
                        ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
                  trailing:GestureDetector(
                    onTap: (){
                      context.read<CartCubit>().addProduct(productEntity);
                    },
                    child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor:AppColors.primaryColour ,
                                    child: Icon(Icons.add, color: AppColors.white),

                                  ),
                  ),
              ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

