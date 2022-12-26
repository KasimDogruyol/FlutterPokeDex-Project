import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/widget/pokelist_items.dart';

import '../model/pokemon_model.dart';
import '../servises/pokedex_api.dart';

class PokemonList extends StatefulWidget{
   // ignore: prefer_const_constructors_in_immutables
   PokemonList({Key? key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList>{
  late Future<List<PokemonModel>>? _pokemonListFuture;

  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
  }


  @override
  Widget build(BuildContext context){
    return FutureBuilder<List<PokemonModel>>(
        future: _pokemonListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData){
            List<PokemonModel> _listem = snapshot.data!;
            return GridView.builder(
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: ScreenUtil().orientation == Orientation.portrait ? 2 : 3,
                // childAspectRatio: 1.5,
              ),
              itemCount: _listem.length,
              itemBuilder: (context, index) {
                var oankiPokemon = _listem[index];
                return PokeListItem(pokemon : oankiPokemon);
              },
            );

          }else if(snapshot.hasError){
            return const Center(
              child: Text('Hata çıktı'),
            );
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        } ,
      );
  }
}

// ListView.builder(
//               itemCount: _listem.length,
//               itemBuilder: (context, index) {
//                 var oankiPokemon = _listem[index];
//                 return PokeListItem(pokemon : oankiPokemon);
//               },
//             );