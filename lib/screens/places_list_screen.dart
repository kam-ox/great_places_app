import 'package:flutter/material.dart';
import 'package:great_places_app/providers/great_places.dart';
import 'package:great_places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<GreatPlaces>(
        child: Center(
          child: const Text('No places'),
        ),
        builder: (ctx, greatPlaces, child) => greatPlaces.items.length <= 0
            ? child
            : ListView.builder(
                itemCount: greatPlaces.items.length,
                itemBuilder: (ctx, i) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(greatPlaces.items[i].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      // FileImage(greatPlaces.items[i].image),
                    ),
                    title: Text(greatPlaces.items[i].title),
                    onTap: () {
                      // ...
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
