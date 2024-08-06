import 'package:myapp/src/domain/entities/pokemon.dart';

abstract class PokemonRepository{
  Future<List<Pokemon>> getPokemons();

}
