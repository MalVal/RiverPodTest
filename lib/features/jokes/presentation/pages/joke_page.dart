import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/joke_provider.dart';
import '../widgets/joke_card.dart';

class JokePage extends ConsumerWidget {
  const JokePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final joke = ref.watch(randomJokeProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Random Joke'),
        ),
        body: Stack(children: [
          joke.when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) => Center(
              child: Text('Erreur : $error'),
            ),
            data: (joke) => JokeCard(joke: joke),
          ),
          Positioned(
            bottom: 20,
            child: ElevatedButton(
              onPressed: () {
                ref.invalidate(randomJokeProvider);
              },
              child: const Text('Get another joke'),
            ),
          )
        ])
    );
  }
}
