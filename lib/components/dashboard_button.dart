import 'package:collection_app/resource/values/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardButton extends StatelessWidget{

  final Color buttonColor;
  final IconData icon;
  final Color iconColor;
  final String label;
  final Color labelColor;
  final VoidCallback onPress;


  const DashboardButton({Key key, @required this.buttonColor, @required this.icon, @required this.iconColor,
    @required this.label, @required this.labelColor, @required this.onPress }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        padding:
        EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        onPressed: this.onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Icon(
                this.icon,
                size: 24.0,
                color: this.iconColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 4.0),
              child: Text(
                this.label,
                style: TextStyle(
                    color: this.labelColor,
                    letterSpacing: 1.5,
                    fontSize: AppDimens.FONT_BUTTON_DIMENS),
              ),
            )
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(4.0),
            bottomLeft: Radius.circular(4.0),
            bottomRight: Radius.circular(4.0),
          ),
        ),
        color: this.buttonColor,
        elevation: 32.0,
        splashColor: this.iconColor,
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: this.buttonColor,
            offset: Offset(0, 8),
            blurRadius: 12,
            spreadRadius: -4)
      ]),
    );
  }

}