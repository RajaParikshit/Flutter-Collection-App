import 'package:collection_app/resource/values/app_colors.dart';
import 'package:collection_app/resource/values/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsItem extends StatelessWidget {
  final IconData settingItemIcon;
  final String settingItemLabel;
  final VoidCallback onPressed;

  const SettingsItem(
      {Key key,@required this.settingItemIcon,
      @required this.settingItemLabel,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
            color: AppColors.PRIMARY_COLOR_SEMI,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(4.0),
              bottomLeft: Radius.circular(4.0),
              bottomRight: Radius.circular(4.0),
            )),
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: this.onPressed,
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    this.settingItemIcon,
                    color: AppColors.PRIMARY_COLOR_LIGHT,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      this.settingItemLabel,
                      style: TextStyle(
                          fontSize: AppDimens.FONT_SUBTITLE_DIMENS,
                          color: AppColors.PRIMARY_COLOR_LIGHT,
                          letterSpacing: 1.5),
                    ),
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              color: AppColors.PRIMARY_COLOR_SEMI,
              splashColor: AppColors.PRIMARY_COLOR_LIGHT,
              elevation: 6.0,
            ),
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: AppColors.PRIMARY_COLOR_LIGHT,
                shape: BoxShape.rectangle,
              ),
            )
          ],
        ));
  }
}
