import 'package:collection_app/components/activity.dart';
import 'package:collection_app/components/app_dialog.dart';
import 'package:collection_app/components/collection_history_item.dart';
import 'package:collection_app/components/date_time.dart';
import 'package:collection_app/resource/values/app_colors.dart';
import 'package:collection_app/resource/values/app_dimens.dart';
import 'package:collection_app/resource/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DepositCollectionView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DepositCollectionState();
}

class _DepositCollectionState extends State<DepositCollectionView> {
  DateTime _collectionDate;

  @override
  void initState() {
    super.initState();
    _collectionDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Activity(
      title: AppStrings.DEPOSIT_COLLECTION_TITLE,
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
              AppStrings.DEPOSIT_COLLECTION_TOTAL_COLLECTION_LABEL,
              style: TextStyle(
                color: AppColors.PRIMARY_COLOR,
                fontWeight: FontWeight.bold,
                fontSize: AppDimens.FONT_MEDIUM_DIMENS,
                letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
            child: DateField(
              labelText: AppStrings.DEPOSIT_COLLECTION_DATE_LABEL,
              initialDate: _collectionDate,
              onDateChanged: (newDate) {
                setState(() {
                  _collectionDate = newDate;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0, left: 54.0, right: 54.0),
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
                    AppStrings.DEPOSIT_COLLECTION_DEPOSIT_BTN_LABEL,
                    style: TextStyle(
                      fontSize: AppDimens.FONT_LARGE_BUTTON_DIMENS,
                      letterSpacing: AppDimens.LETTER_SPACE_LOOSE_COMFORT_DIMENS,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  elevation: 12.0,
                  splashColor: AppColors.ACCENT_COLOR_DARK,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AppDialog(
                        title: AppStrings.DEPOSIT_COLLECTION_EXPORT_DIALOG_LABEL,
                        titleColor: AppColors.ACCENT_COLOR_DARK,
                        backgroundColor: AppColors.PRIMARY_COLOR_LIGHT,
                        children: <Widget>[
                          AppDialogItem(
                            icon: Icons.insert_drive_file,
                            iconColor: AppColors.PRIMARY_COLOR,
                            label: AppStrings.DEPOSIT_COLLECTION_EXPORT_TO_LOCAL_LABEL,
                            labelColor: AppColors.ACCENT_COLOR_DARK,
                            onPress: () {},
                          ),
                          AppDialogItem(
                              icon: Icons.settings_remote,
                              iconColor: AppColors.PRIMARY_COLOR,
                              label: AppStrings.DEPOSIT_COLLECTION_EXPORT_TO_SERVER_LABEL,
                              labelColor: AppColors.ACCENT_COLOR_DARK,
                              onPress: () {}),
                        ],
                      ));
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32.0),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.PRIMARY_COLOR_LIGHT,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(4.0),
                      bottomLeft: Radius.circular(4.0),
                      bottomRight: Radius.circular(4.0)),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.PRIMARY_COLOR_LIGHT,
                        offset: Offset(0, 16),
                        blurRadius: 32,
                        spreadRadius: -4)
                  ]),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 60,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.PRIMARY_COLOR,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32.0)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppDimens.PADDING_LOOSE_COMFORT_DIMENS,
                                horizontal: AppDimens.PADDING_COMFORT_DIMENS),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  AppStrings.DEPOSIT_COLLECTION_COLLECTION_LIST_CLIENT_NAME_LABEL,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: AppDimens.LETTER_SPACE_LOOSE_COMFORT_DIMENS,
                                      fontSize: AppDimens.FONT_TITLE_DIMENS,
                                      color: AppColors.COLOR_WHITE),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 40,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.ACCENT_COLOR_DARK,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(4.0)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppDimens.PADDING_LOOSE_COMFORT_DIMENS,
                                horizontal: AppDimens.PADDING_COMFORT_DIMENS),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  AppStrings.DEPOSIT_COLLECTION_COLLECTION_LIST_AMOUNT_LABEL,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: AppDimens.LETTER_SPACE_LOOSE_COMFORT_DIMENS,
                                      fontSize: AppDimens.FONT_TITLE_DIMENS,
                                      color: AppColors.ACCENT_COLOR),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(AppDimens.PADDING_LOOSE_COMFORT_DIMENS),
                    itemBuilder: (BuildContext context, int index) {
                      return CollectionHistoryItem(
                        dateORname: "xxxxxxx xxxxxxxx",
                        amount: "xxx.xx \$",
                      );
                    },
                    itemCount: 15,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
