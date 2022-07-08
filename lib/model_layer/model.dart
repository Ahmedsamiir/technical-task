abstract class ExhibitsLoader {
  Future<List<Exhibit>> getExhibitList();
}

class Exhibit {
  String? title;
  List<String>? images;

  Exhibit({
    this.title,
    this.images,
  });

  Exhibit.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
    if (json['images'] != null) {
      final v = json['images'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      images = arr0;
    }
  }
}
