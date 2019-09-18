

import 'package:collection_app/resource/values/app_colors.dart';
import 'package:collection_app/resource/values/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CollectionHistoryItem extends StatelessWidget{

  final String dateORname;
  final String amount;

  const CollectionHistoryItem({Key key,
    @required this.dateORname,
    @required this.amount}):super(key:key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppDimens.PADDING_TIGHT_COMFORT_DIMENS, bottom: AppDimens.PADDING_TIGHT_DIMENS),
      child: RaisedButton(
        onPressed: () {},
        padding: EdgeInsets.symmetric(
            vertical: AppDimens.PADDING_LOOSE_COMFORT_DIMENS, horizontal: 24.0),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                this.dateORname,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppDimens.FONT_NORMAL_DIMENS,
                  letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
                  color: AppColors.COLOR_BLACK,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text('-',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppDimens.FONT_NORMAL_DIMENS,
                  letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
                  color: AppColors.COLOR_BLACK,
                ),
                textAlign: TextAlign.center,),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(this.amount,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppDimens.FONT_NORMAL_DIMENS,
                  letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
                  color: AppColors.COLOR_GREY,
                ),
                textAlign: TextAlign.left,),
            )
          ],
        ),
        color: AppColors.COLOR_WHITE,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(4.0),
              bottomLeft: Radius.circular(4.0),
              bottomRight: Radius.circular(4.0)
          ),
        ),
        elevation: 6.0,
      ),
      decoration: BoxDecoration(
        boxShadow: [

        ]
      ),
    );
  }

}