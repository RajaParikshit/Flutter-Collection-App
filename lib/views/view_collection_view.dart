import 'package:collection_app/app/app.dart';
import 'package:collection_app/components/activity.dart';
import 'package:collection_app/components/collection_history_item.dart';
import 'package:collection_app/components/date_time.dart';
import 'package:collection_app/databases/entity/client_collection_entity.dart';
import 'package:collection_app/models/client_model.dart';
import 'package:collection_app/resource/values/app_colors.dart';
import 'package:collection_app/resource/values/app_dimens.dart';
import 'package:collection_app/resource/values/app_strings.dart';
import 'package:collection_app/view_models/view_collection_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ViewCollectionView extends StatefulWidget {

  final ClientModel clientModel;

  ViewCollectionView({Key key, @required this.clientModel}):super(key:key);

  @override
  State<StatefulWidget> createState() => _ViewCollectionViewState();
}

class _ViewCollectionViewState extends State<ViewCollectionView> {

  ViewCollectionViewModel _viewCollectionViewModel;

  @override
  void initState() {
    _viewCollectionViewModel = ViewCollectionViewModel(app:App(), client: widget.clientModel);
    _viewCollectionViewModel.requestClientCollectionList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Activity(
      title: AppStrings.VIEW_COLLECTION_TITLE,
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: AppDimens.PADDING_LOOSE_COMFORT_DIMENS, right: AppDimens.PADDING_LOOSE_COMFORT_DIMENS, top: 48.0),
        children: <Widget>[
          Text(
            _viewCollectionViewModel.client.balance.toString(),
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
              AppStrings.VIEW_COLLECTION_CURRENT_BALANCE_LABEL,
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
                        AppStrings.VIEW_COLLECTION_ACCOUNT_NO_LABEL,
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
                        ": "+ _viewCollectionViewModel.client.accountNumber,
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
                        AppStrings.VIEW_COLLECTION_CLIENT_NAME_LABEL,
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
                        ": "+ _viewCollectionViewModel.client.name,
                        style: TextStyle(
                          color: AppColors.COLOR_GREY,
                          fontSize: AppDimens.FONT_NORMAL_DIMENS,
                          letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ])
                ],
              )),
          Padding(
            padding: EdgeInsets.only(top: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: DateField(
                    labelText: AppStrings.VIEW_COLLECTION_START_DATE_INPUT_LABEL,
                    initialDate: _viewCollectionViewModel.startDate,
                    onDateChanged: (newDate) {
                      setState(() {
                        _viewCollectionViewModel.onStartDateChanged(newDate);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimens.PADDING_TIGHT_COMFORT_DIMENS),
                  child: Icon(
                    Icons.compare_arrows,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                ),
                Flexible(
                  child: DateField(
                    labelText: AppStrings.VIEW_COLLECTION_END_DATE_INPUT_LABEL,
                    initialDate: _viewCollectionViewModel.endDate,
                    onDateChanged: (newDate) {
                      setState(() {
                        _viewCollectionViewModel.onEndDateChanged(newDate);
                      });
                    },
                  ),
                ),
              ],
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
                        flex: 50,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.PRIMARY_COLOR,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32.0)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppDimens.PADDING_LOOSE_COMFORT_DIMENS),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  AppStrings.VIEW_COLLECTION_COLLECTION_LIST_DATE_LABEL,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
                                      fontSize: AppDimens.FONT_TITLE_DIMENS,
                                      color: AppColors.COLOR_WHITE),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 50,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.ACCENT_COLOR_DARK,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(4.0)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppDimens.PADDING_LOOSE_COMFORT_DIMENS,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  AppStrings.VIEW_COLLECTION_COLLECTION_LIST_AMOUNT_LABEL,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: AppDimens.LETTER_SPACE_COMFORT_DIMENS,
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
                  StreamBuilder<List<ClientCollectionEntity>>(
                    stream: _viewCollectionViewModel.getClientCollectionList(),
                    builder: (context, snapshot){
                      if (snapshot.data == null || snapshot.data.length == 0){
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.all(AppDimens.PADDING_LOOSE_DIMENS),
                            child:Text("No client collection found"),
                          )
                        );
                      }else{
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.all(AppDimens.PADDING_LOOSE_COMFORT_DIMENS),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CollectionHistoryItem(
                              dateORname: DateFormat.yMMMd().format(
                                  DateTime.fromMillisecondsSinceEpoch(snapshot.data[index].date)),
                              amount: snapshot.data[index].amount.toString(),
                            );
                          },
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
      onPop: (){
        _viewCollectionViewModel.dispose();
        Navigator.pop(context);
      },
    );
  }
}
