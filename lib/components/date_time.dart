import 'dart:async';

import 'package:collection_app/resource/values/app_colors.dart';
import 'package:collection_app/resource/values/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatelessWidget {
  final String labelText;
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateChanged;

  const DateField(
      {Key key,
      @required this.labelText,
      @required this.initialDate,
      @required this.onDateChanged
      })
      : super(key: key);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1970, 8),
        lastDate: new DateTime(2101));
    if (picked != null && picked != initialDate) onDateChanged(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(data: Theme.of(context).copyWith(
      brightness: Brightness.light,
      primaryColor: AppColors.PRIMARY_COLOR,
      accentColor: AppColors.ACCENT_COLOR,
    ), child: Builder(builder: (context){
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Expanded(
            flex: 4,
            child: new _InputDropdown(
              labelText: labelText,
              valueText: DateFormat.yMMMd().format(initialDate),
              valueStyle: TextStyle(
                letterSpacing: 1.5,
                fontSize: AppDimens.FONT_NORMAL_DIMENS,
                fontWeight: FontWeight.bold,
            ),
              onPressed: () {
                _selectDate(context);
              },
            ),
          ),
        ],
      );
    }));
  }
}

class _InputDropdown extends StatelessWidget {
  const _InputDropdown(
      {Key key,
      this.child,
      this.labelText,
      this.valueText,
      this.valueStyle,
      this.onPressed})
      : super(key: key);

  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: InputDecorator(
        decoration: InputDecoration(
            labelText: labelText,
            hintText: "Select Date",
            suffixIcon: Icon(
              Icons.today,
              color: AppColors.PRIMARY_COLOR,
            )),
        baseStyle: valueStyle,
        child: Text(
          valueText,
          style: valueStyle,
        ),
      ),
    );
  }
}
