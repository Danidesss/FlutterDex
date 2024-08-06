import 'package:myapp/src/domain/entities/pokemon.dart';
import 'package:myapp/src/infrastructure/datasources/mock_pokemons_datasource_impl.dart';
import 'package:myapp/src/infrastructure/repositories/pokemon_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pokemons_providers.g.dart';

@Riverpod(keepAlive: true)
Future<List<Pokemon>> pokemons(PokemonsRef ref) async {
  final repository = await ref.watch(pokemonsRepositoryProvider.future);
  final pokemons = await repository.getPokemons();
  return pokemons;
}

@Riverpod(keepAlive: true)
Future<PokemonRepositoryImpl> pokemonsRepository(
    PokemonsRepositoryRef ref) async {
  return PokemonRepositoryImpl(datasource: MockPokemonsDatasourceImpl());
}
