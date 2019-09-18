
import 'package:collection_app/resource/values/app_colors.dart';
import 'package:collection_app/resource/values/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardItem extends StatelessWidget{

  final String imagePath;
  final double imageWidth;
  final String label;
  final VoidCallback onPressed;

  const DashboardItem(
      {Key key,@required this.imagePath, @required this.label,
      @required this.onPressed, @required this.imageWidth}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 64.0),
          child: RaisedButton(
            padding: EdgeInsets.all(0.0),
            onPressed: this.onPressed,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 48.0),
                  child: Image.asset(
                    this.imagePath,
                    width: this.imageWidth,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  width: 250,
                  decoration: BoxDecoration(
                      color: AppColors.PRIMARY_COLOR,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(4.0),
                        bottomLeft: Radius.circular(4.0),
                        bottomRight: Radius.circular(4.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.PRIMARY_COLOR_LIGHT,
                            offset: Offset(0, 24),
                            blurRadius: 32,
                            spreadRadius: 8),
                        BoxShadow(
                            color: AppColors.PRIMARY_COLOR,
                            offset: Offset(0, 12),
                            blurRadius: 32,
                            spreadRadius: -6)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 32.0),
                    child: Text(
                      this.label,
                      style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: AppDimens.FONT_TITLE_DIMENS,
                          color: AppColors.PRIMARY_COLOR_LIGHT),
                          textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(48.0),
                topRight: Radius.circular(4.0),
                bottomLeft: Radius.circular(4.0),
                bottomRight: Radius.circular(4.0),
              ),
            ),
            color: AppColors.ACCENT_COLOR_DARK,
            elevation: 32.0,
            splashColor: AppColors.ACCENT_COLOR,
          ),
        )
      ],
    );
  }

}