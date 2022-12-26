import 'package:flutter/material.dart';
import 'package:pokedex/widget/pokemon_list_widget.dart';

import '../model/pokemon_model.dart';
import '../servises/pokedex_api.dart';
import '../widget/app_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => 
         Column(
          children: [
            const AppTitle(),
             Expanded(child:   PokemonList()),
          ],
        ),
      ),
    );
  }
}