
import 'package:collection_app/resource/values/app_colors.dart';
import 'package:collection_app/resource/values/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClientListItem extends StatelessWidget{

  final String clientName;
  final String clientAccountNo;
  final VoidCallback onPress;

  const ClientListItem({Key key, @required this.clientName, @required this.clientAccountNo,
  @required this.onPress}):
      super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.symmetric(vertical: AppDimens.PADDING_COMFORT_DIMENS, horizontal: AppDimens.PADDING_LOOSE_COMFORT_DIMENS),
      decoration: BoxDecoration(
          color: AppColors.PRIMARY_COLOR_LIGHT,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(4.0),
            bottomLeft: Radius.circular(4.0),
            bottomRight: Radius.circular(4.0),
          ),
          boxShadow: [
            BoxShadow(
                color: AppColors.ACCENT_COLOR_DARK,
                offset: Offset(0, 8),
                blurRadius: 12,
                spreadRadius: -4)
          ]),
      child: RaisedButton(
        onPressed: this.onPress,
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  this.clientName,
                  style: TextStyle(
                      fontSize: AppDimens.FONT_TITLE_DIMENS,
                      fontWeight: FontWeight.bold,
                      color: AppColors.ACCENT_COLOR,
                      letterSpacing: 1.5),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    this.clientAccountNo,
                    style: TextStyle(
                        fontSize: AppDimens.FONT_SUBTITLE_DIMENS,
                        color: AppColors.PRIMARY_COLOR_LIGHT,
                        letterSpacing: 1.5),
                  ),
                )
              ],
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(4.0),
            bottomLeft: Radius.circular(4.0),
            bottomRight: Radius.circular(4.0),
          ),
        ),
        color: AppColors.ACCENT_COLOR_DARK,
        splashColor: AppColors.ACCENT_COLOR,
        elevation: 18.0,
      ),
    );
  }

}