import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/src/presentation/providers/pokemons_providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: const Text('Flutter Dex App')),
        body: Stack(
          children: [
            PokedexBackground(),
            PokedexPanel(),
          ],
        ),
      ),
    );
  }
}

class HomeScreenList extends StatelessWidget {
  const HomeScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
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

class PokedexPanel extends ConsumerWidget {
  const PokedexPanel({super.key});

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
                    leading: Image.network(pokemon.imageUrl,width: 100,height: 100,),
                    title: Text(pokemon.name),
                  );
                },
              ),
              error: (_,__) => const Text('Error'),
              loading: () => const CircularProgressIndicator(),
            ),
          )),
    );
  }
}
