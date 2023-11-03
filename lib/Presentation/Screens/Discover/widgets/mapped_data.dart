class MappedClass {
  List<String> relationshipTypesFromAPI = [
    "single_searching",
    "friends",
    "long_term",
    "red_light_district",
  ];

  List<RelationshipType> relationshipTypesMapped = [];

  MappedClass() {
    relationshipTypesMapped = relationshipTypesFromAPI.map((type) {
      switch (type) {
        case 'single_searching':
          return RelationshipType.SINGLE;
        case 'friends':
          return RelationshipType.FRIENDS;
        case 'long_term':
          return RelationshipType.LONG_TERM;
        case 'red_light_district':
          return RelationshipType.RED_LIGHT;
        default:
          return RelationshipType
              .SINGLE; // Default to SINGLE if type is unknown
      }
    }).toList();
  }
}

enum RelationshipType { SINGLE, FRIENDS, LONG_TERM, RED_LIGHT }
