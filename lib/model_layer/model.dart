abstract  class ExhibitsLoader{

  Future<List<Exhibit>> getExhibitList();
}
class Exhibit {
/*
{
  "title": "iPhone 5s",
  "images": [
    "https://upload.wikimedia.org/wikipedia/commons/f/fd/IPhone_5S.jpg"
  ]
}
*/

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