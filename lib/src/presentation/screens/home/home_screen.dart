import 'package:flutter/material.dart';

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

class PokedexPanel extends StatelessWidget {
  const PokedexPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 50),
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.8,
        child: const Center(
          child: Text('pene'),
        ),
      ),
    );
  }
}
