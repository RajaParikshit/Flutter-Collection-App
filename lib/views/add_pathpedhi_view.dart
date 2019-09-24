import 'dart:async';

import 'package:collection_app/app/app.dart';
import 'package:collection_app/app/app_routes.dart';
import 'package:collection_app/components/activity.dart';
import 'package:collection_app/components/app_alert_dialog.dart';
import 'package:collection_app/resource/values/app_colors.dart';
import 'package:collection_app/resource/values/app_dimens.dart';
import 'package:collection_app/resource/values/app_strings.dart';
import 'package:collection_app/view_models/add_pathpedhi_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddPathpedhiView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddPathpedhiViewState();
  }
}

class _AddPathpedhiViewState extends State<AddPathpedhiView> {

  AddPathpedhiViewModel _addPathpedhiViewModel;

  @override
  void initState() {

    _addPathpedhiViewModel = AddPathpedhiViewModel(App());

    _subscribeToViewModel();

    super.initState();
  }

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
            child: StreamBuilder<String>(
              stream: _addPathpedhiViewModel.getAddPathpedhiFormObserver().nameErrorText,
              builder: (context, snapshot){
                return TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _addPathpedhiViewModel.nameController,
                  decoration: InputDecoration(
                    labelText: AppStrings.ADD_PATHPEDHI_NAME_LABEL,
                    hintText: AppStrings.ADD_PATHPEDHI_NAME_HINT,
                    errorText: snapshot.data,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppDimens.PADDING_LOOSE_DIMENS),
            child: StreamBuilder<String>(
              stream: _addPathpedhiViewModel.getAddPathpedhiFormObserver().address1ErrorText,
              builder: (context, snapshot){
                return TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _addPathpedhiViewModel.address1Controller,
                  decoration: InputDecoration(
                    labelText: AppStrings.ADD_PATHPEDHI_ADDRESS1_LABEL,
                    hintText: AppStrings.ADD_PATHPEDHI_ADDRESS1_HINT,
                    errorText: snapshot.data,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppDimens.PADDING_COMFORT_DIMENS),
            child: StreamBuilder<String>(
              stream: _addPathpedhiViewModel.getAddPathpedhiFormObserver().address2ErrorText,
              builder: (context, snapshot){
                return TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _addPathpedhiViewModel.address2Controller,
                  decoration: InputDecoration(
                    labelText: AppStrings.ADD_PATHPEDHI_ADDRESS2_LABEL,
                    hintText: AppStrings.ADD_PATHPEDHI_ADDRESS2_HINT,
                    errorText: snapshot.data,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppDimens.PADDING_LOOSE_DIMENS),
            child: StreamBuilder<String>(
              stream: _addPathpedhiViewModel.getAddPathpedhiFormObserver().address3ErrorText,
              builder: (context, snapshot){
                return TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _addPathpedhiViewModel.address3Controller,
                  decoration: InputDecoration(
                    labelText: AppStrings.ADD_PATHPEDHI_ADDRESS3_LABEL,
                    hintText: AppStrings.ADD_PATHPEDHI_ADDRESS3_HINT,
                    errorText: snapshot.data,
                  ),
                );
              },
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
                    child: StreamBuilder<String>(
                      stream: _addPathpedhiViewModel.getAddPathpedhiFormObserver().pinErrorText,
                      builder: (context, snapshot){
                        return TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _addPathpedhiViewModel.pinController,
                          maxLength: 6,
                          decoration: InputDecoration(
                            labelText: AppStrings.ADD_PATHPEDHI_PIN_LABEL,
                            hintText: AppStrings.ADD_PATHPEDHI_PIN_HINT,
                            errorText: snapshot.data,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 50,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: AppDimens.PADDING_TIGHT_DIMENS),
                    child: StreamBuilder<String>(
                      stream: _addPathpedhiViewModel.getAddPathpedhiFormObserver().phoneErrorText,
                      builder: (context, snapshot){
                        return TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: _addPathpedhiViewModel.phoneController,
                          maxLength: 12,
                          decoration: InputDecoration(
                            labelText: AppStrings.ADD_PATHPEDHI_PHONE_LABEL,
                            hintText: AppStrings.ADD_PATHPEDHI_PHONE_HINT,
                            errorText: snapshot.data,
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          StreamBuilder<bool>(
            stream: _addPathpedhiViewModel.isLoading(),
            builder: (context, snapshot){
              return snapshot.data ?? false
              ?
              Padding(
                padding: EdgeInsets.only(top: 36.0),
                // Using LinearProgressIndicator
                child: const LinearProgressIndicator(
                  backgroundColor: AppColors.PRIMARY_COLOR,
                ),
              )
              :
              Padding(
                  padding: EdgeInsets.only(top: 32.0, left: 54.0, right: 54.0),
                  child: StreamBuilder<bool>(
                    stream: _addPathpedhiViewModel.getAddPathpedhiFormObserver().isAddPathpedhiEnabled,
                    builder: (context, builder){
                      return RaisedButton(
                        child: Text(
                          AppStrings.ADD_PATHPEDHI_ADD_BUTTON_LABEL,
                          style: TextStyle(
                            fontSize: AppDimens.FONT_LARGE_BUTTON_DIMENS,
                            letterSpacing: AppDimens.LETTER_SPACE_LOOSE_COMFORT_DIMENS,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        elevation: 12.0,
                        splashColor: AppColors.ACCENT_COLOR_DARK,
                        onPressed: snapshot.data ?? false
                        ? (){
                          _addPathpedhiViewModel.addPathpedhi();
                        }
                        :
                        null,
                      );
                    },
                  )
              );
            },
          )
        ],
      ),
      onPop: (){
        _addPathpedhiViewModel.onExit();
      },
    );
  }

  void _subscribeToViewModel(){
    _addPathpedhiViewModel.onSuccessfulAddPathpedhi().listen((_){
      setState(() {
        Timer(
            const Duration(milliseconds: 500),
                () => Navigator.pushReplacementNamed(
                context, AppRoutes.APP_ROUTE_DASHBOARD));
      });
      _addPathpedhiViewModel.dispose();
    });

    _addPathpedhiViewModel.onCanExit().listen((canExit){

      if (canExit){
        setState(() {
          Navigator.of(context).pop(true);
        });
        _addPathpedhiViewModel.dispose();
      }
      else{
        showDialog<void>(
            context: context,
            builder: (BuildContext dialogContext){
              return AppAlertDialog(
                  title: "Are you sure ?",
                  content: Text(
                      "Are you sure you want exit ?"
                  ),
                  onReject:(){
                    Navigator.of(dialogContext).pop(false);
                  },
                  onAccept: (){
                    Navigator.of(dialogContext).pop(true);
                    setState(() {
                      Navigator.of(context).pop(true);
                    });
                    _addPathpedhiViewModel.dispose();
                  });
            }
        );
      }

    });

  }

}
