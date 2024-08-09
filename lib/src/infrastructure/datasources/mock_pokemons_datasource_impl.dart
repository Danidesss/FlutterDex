import 'package:myapp/src/domain/datasources/pokemon_datasource.dart';
import 'package:myapp/src/domain/entities/pokemon.dart';

final List<Pokemon> mockPokemons = [
  Pokemon(name: 'Ditto', imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png', id: 132,),
  Pokemon(name: 'Bulbasaur', imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png', id: 1,),
  Pokemon(name: 'Charmander', imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png', id: 4,),
  Pokemon(name: 'Pikachu', imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png', id: 25,),
  Pokemon(name: 'Ratata', imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/19.png', id: 19,),
  Pokemon(name: 'Squirtle', imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png', id: 7,),
  



];
class MockPokemonsDatasourceImpl extends PokemonDatasource{
  final durationLoading = const Duration(seconds: 0);


  @override
  Future<List<Pokemon>> fetchPokemons() async {
    await Future.delayed(durationLoading);
    return mockPokemons;
  }

}
