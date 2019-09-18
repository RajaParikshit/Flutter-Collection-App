import 'package:collection_app/app/app_routes.dart';
import 'package:collection_app/components/activity.dart';
import 'package:collection_app/components/client_list_item.dart';
import 'package:collection_app/resource/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClientListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ClientListViewState();
}

class _ClientListViewState extends State<ClientListView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Activity(
      title: AppStrings.CLIENT_LIST_TITLE,
      body: ListView.builder(
        padding: EdgeInsets.only(top: 48.0),
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ClientListItem(
            clientName: "Client Name $index",
            clientAccountNo: "Client Accont No",
            onPress: (){
              Navigator.pushNamed(context, AppRoutes.APP_ROUTE_ADD_COLLECTION);
            },
          );
        },
        itemCount: 30,
      ),
    );
  }
}
