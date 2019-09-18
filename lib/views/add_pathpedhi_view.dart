import 'package:collection_app/components/activity.dart';
import 'package:collection_app/resource/values/app_colors.dart';
import 'package:collection_app/resource/values/app_dimens.dart';
import 'package:collection_app/resource/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddPathpedhiView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddPathpedhiViewState();
  }
}

class _AddPathpedhiViewState extends State<AddPathpedhiView> {
  @override
  Widget build(BuildContext context) {
    return Activity(
      title: AppStrings.ADD_PATHPEDHI_TITLE,
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
                hintText: "Enter Pathpedhi Name",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppDimens.PADDING_LOOSE_DIMENS),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Address 1",
                hintText: "Enter address line 1",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppDimens.PADDING_COMFORT_DIMENS),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Address 2",
                hintText: "Enter address line 1",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppDimens.PADDING_LOOSE_DIMENS),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Address 3",
                hintText: "Enter address line 3",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppDimens.PADDING_LOOSE_DIMENS),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 50,
                  child: Padding(
                    padding:
                        EdgeInsets.only(right: AppDimens.PADDING_TIGHT_DIMENS),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "PIN",
                        hintText: "Enter PIN Code",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 50,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: AppDimens.PADDING_TIGHT_DIMENS),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        hintText: "Enter phone number",
                      ),
                    ),
                  ),
                )
              ],
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
