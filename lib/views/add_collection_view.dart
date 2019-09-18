import 'package:collection_app/app/app_routes.dart';
import 'package:collection_app/components/activity.dart';
import 'package:collection_app/resource/values/app_colors.dart';
import 'package:collection_app/resource/values/app_dimens.dart';
import 'package:collection_app/resource/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddCollectionView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddCollectionViewState();
}

class _AddCollectionViewState extends State<AddCollectionView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Activity(
      title: AppStrings.ADD_COLLECTION_TITLE,
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: AppDimens.PADDING_COMFORT_DIMENS),
          child: IconButton(
            icon: Icon(
              Icons.timeline,
              color: AppColors.PRIMARY_COLOR_LIGHT,
              size: AppDimens.ICON_NORMAL_DIMENS,
            ),
            splashColor: AppColors.PRIMARY_COLOR_LIGHT,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.APP_ROUTE_VIEW_COLLECTION);
            },
          ),
        )
      ],
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: AppDimens.PADDING_LOOSE_COMFORT_DIMENS,
            right: AppDimens.PADDING_LOOSE_COMFORT_DIMENS, top: 48.0),
        children: <Widget>[
          Text(
            "3,600",
            style: TextStyle(
              color: AppColors.ACCENT_COLOR_DARK,
              fontWeight: FontWeight.bold,
              fontSize: AppDimens.FONT_EXTRA_LARGE_DIMENS,
              letterSpacing: AppDimens.LETTER_SPACE_LOOSE_COMFORT_DIMENS,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.0),
            child: Text(
              AppStrings.ADD_COLLECTION_CURRENT_BALANCE_LABEL,
              style: TextStyle(
                color: AppColors.PRIMARY_COLOR,
                fontWeight: FontWeight.bold,
                fontSize: AppDimens.FONT_MEDIUM_DIMENS,
                letterSpacing: AppDimens.LETTER_SPACE_LOOSE_COMFORT_DIMENS,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: {
                  1: FractionColumnWidth(0.65),
                },
                children: [
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(AppDimens.PADDING_COMFORT_DIMENS),
                      child: Text(
                        AppStrings.ADD_COLLECTION_ACCOUNT_NO_LABEL,
                        style: TextStyle(
                          color: AppColors.COLOR_GREY,
                          fontSize: AppDimens.FONT_NORMAL_DIMENS,
                          letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(AppDimens.PADDING_COMFORT_DIMENS),
                      child: Text(
                        ": xxxxxxx",
                        style: TextStyle(
                          color: AppColors.COLOR_GREY,
                          fontSize: AppDimens.FONT_NORMAL_DIMENS,
                          letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(AppDimens.PADDING_COMFORT_DIMENS),
                      child: Text(
                        AppStrings.ADD_COLLECTION_CLIENT_NAME_LABEL,
                        style: TextStyle(
                          color: AppColors.COLOR_GREY,
                          fontWeight: FontWeight.bold,
                          fontSize: AppDimens.FONT_NORMAL_DIMENS,
                          letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(AppDimens.PADDING_COMFORT_DIMENS),
                      child: Text(
                        ": xxxxxxx xxxxxxxx xxxxxxxxx",
                        style: TextStyle(
                          color: AppColors.COLOR_GREY,
                          fontSize: AppDimens.FONT_NORMAL_DIMENS,
                          letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(AppDimens.PADDING_COMFORT_DIMENS),
                      child: Text(
                        AppStrings.ADD_COLLECTION_DATE_LABEL,
                        style: TextStyle(
                          color: AppColors.COLOR_GREY,
                          fontWeight: FontWeight.bold,
                          fontSize: AppDimens.FONT_NORMAL_DIMENS,
                          letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(AppDimens.PADDING_COMFORT_DIMENS),
                      child: Text(
                        ": 15 September 2019",
                        style: TextStyle(
                          color: AppColors.COLOR_GREY,
                          fontSize: AppDimens.FONT_NORMAL_DIMENS,
                          letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ]),
                ],
              )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: AppDimens.PADDING_COMFORT_DIMENS),
            child: TextFormField(
              // Setting expecting text input for username
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              // Rest of input decoration will be automatically inherited from current theme
              decoration: InputDecoration(
                  // Label to input box
                  labelText: AppStrings.ADD_COLLECTION_AMOUNT_INPUT_LABEL,
                  // Hint to input box
                  hintText: AppStrings.ADD_COLLECTION_AMOUNT_INPUT_HINT,
                  suffixIcon: Icon(
                    Icons.attach_money,
                    color: AppColors.PRIMARY_COLOR,
                  )),
              style: TextStyle(
                fontSize: AppDimens.FONT_LARGE_DIMENS,
                fontWeight: FontWeight.bold,
                letterSpacing: AppDimens.LETTER_SPACE_LOOSE_COMFORT_DIMENS,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 54.0, right: 54.0),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: AppColors.ACCENT_COLOR,
                    offset: Offset(0, 8),
                    blurRadius: 16,
                    spreadRadius: -6)
              ]),
              child: RaisedButton(
                  child: Text(
                    AppStrings.ADD_COLLECTION_ADD_BTN_LABEL,
                    style: TextStyle(
                      fontSize: AppDimens.FONT_LARGE_BUTTON_DIMENS,
                      letterSpacing: AppDimens.LETTER_SPACE_LOOSE_COMFORT_DIMENS,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  elevation: 12.0,
                  splashColor: AppColors.ACCENT_COLOR_DARK,
                  onPressed: () {
                    showDialog<void>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            titlePadding: EdgeInsets.only(
                                top: 32.0, bottom: AppDimens.PADDING_LOOSE_DIMENS, left: AppDimens.PADDING_LOOSE_DIMENS),
                            contentPadding: EdgeInsets.all(0.0),
                            backgroundColor: AppColors.PRIMARY_COLOR_LIGHT,
                            title: Text(
                              AppStrings.ADD_COLLECTION_CONFIRM_DIALOG_TITLE,
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
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
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
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
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
                              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                              child: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Table(
                                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                      columnWidths: {
                                        1: FractionColumnWidth(0.40),
                                      },
                                      children: [
                                        TableRow(children: [
                                          Padding(
                                            padding: EdgeInsets.all(AppDimens.PADDING_COMFORT_DIMENS),
                                            child: Text(
                                              AppStrings.ADD_COLLECTION_CONFIRM_DIALOG_CURRENT_BALANCE_LABEL,
                                              style: TextStyle(
                                                color: AppColors.PRIMARY_COLOR,
                                                fontSize: AppDimens.FONT_NORMAL_DIMENS,
                                                letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(AppDimens.PADDING_COMFORT_DIMENS),
                                            child: Text(
                                              "xxxxxxxxx",
                                              style: TextStyle(
                                                color: AppColors.ACCENT_COLOR_DARK,
                                                fontSize: AppDimens.FONT_NORMAL_DIMENS,
                                                letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        ]),
                                        TableRow(children: [
                                          Padding(
                                            padding: EdgeInsets.all(AppDimens.PADDING_COMFORT_DIMENS),
                                            child: Text(
                                              AppStrings.ADD_COLLECTION_CONFIRM_DIALOG_ADDED_AMOUNT_LABEL,
                                              style: TextStyle(
                                                color: AppColors.PRIMARY_COLOR,
                                                fontSize: AppDimens.FONT_NORMAL_DIMENS,
                                                letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(AppDimens.PADDING_COMFORT_DIMENS),
                                            child: Text(
                                              "+ xxxxx",
                                              style: TextStyle(
                                                color: AppColors.ACCENT_COLOR_DARK,
                                                fontSize: AppDimens.FONT_NORMAL_DIMENS,
                                                letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        ]),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                        color: AppColors.PRIMARY_COLOR,
                                        shape: BoxShape.rectangle,
                                      ),
                                    ),
                                    Table(
                                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                      columnWidths: {
                                        1: FractionColumnWidth(0.40),
                                      },
                                      children: [
                                        TableRow(children: [
                                          Padding(
                                            padding: EdgeInsets.all(AppDimens.PADDING_COMFORT_DIMENS),
                                            child: Text(
                                              AppStrings.ADD_COLLECTION_CONFIRM_DIALOG_NEW_BALANCE_LABEL,
                                              style: TextStyle(
                                                color: AppColors.PRIMARY_COLOR,
                                                fontSize: AppDimens.FONT_NORMAL_DIMENS,
                                                letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(AppDimens.PADDING_COMFORT_DIMENS),
                                            child: Text(
                                              "xxxxxxxxx",
                                              style: TextStyle(
                                                color: AppColors.ACCENT_COLOR_DARK,
                                                fontSize: AppDimens.FONT_NORMAL_DIMENS,
                                                letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        ]),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }),
            ),
          )
        ],
      ),
    );
  }
}
