import 'package:flutter/material.dart';

import 'package:lawyer_app/windows/window_list.dart' as window_list;

/// Main Welcome Page
/// Consists of Images and a Search box to select District
/// When searched this will direct users to [window_list.LawyerListPage]
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new _WelcomeContent(),
    );
  }
}

/// All content of [WelcomePage]
/// Contains
/// * Header - Image
/// * Center - Area with background image with search box
class _WelcomeContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _WelcomeContentState();
}

/// [State] of [_WelcomeContent]
class _WelcomeContentState extends State<_WelcomeContent> {
  final String _selectedDistrict = "Anuradhapura";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildHeaderContent(context),
        new Expanded(
          child: _buildCenterContent(context),
        ),
      ],
    );
  }

  /// Image
  /// TODO: Add a more beautiful Image
  Widget _buildHeaderContent(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(top: 30.0),
      color: Colors.black,
      child: new Image.asset(
        "images/background.jpg",
        fit: BoxFit.fitWidth,
      ),
    );
  }

  /// Central part Image
  /// Consist of SearchBox and SearchButton
  /// TODO: Add a more beautiful Image
  Widget _buildCenterContent(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("images/background_behind.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildSearchLabel(context),
              _buildDistrictField(context),
              _buildSearchButton(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Search Button Layout
  Widget _buildSearchButton(BuildContext context) {
    return new Container(
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.all(8.0),
      child: new RaisedButton(
        shape: new StadiumBorder(),
        color: Theme.of(context).primaryColor,
        textColor: Theme.of(context).canvasColor,
        child: new Text("Serach"),
        onPressed: _handleSearchPressed,
      ),
    );
  }

  /// Search Button Event
  /// Will Slide Transit into [window_list.LawyerListPage]
  void _handleSearchPressed() {
    Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false,
            pageBuilder: (_, __, ___) => new window_list.LawyerListPage(
                  district: _selectedDistrict,
                ),
            transitionsBuilder:
                (_, Animation<double> animation, __, Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          ),
        );
  }

  /// Search Field Layout
  /// TODO: Add an Action to Select a district
  Widget _buildDistrictField(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: new RaisedButton(
        child: new Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          child: new Text(_selectedDistrict),
        ),
        onPressed: () => null,
      ),
    );
  }

  /// Search Label Layout
  Widget _buildSearchLabel(BuildContext context) {
    return new Container(
      child: new Text(
        "Select District",
        style: new TextStyle(
          fontWeight: FontWeight.w900,
          letterSpacing: 1.0,
        ),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(8.0),
    );
  }
}