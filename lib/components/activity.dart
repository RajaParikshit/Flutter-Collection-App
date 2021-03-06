
import 'package:collection_app/resource/values/app_colors.dart';
import 'package:collection_app/resource/values/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Activity extends StatelessWidget{

  final String title;
  final Widget body;
  final List<Widget> actions;
  final VoidCallback onPop;

  const Activity({key,
  @required this.title, this.actions, @required this.body, this.onPop}
  ):super(key:key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: this.onPop,
      child: Scaffold(
        backgroundColor: AppColors.PRIMARY_COLOR,
        appBar: AppBar(
          backgroundColor: AppColors.PRIMARY_COLOR,
          title: Text(
            this.title,
            style: TextStyle(
              fontSize: AppDimens.FONT_HEADING_DIMENS,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: this.actions,
          titleSpacing: 0.0,
          elevation: 0.0,
        ),
        body: Container(
          // Using BoxDecoration widget to for rounded corners and white background
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(48),
                  topRight: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4)),
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(child: this.body)
                ],
              ),
            )
        ),
      ),
    );
  }

}