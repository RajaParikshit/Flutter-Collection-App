import 'dart:async';

import 'package:collection_app/app/app.dart';
import 'package:collection_app/app/app_routes.dart';
import 'package:collection_app/components/activity.dart';
import 'package:collection_app/components/app_alert_dialog.dart';
import 'package:collection_app/resource/values/app_colors.dart';
import 'package:collection_app/resource/values/app_dimens.dart';
import 'package:collection_app/resource/values/app_strings.dart';
import 'package:collection_app/view_models/add_agent_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddAgentView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AddAgentViewState();
  }

}

class _AddAgentViewState extends State<AddAgentView>{

  AddAgentViewModel _addAgentViewModel;
  bool _passwordVisible;

  @override
  void initState() {
    _addAgentViewModel = AddAgentViewModel(App());
    _passwordVisible = false;
    _subscribeToViewModel();
    super.initState();
  }

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
            child: StreamBuilder<String>(
              stream: _addAgentViewModel.getAddAgentFormObserver().agentCodeErrorText,
              builder: (context, snapshot){
                return TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _addAgentViewModel.agentCodeController,
                  decoration: InputDecoration(
                    labelText: AppStrings.ADD_AGENT_CODE_LABEL,
                    hintText: AppStrings.ADD_AGENT_CODE_HINT,
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
              stream: _addAgentViewModel.getAddAgentFormObserver().agentNameErrorText,
              builder: (context, snapshot){
                return TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _addAgentViewModel.agentNameController,
                  decoration: InputDecoration(
                    labelText: AppStrings.ADD_AGENT_NAME_LABEL,
                    hintText: AppStrings.ADD_AGENT_NAME_HINT,
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
              stream: _addAgentViewModel.getAddAgentFormObserver().agentPasswordErrorText,
              builder: (context, snapshot){
                return TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: !_passwordVisible,
                  controller: _addAgentViewModel.agentPasswordController,
                  decoration: InputDecoration(
                    labelText: AppStrings.ADD_AGENT_PASSWORD_LABEL,
                    hintText: AppStrings.ADD_AGENT_PASSWORD_HINT,
                    errorText: snapshot.data,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.PRIMARY_COLOR,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    )
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppDimens.PADDING_LOOSE_DIMENS),
            child: StreamBuilder<String>(
              stream: _addAgentViewModel.getAddAgentFormObserver().accountCodeErrorText,
              builder: (context, snapshot){
                return TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _addAgentViewModel.accountCodeController,
                  decoration: InputDecoration(
                    labelText: AppStrings.ADD_AGENT_ACCOUNT_CODE_LABEL,
                    hintText: AppStrings.ADD_AGENT_ACCOUNT_CODE_HINT,
                    errorText: snapshot.data,
                  ),
                );
              }
            ),
          ),
          StreamBuilder<bool>(
            stream: _addAgentViewModel.isLoading(),
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
                  stream: _addAgentViewModel.getAddAgentFormObserver().isAddAgentEnabled,
                  builder: (context, snapshot){
                    return RaisedButton(
                      child: Text(
                        AppStrings.ADD_AGENT_ADD_BUTTON_LABEL,
                        style: TextStyle(
                          fontSize: AppDimens.FONT_LARGE_BUTTON_DIMENS,
                          letterSpacing: AppDimens.LETTER_SPACE_LOOSE_COMFORT_DIMENS,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      elevation: 12.0,
                      splashColor: AppColors.ACCENT_COLOR_DARK,
                      onPressed: snapshot.data ?? false
                          ? () => _addAgentViewModel.addAgent()
                          : null,
                    );
                  },)
                  );
            },
          )
        ],
      ),
      onPop: (){
        _addAgentViewModel.onExit();
      },
    );
  }

  void _subscribeToViewModel(){
    _addAgentViewModel.onSuccessfulAddAgent().listen((_){
      setState(() {
        Timer(
            const Duration(milliseconds: 500),
                () => Navigator.pushReplacementNamed(
                context, AppRoutes.APP_ROUTE_DASHBOARD));
      });
      _addAgentViewModel.dispose();
    });

    _addAgentViewModel.onCanExit().listen((canExit){

      if (canExit){
        setState(() {
          Navigator.of(context).pop(true);
        });
        _addAgentViewModel.dispose();
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
                    _addAgentViewModel.dispose();
                  });
            }
          );
      }

    });

  }

}