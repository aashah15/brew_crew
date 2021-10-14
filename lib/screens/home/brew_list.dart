import 'package:brew_crew/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'brew_tile.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  // late BrewsProvider brewsProvider;

  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>?>(context) ?? [];
    // brewsProvider = Provider.of(context);
    // final brews = brewsProvider.brewsList.map((e) {
    //   return Brew(name: e.name, strength: e.strength, sugars: e.sugars);
    // }).toList();
    // final brews = brewsProvider.forEach((brew) {
    //   print(brew.name);
    //   print(brew.sugars);
    //   print(brew.strength);
    // });

    //   print(brew.name);
    //   print(brew.sugars);
    //   print(brew.strength);
    // });
    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
