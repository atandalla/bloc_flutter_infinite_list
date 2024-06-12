
class RickAndMortyResponse {
  final Info info;
  final List<Character> results;

  RickAndMortyResponse({required this.info, required this.results});

  factory RickAndMortyResponse.fromJson(Map<String, dynamic> json) {
    return RickAndMortyResponse(
      info: Info.fromJson(json['info']),
      results: (json['results'] as List).map((i) => Character.fromJson(i)).toList(),
    );
  }
}


class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: Location.fromJson(json['origin']),
      location: Location.fromJson(json['location']),
      image: json['image'],
      episode: List<String>.from(json['episode']),
      url: json['url'],
      created: json['created'],
    );
  }
}

class Location {
  final String name;
  final String url;

  Location({required this.name, required this.url});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      url: json['url'],
    );
  }
}

class Info {
  final int count;
  final int pages;
  final String next;
  final String prev;

  Info(
      {required this.count,
      required this.pages,
      required this.next,
      required this.prev});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      count: json['count'],
      pages: json['pages'],
      next: json['next'] ?? '',
      prev: json['prev'] ?? '',
    );
  }
}



