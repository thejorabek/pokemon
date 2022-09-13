import 'dart:convert';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:dio/dio.dart';

class GetPokemonModel {
  static Future<PokemonModel> getData() async {
    Response res = await Dio().get('https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    return PokemonModel.fromJson(jsonDecode(res.data));
  }
}
