/// A campus facility shown in the GridView.
class Facility {
  final String name;
  final String image; // asset path
  final String description;

  const Facility({
    required this.name,
    required this.image,
    required this.description,
  });

  /// Converts the facility into the arguments passed through the named route.
  FacilityArguments toArguments() =>
      FacilityArguments(name: name, image: image, description: description);
}

/// Route arguments sent to the Facility Details screen.
class FacilityArguments {
  final String name;
  final String image;
  final String description;

  const FacilityArguments({
    required this.name,
    required this.image,
    required this.description,
  });
}
