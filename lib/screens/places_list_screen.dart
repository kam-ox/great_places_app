import 'package:flutter/material.dart';
import 'package:great_places_app/screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
