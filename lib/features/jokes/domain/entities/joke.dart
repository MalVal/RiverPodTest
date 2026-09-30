class Joke {
  const Joke({
    required this.setup,
    required this.punchline,
  });

  final String setup;
  final String punchline;

  String get fullText => '$setup $punchline';

  bool get isLong => fullText.length > 100;
}