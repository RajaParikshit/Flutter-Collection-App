

import 'package:collection_app/resource/values/app_colors.dart';
import 'package:collection_app/resource/values/app_dimens.dart';
import 'package:collection_app/resource/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppAlertDialog extends StatelessWidget{

  final String title;
  final Widget content;
  final VoidCallback onReject;
  final VoidCallback onAccept;

  AppAlertDialog({Key key, @required this.title, @required this.content, @required this.onReject, @required this.onAccept}):
      super(key:key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.only(
          top: 32.0,
          bottom: AppDimens.PADDING_LOOSE_DIMENS,
          left: AppDimens.PADDING_LOOSE_DIMENS),
      contentPadding: EdgeInsets.all(0.0),
      backgroundColor: AppColors.PRIMARY_COLOR_LIGHT,
      title: Text(
        this.title,
        style: TextStyle(
          letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
          fontWeight: FontWeight.bold,
          color: AppColors.ACCENT_COLOR_DARK,
          fontSize: AppDimens.FONT_TITLE_DIMENS,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(48.0),
          topRight: Radius.circular(4.0),
          bottomLeft: Radius.circular(4.0),
          bottomRight: Radius.circular(4.0),
        ),
      ),
      actions: <Widget>[
        OutlineButton(
          onPressed: this.onReject,
          child: Text(
            AppStrings.ADD_COLLECTION_CONFIRM_DIALOG_REJECT_BTN_LABEL,
            style: TextStyle(
              fontSize: AppDimens.FONT_BUTTON_DIMENS,
              letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
              fontWeight: FontWeight.bold,
            ),
          ),
          textColor: AppColors.PRIMARY_COLOR,
          highlightedBorderColor: AppColors.PRIMARY_COLOR,
        ),
        FlatButton(
          onPressed: this.onAccept,
          child: Text(
            AppStrings.ADD_COLLECTION_CONFIRM_DIALOG_CONFIRM_BTN_LABEL,
            style: TextStyle(
              fontSize: AppDimens.FONT_BUTTON_DIMENS,
              letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
              fontWeight: FontWeight.bold,
            ),
          ),
          textColor: AppColors.PRIMARY_COLOR_LIGHT,
          color: AppColors.PRIMARY_COLOR,
        )
      ],
      content: Padding(
        padding: EdgeInsets.symmetric(vertical: AppDimens.PADDING_LOOSE_DIMENS, horizontal: AppDimens.PADDING_LOOSE_COMFORT_DIMENS),
        child: this.content,
      ),
    );
  }

}