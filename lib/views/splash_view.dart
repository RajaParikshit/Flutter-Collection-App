import 'dart:async';
import 'package:collection_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:collection_app/app/app_routes.dart';

class SplashView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  var _iconAnimationController;
  var _iconAnimation;

  startTimeout() async {
    return Timer(const Duration(milliseconds: 1500), handleTimeout);
  }

  void handleTimeout()async {

    await App().getAppPreferences().isPreferenceReady;

    App().getAppDatabase().then((appDatabase){
      appDatabase.getDatabaseCreated().then((isCreated){
          if(isCreated){
            App().getAppPreferences().getLoggedIn().then((isLoggedIn) {
              isLoggedIn
                  ? Navigator.pushReplacementNamed(context, AppRoutes.APP_ROUTE_DASHBOARD)
                  : Navigator.pushReplacementNamed(context, AppRoutes.APP_ROUTE_LOGIN);
            });
          }
      });
    });


  }

  @override
  void initState() {
    super.initState();

    _iconAnimationController = AnimationController(duration: Duration(milliseconds: 1500), vsync: this);

    _iconAnimation = CurvedAnimation(parent: _iconAnimationController, curve: Curves.fastOutSlowIn);
    _iconAnimation.addListener(() => this.setState(() {}));

    _iconAnimationController.forward();

    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
          child: Image(
        image: AssetImage("images/logo_big.png"),
        width: _iconAnimation.value * 180,
        height: _iconAnimation.value * 180,
      )),
    );
  }
}
