class CardOb {
  String titre;
  String url;

  CardOb({required this.titre, required this.url});

  factory CardOb.fromJson(Map<String, dynamic> json) {
    return CardOb(titre: json['title'], url: json['image']);
  }
}
