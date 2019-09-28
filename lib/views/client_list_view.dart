import 'package:collection_app/app/app.dart';
import 'package:collection_app/app/app_routes.dart';
import 'package:collection_app/components/activity.dart';
import 'package:collection_app/components/client_list_item.dart';
import 'package:collection_app/databases/entity/client_entity.dart';
import 'package:collection_app/models/client_model.dart';
import 'package:collection_app/resource/values/app_colors.dart';
import 'package:collection_app/resource/values/app_dimens.dart';
import 'package:collection_app/resource/values/app_strings.dart';
import 'package:collection_app/view_models/client_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClientListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ClientListViewState();
}

class _ClientListViewState extends State<ClientListView>
    with SingleTickerProviderStateMixin {

  ClientListViewModel _clientListViewModel;

  @override
  void initState() {
    _clientListViewModel = ClientListViewModel(app: App());
    _clientListViewModel.requestClientsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Activity(
      title: AppStrings.CLIENT_LIST_TITLE,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: AppDimens.PADDING_LOOSE_DIMENS, right: AppDimens.PADDING_LOOSE_DIMENS, top: AppDimens.PADDING_LOOSE_DIMENS,
            bottom: AppDimens.PADDING_TIGHT_DIMENS),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Search client",
                  prefixIcon: Icon(Icons.search,
                  color: AppColors.ACCENT_COLOR_DARK,
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.arrow_drop_down,
                        color: AppColors.PRIMARY_COLOR,),
                      splashColor: AppColors.PRIMARY_COLOR,
                      onPressed: (){
                        Fluttertoast.showToast(msg: "Search Option");
                      })
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<ClientEntity>>(
              stream: _clientListViewModel.getClientsList(),
              builder: (context, snapshot){
                if (snapshot.data == null){
                  return Center(
                    child: Text("No clients found"),
                  );
                }else{
                  return ListView.builder(
                    padding: EdgeInsets.only(top: 16.0),
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ClientListItem(
                        clientName: snapshot.data[index].name,
                        clientAccountNo: snapshot.data[index].accountNumber,
                        onPress: (){
                          Navigator.pushNamed(context, AppRoutes.APP_ROUTE_ADD_COLLECTION, arguments: ClientModel(
                              name: snapshot.data[index].name,
                              accountNumber: snapshot.data[index].accountNumber,
                              balance: snapshot.data[index].balance,
                          ));
                        },
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
      onPop: (){
        _clientListViewModel.dispose();
        Navigator.pop(context);
      },
    );
  }
}
