import 'package:myapp/src/domain/datasources/pokemon_datasource.dart';
import 'package:myapp/src/domain/entities/pokemon.dart';

final List<Pokemon> mockPokemons = [
  Pokemon(name: 'Ditto', imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png', id: 1),
  Pokemon(name: 'Bulbasaur', imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png', id: 2),
  Pokemon(name: 'Charmander', imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png', id: 3),
  Pokemon(name: 'Pikachu', imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png', id: 4),
  Pokemon(name: 'Ratata', imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png', id: 5),
  Pokemon(name: 'Squirtle', imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png', id: 6),
  



];
class MockPokemonsDatasourceImpl extends PokemonDatasource{
  final durationLoading = const Duration(seconds: 0);


  @override
  Future<List<Pokemon>> fetchPokemons() async {
    await Future.delayed(durationLoading);
    return mockPokemons;
  }

}
