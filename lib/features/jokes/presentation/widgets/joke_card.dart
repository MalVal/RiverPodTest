import 'package:flutter/material.dart';

import '../../dto/joke.dart';

class JokeCard extends StatelessWidget {
  const JokeCard({
    super.key,
    required this.joke,
  });

  final Joke joke;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(joke.setup),
            const SizedBox(height: 16),
            Text(joke.punchline),
          ],
        ),
      ),
    );
  }
}