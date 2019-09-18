

import 'package:collection_app/components/activity.dart';
import 'package:collection_app/resource/values/app_colors.dart';
import 'package:collection_app/resource/values/app_dimens.dart';
import 'package:collection_app/resource/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddAgentView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AddAgentViewState();
  }

}

class _AddAgentViewState extends State<AddAgentView>{
  @override
  Widget build(BuildContext context) {
    return Activity(
      title: AppStrings.ADD_AGENT_TITLE,
      body: ListView(
        padding: EdgeInsets.only(
            top: 48,
            left: AppDimens.PADDING_LOOSE_COMFORT_DIMENS,
            right: AppDimens.PADDING_LOOSE_COMFORT_DIMENS),
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppDimens.PADDING_LOOSE_DIMENS),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Name",
                hintText: "Enter agent Name",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppDimens.PADDING_LOOSE_DIMENS),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Code",
                hintText: "Enter agent code",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppDimens.PADDING_LOOSE_DIMENS),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Account Code",
                hintText: "Enter account code",
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 32.0, left: 54.0, right: 54.0),
              child: RaisedButton(
                child: Text(
                  "Add",
                  style: TextStyle(
                    fontSize: AppDimens.FONT_LARGE_BUTTON_DIMENS,
                    letterSpacing: AppDimens.LETTER_SPACE_LOOSE_COMFORT_DIMENS,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                elevation: 12.0,
                splashColor: AppColors.ACCENT_COLOR_DARK,
                onPressed: (){},
              ))
        ],
      ),
    );
  }

}