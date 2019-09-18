import 'package:collection_app/app/app_routes.dart';
import 'package:collection_app/components/app_dialog.dart';
import 'package:collection_app/components/backdrop.dart';
import 'package:collection_app/components/dashboard_button.dart';
import 'package:collection_app/components/dashboard_item.dart';
import 'package:collection_app/components/settings_item.dart';
import 'package:collection_app/resource/values/app_colors.dart';
import 'package:collection_app/resource/values/app_strings.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DashboardState();
}

class DashboardState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _isSuperUser;

  @override
  void initState() {
    super.initState();
    _isSuperUser = true;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 450),
      value: 1.0,
    );
  }

  bool get _frontLayerVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Backdrop(
        frontLayer: FrontLayer(
            isSuperUser:_isSuperUser
        ),
        frontIcon: Image.asset(
          "images/logo_small.png",
          color: AppColors.COLOR_YELLOW,
        ),
        frontTitle: Text(AppStrings.APP_NAME),
        backLayer: BackLayer(),
        backIcon: Icon(
          Icons.settings,
          color: AppColors.COLOR_YELLOW,
          size: 32.0,
        ),
        backTitle: Text(AppStrings.SETTINGS_TITLE),
        titleStyle: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.power_settings_new,
                color: AppColors.PRIMARY_COLOR_LIGHT,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.APP_ROUTE_LOGIN);
              }),
          IconButton(
            icon: Icon(
              Icons.tune,
              color: AppColors.PRIMARY_COLOR_LIGHT,
            ),
            onPressed: () {
              setState(() {
                _frontLayerVisible
                    ? _controller.reverse()
                    : _controller.forward();
              });
            },
          )
        ],
        controller: _controller,
      ),
    );
  }
}

class FrontLayer extends StatelessWidget {

  final bool isSuperUser;

  FrontLayer({key, @required this.isSuperUser}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return isSuperUser ? ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 48.0, bottom: 16.0),
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        DashboardItem(
          imagePath: "images/view_collection.png",
          imageWidth: 100.0,
          label: AppStrings.DASHBOARD_ADD_PATHPEDHI_LABEL,
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.APP_ROUTE_ADD_PATHPEDHI);
          },
        ),
        DashboardItem(
          imagePath: "images/view_collection.png",
          imageWidth: 100.0,
          label: AppStrings.DASHBOARD_ADD_AGENT_LABEL,
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.APP_ROUTE_ADD_AGENT);
          },
        )
      ],
    ):ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 48.0, bottom: 16.0),
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              DashboardButton(
                buttonColor: AppColors.PRIMARY_COLOR_LIGHT,
                icon: Icons.cloud_download,
                iconColor: AppColors.PRIMARY_COLOR,
                label: AppStrings.DASHBOARD_IMPORT_BTN_LABEL,
                labelColor: AppColors.ACCENT_COLOR_DARK,
                onPress: () {
                  showDialog(
                      context: context,
                      builder: (_) => AppDialog(
                        title: AppStrings.DASHBOARD_IMPORT_DIALOG_LABEL,
                        titleColor: AppColors.ACCENT_COLOR_DARK,
                        backgroundColor: AppColors.PRIMARY_COLOR_LIGHT,
                        children: <Widget>[
                          AppDialogItem(
                            icon: Icons.insert_drive_file,
                            iconColor: AppColors.PRIMARY_COLOR,
                            label: AppStrings.DASHBOARD_IMPORT_DIALOG_FROM_LOCAL_FILE_LABEL,
                            labelColor: AppColors.ACCENT_COLOR_DARK,
                            onPress: () {},
                          ),
                          AppDialogItem(
                              icon: Icons.settings_remote,
                              iconColor: AppColors.PRIMARY_COLOR,
                              label: AppStrings.DASHBOARD_IMPORT_DIALOG_FROM_SERVER_LABEL,
                              labelColor: AppColors.ACCENT_COLOR_DARK,
                              onPress: () {}),
                        ],
                      ));
                },
              ),
              DashboardButton(
                buttonColor: AppColors.ACCENT_COLOR_DARK,
                icon: Icons.cloud_upload,
                iconColor: AppColors.ACCENT_COLOR,
                label: AppStrings.DASHBOARD_DEPOSIT_BTN_LABEL,
                labelColor: AppColors.PRIMARY_COLOR_LIGHT,
                onPress: () {
                  Navigator.pushNamed(context, AppRoutes.APP_ROUTE_DEPOSIT_COLLECTION);
                },
              ),
            ],
          ),
        ),
        DashboardItem(
          imagePath: "images/add_money.png",
          imageWidth: 100.0,
          label: AppStrings.DASHBOARD_ADD_COLLECTION_LABEL,
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.APP_ROUTE_CLIENT_LIST);
          },
        ),
        DashboardItem(
          imagePath: "images/view_collection.png",
          imageWidth: 110.0,
          label: AppStrings.DASHBOARD_VIEW_COLLECTION_LABEL,
          onPressed: () {},
        )
      ],
    );
  }
}

class BackLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0, bottom: 48.0),
        children: <Widget>[
          SettingsItem(
            settingItemIcon: Icons.alarm,
            settingItemLabel: AppStrings.SETTINGS_ALARM_TO_DEPOSIT_LABEL,
            onPressed: () {},
          ),
          SettingsItem(
            settingItemIcon: Icons.translate,
            settingItemLabel: AppStrings.SETTINGS_LANGUAGE_LABEL,
            onPressed: () {},
          ),
          SettingsItem(
            settingItemIcon: Icons.verified_user,
            settingItemLabel: AppStrings.SETTINGS_TWO_STEP_VERIFICATION_LABEL,
            onPressed: () {},
          ),
          SettingsItem(
            settingItemIcon: Icons.info,
            settingItemLabel: AppStrings.SETTINGS_APP_INFO_LABEL,
            onPressed: () {},
          )
        ],
      ),
      color: AppColors.PRIMARY_COLOR,
    );
  }
}
