import 'dart:async';

import 'package:collection_app/app/app.dart';
import 'package:collection_app/app/app_routes.dart';
import 'package:collection_app/resource/values/app_colors.dart';
import 'package:collection_app/resource/values/app_strings.dart';
import 'package:collection_app/view_models/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<LoginView> {
  // Login ViewModel variable
  LoginViewModel _viewModel;

  // Toggle variable for password visibility
  bool _passwordVisible;

  // Ratio variable to determine height of main flex
  int _mainFlexSize = 55;

  @override
  void initState() {
    // Initialize view-model variable
    _viewModel = LoginViewModel(App());

    // Method to subscribe event of view-model
    subscribeToViewModel();

    // Initially password is obscured
    _passwordVisible = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Material Scaffold Widget
    return Scaffold(
      // Main background color
      backgroundColor: Theme.of(context).primaryColor,
      // Using SafeArea Widget to avoid inconsistency in device with Notch
      body: SafeArea(
        // Using Column to vertically aligned children widget
        child: Column(
          children: <Widget>[
            // Here we are using two Expanded widget to divide screen into two parts by ratio

            // Flex Expanded widget to hold app logo and name
            Expanded(
              // This variable will set ratio for height of this widget
              flex: _mainFlexSize,
              child: Column(
                // Logo and App-Name will be in center of widget
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Setting Logo
                  Image.asset(
                    'images/logo_big.png',
                    width: 180,
                    height: 180,
                  ),
                  // Giving Padding to App-Name
                  Padding(
                    padding: EdgeInsets.all(24),
                    // Setting App-Name
                    child: Text(
                      AppStrings.APP_NAME,
                      // Setting text color
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.5,
                        fontSize: 32.0,
                        color: AppColors.COLOR_WHITE,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Flex expanded widget to hold log in process widgets
            Expanded(
              // Flex size will be determine as Rest of height of mainFlex
              flex: 100 - _mainFlexSize,
              // Using container to create custom background
              child: Container(
                // Using BoxDecoration widget to for rounded corners and white background
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4)),
                ),

                // ListView widget to hold all log-in process widgets
                child: ListView(
                  // Setting vertical padding to children widgets
                  padding: EdgeInsets.symmetric(vertical: 36.0),
                  children: <Widget>[
                    // StreamBuilder widget to listen to stream of 'userIDErrorText'
                    StreamBuilder<String>(
                      // Subscribing to userNameErrorText stream
                      stream:
                          _viewModel.getLoginFormObserver().userIDErrorText,
                      // Building child widget with current 'context' and stream 'snapshot' data
                      builder: (context, snapshot) {
                        // Widget with horizontal padding
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),

                          // TextFormField widget for user_id input
                          child: TextFormField(
                            // Setting expecting text input for username
                            keyboardType: TextInputType.text,
                            // Setting username controller
                            controller: _viewModel.userIDController,
                            // Rest of input decoration will be automatically inherited from current theme
                            decoration: InputDecoration(
                              // Label to input box
                              labelText: AppStrings.LOGIN_USER_ID_LABEL,
                              // Hint to input box
                              hintText: AppStrings.LOGIN_USER_ID_HINT,
                              // Error message => NULL -> No error shown Otherwise Error shown with snapshot.data
                              errorText: snapshot.data,
                            ),
                          ),
                        );
                      },
                    ),

                    // StreamBuilder widget to listen to stream of 'userPasswordErrorText'
                    StreamBuilder<String>(
                      // Subscribing to userPasswordErrorText stream
                      stream: _viewModel
                          .getLoginFormObserver()
                          .userPasswordErrorText,
                      // Building child widget with current 'context' and stream 'snapshot' data
                      builder: (context, snapshot) {
                        // Widget with horizontal padding
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),

                          // TextFormField widget for password input
                          child: TextFormField(
                            // Setting expecting text input for username
                            keyboardType: TextInputType.text,
                            // Setting userPasswordController
                            controller: _viewModel.userPasswordController,
                            // This will obscure password text based on state of passwordVisible variable
                            obscureText: !_passwordVisible,
                            // Rest of input decoration will be automatically inherited from current theme
                            decoration: InputDecoration(
                              // Label of input text
                              labelText: AppStrings.LOGIN_USER_PASSWORD_LABEL,
                              // Hint of input text
                              hintText: AppStrings.LOGIN_USER_PASSWORD_HINT,
                              // Error message => NULL -> No error shown Otherwise Error shown with snapshot.data
                              errorText: snapshot.data,
                              // Suffix icon for password toggle button
                              suffixIcon: IconButton(
                                // Setting Icon widget
                                icon: Icon(
                                  // Setting toggle icons based on state of passwordVisible variable
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColors.PRIMARY_COLOR,
                                ),
                                onPressed: () {
                                  // On pressed toggle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    // Based on state of isLoading variable i.e. TRUE -> Show progress indicator; FALSE -> Show button bar for login and reset button
                    StreamBuilder<bool>(
                      stream: _viewModel.isLoading(),
                      builder: (context, snapshot){
                        return snapshot.data ?? false
                            ? // Here we have used conditional operator
                        // Loading
                        // Padding widget for setting top padding to progress indicator
                        Padding(
                          padding: EdgeInsets.only(top: 36.0),
                          // Using LinearProgressIndicator
                          child: const LinearProgressIndicator(
                            backgroundColor: AppColors.PRIMARY_COLOR,
                          ),
                        )
                            :
                        // Not Loading
                        // ButtonBar widget to hold Reset and Login button
                        ButtonBar(
                          // Setting alignment to 'end'
                          alignment: MainAxisAlignment.end,
                          children: <Widget>[
                            // FlatButton widget for Reset button
                            FlatButton(
                              child: Text(
                                AppStrings.LOGIN_RESET_BUTTON_LABEL,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.PRIMARY_COLOR,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              onPressed: () {
                                // On Pressed make call to viewModel's resetCredentialsInput() method
                                _viewModel.resetCredentialsInput();
                              },
                            ),

                            // StreamBuilder widget to listen 'isLoginEnabled' stream
                            StreamBuilder(
                              // Subscribing to isLoginEnabled stream
                              stream: _viewModel
                                  .getLoginFormObserver()
                                  .isLoginEnabled,
                              // Building child widget with current 'context' and stream 'snapshot' data
                              builder: (context, snapshot) {
                                return RaisedButton(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
                                    child: Text(
                                      AppStrings.LOGIN_LOGIN_BUTTON_LABEL,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2.0,
                                      ),
                                    ),
                                  ),
                                  elevation: 6.0,
                                  animationDuration:
                                  Duration(milliseconds: 1500),
                                  onPressed: snapshot.data ??
                                      false // First we are checking if isLoginEnabled stream is NULL or not. If NULL then set it to FALSE
                                  // To enable or disable login button we are using this hack i.e. when isLoginEnabled gives FALSE value we are providing NULL
                                  // for onPressed function and hence button is disabled
                                      ? // Using conditional operator
                                  // isLoginEnabled is TRUE
                                      () {
                                    // Invoke view-model checkLogin method with userName and userPassword parameters
                                    _viewModel.checkLogin();
                                  }
                                      :
                                  // isLoggedIn is TRUE
                                  // Provide NULL to disable button
                                  null,
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Method to subscribing view model methods
  void subscribeToViewModel() {
    // Subscribe to getLoginResponse() method to listen log-in response
    _viewModel.onSuccessfulLogin().listen((_) {
      // Update state
      setState(() {
        Fluttertoast.showToast(msg: AppStrings.LOGIN_SUCCESSFUL_LOGIN_MSG);
        // Set mainFlex ratio size to full
        _mainFlexSize = 99;
        // Navigate to Dashboard with some delay for showing app logo
        Timer(
            const Duration(milliseconds: 500),
                () => Navigator.pushReplacementNamed(
                context, AppRoutes.APP_ROUTE_DASHBOARD));
      });
      _viewModel.dispose();
    });
  }
}
