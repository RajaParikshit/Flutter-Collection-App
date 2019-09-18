import 'package:collection_app/resource/values/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppDialog extends StatelessWidget{

  final String title;
  final List<Widget> children;
  final Color backgroundColor;
  final Color titleColor;

  const AppDialog({Key key, @required this.title, @required this.children,
  @required this.backgroundColor, @required this.titleColor}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: EdgeInsets.only(top: 32.0, bottom: 16.0, left: 32.0),
      contentPadding: EdgeInsets.all(0.0),
      backgroundColor: this.backgroundColor,
      title: Text(this.title,
        style: TextStyle(
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
            color: this.titleColor,
            fontSize: AppDimens.FONT_TITLE_DIMENS,
        ),),
      children: this.children,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(48.0),
          topRight: Radius.circular(4.0),
          bottomLeft: Radius.circular(4.0),
          bottomRight: Radius.circular(4.0),
        ),
      ),
    );
  }
}

class AppDialogItem extends StatelessWidget{

  final IconData icon;
  final String label;
  final Color iconColor;
  final Color labelColor;
  final VoidCallback onPress;

  const AppDialogItem({Key key, @required this.icon, @required this.label,
    @required this.iconColor, @required this.labelColor, @required this.onPress})
      :super(key:key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
        child: Row(
          children: <Widget>[
            Icon(this.icon,
              color: this.iconColor,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(this.label,
                style: TextStyle(
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                    color: this.labelColor,
                    fontSize: AppDimens.FONT_SUBTITLE_DIMENS,
                ),
              ),
            )
          ],
        ),
      ),
      onPressed: this.onPress,
    );
  }

}