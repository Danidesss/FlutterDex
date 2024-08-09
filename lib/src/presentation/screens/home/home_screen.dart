import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/src/presentation/providers/pokemons_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: const Text('Flutter Dex App')),
        body: Stack(
          children: [
            const PokedexBackground(),
            IndexedStack(
              index: ref.watch(pokedexIndexProvider),
              children: const [
                PokedexListPanel(),
                PokedexDetailedPanel(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PokedexBackground extends StatelessWidget {
  const PokedexBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset('assets/Pokedex_Interface.png', fit: BoxFit.cover),
    );
  }
}

class PokedexListPanel extends ConsumerWidget {
  const PokedexListPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemons = ref.watch(pokemonsProvider);

    return Center(
      child: Container(
          margin: const EdgeInsets.only(bottom: 50),
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Center(
            child: pokemons.when(
              data: (pokemonsList) => ListView.builder(
                itemCount: pokemonsList.length,
                itemBuilder: (context, index) {
                  final pokemon = pokemonsList[index];
                  return ListTile(
                    leading: Image.network(
                      pokemon.imageUrl,
                      width: 100,
                      height: 100,
                    ),
                    title: Text(pokemon.name),
                    onTap: () {
                      ref.read(pokeballProvider.notifier).catchPokemon(pokemon);
                      ref.read(pokedexIndexProvider.notifier).changeIndex(1);
                    },
                  );
                },
              ),
              error: (_, __) => const Text('Error'),
              loading: () => const CircularProgressIndicator(),
            ),
          )),
    );
  }
}


class PokedexDetailedPanel extends ConsumerWidget {
  const PokedexDetailedPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPokemon = ref.watch(pokeballProvider);

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 50),
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: Column(
                children: [
                  Image.network(
                    selectedPokemon.imageUrl, fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                  ),
                  
                  Text(
                    selectedPokemon.name,
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text('Pokemon Id:  ${selectedPokemon.id}'),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 10,
            child: FloatingActionButton(
              child: const Icon(Icons.arrow_back),
              onPressed: () {
                ref.read(pokedexIndexProvider.notifier).changeIndex(0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
