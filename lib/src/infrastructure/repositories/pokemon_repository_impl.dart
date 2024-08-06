import 'package:myapp/src/domain/datasources/pokemon_datasource.dart';
import 'package:myapp/src/domain/entities/pokemon.dart';
import 'package:myapp/src/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonDatasource datasource;

  PokemonRepositoryImpl({required this.datasource});

  @override
  Future<List<Pokemon>> getPokemons() {
    return datasource.fetchPokemons();
  }
}
