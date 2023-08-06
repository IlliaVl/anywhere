enum Flavor { simpsonsviewer, wireviewer }

extension FlavorEndpoint on Flavor {
  String get endpoint => this == Flavor.simpsonsviewer
      ? 'simpsons+characters'
      : 'the+wire+characters';
}

extension FlavorAppName on Flavor {
  String get appName => this == Flavor.simpsonsviewer
      ? 'Simpsons Character Viewer'
      : 'The Wire Character Viewer';
}
