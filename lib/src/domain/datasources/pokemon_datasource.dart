import 'package:myapp/src/domain/entities/pokemon.dart';

abstract class PokemonDatasource{
  Future<List<Pokemon>> fetchPokemons();

}
