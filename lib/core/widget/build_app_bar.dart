import 'package:flutter/material.dart';

import '../utils/App_text_styles.dart';
import 'notification_widget.dart';

AppBar buildAppBar(context ,{required String title,bool?showBackButton,bool ?showNotificatonButton}) {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Visibility(
            visible: showNotificatonButton??true,
            child: NotificationWidget()),
      ),
    ],
    leading: Visibility(
      visible: showBackButton??true,

      child: IconButton(


        icon: const Icon(

          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      style: AppTextStyles.cairo700style23b.copyWith(fontSize: 19),
    ),
  );
}
