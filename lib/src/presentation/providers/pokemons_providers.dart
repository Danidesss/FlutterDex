import 'package:myapp/src/domain/entities/pokemon.dart';
import 'package:myapp/src/infrastructure/datasources/mock_pokemons_datasource_impl.dart';
import 'package:myapp/src/infrastructure/repositories/pokemon_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pokemons_providers.g.dart';

//Future provider de lectura para traer los pokemons
@Riverpod(keepAlive: true)
Future<List<Pokemon>> pokemons(PokemonsRef ref) async {
  final repository = await ref.watch(pokemonsRepositoryProvider.future);
  final pokemons = await repository.getPokemons();
  return pokemons;
}

// Provider de solo lectura para traer el repository
@Riverpod(keepAlive: true)
Future<PokemonRepositoryImpl> pokemonsRepository(
    PokemonsRepositoryRef ref) async {
  return PokemonRepositoryImpl(datasource: MockPokemonsDatasourceImpl());
}

@Riverpod(keepAlive: true)
class Pokeball extends _$Pokeball {
  @override
  Pokemon build() => Pokemon(
        id: 0,
        name: '',
        imageUrl: '',
      );
  void catchPokemon(Pokemon pokemon) => state = pokemon;
 
}

@Riverpod(keepAlive: true)
class PokedexIndex extends _$PokedexIndex {
  @override
  int build() => 0;
  void changeIndex(int index) => state = index;
}
