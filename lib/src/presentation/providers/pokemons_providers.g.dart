// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonsHash() => r'5ec2740bbccdd3d09c123dba54ddc901d078d5be';

/// See also [pokemons].
@ProviderFor(pokemons)
final pokemonsProvider = FutureProvider<List<Pokemon>>.internal(
  pokemons,
  name: r'pokemonsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pokemonsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PokemonsRef = FutureProviderRef<List<Pokemon>>;
String _$pokemonsRepositoryHash() =>
    r'568e7b9224117e365f363438483fea65d2a23ec6';

/// See also [pokemonsRepository].
@ProviderFor(pokemonsRepository)
final pokemonsRepositoryProvider =
    FutureProvider<PokemonRepositoryImpl>.internal(
  pokemonsRepository,
  name: r'pokemonsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pokemonsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PokemonsRepositoryRef = FutureProviderRef<PokemonRepositoryImpl>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
