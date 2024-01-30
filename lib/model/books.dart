class BooksModel {
  String title;
  String image;
  String author;
  String publisher;
  String publisheddate;
  int pageno;
  String desc;
  String previewurl;
  String infourl;

  BooksModel({
    required this.title,
    required this.image,
    required this.author,
    required this.publisher,
    required this.publisheddate,
    required this.pageno,
    required this.desc,
    required this.previewurl,
    required this.infourl,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
        title: json["title"],
        image: json["image"],
        author: json["author"],
        publisher: json["publisher"],
        publisheddate: json["publisheddate"],
        pageno: json["pageno"],
        desc: json["desc"],
        previewurl: json["previewurl"],
        infourl: json["infourl"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "author": author,
        "publisher": publisher,
        "publisheddate": publisheddate,
        "pageno": pageno,
        "desc": desc,
        "previewurl": previewurl,
        "infourl": infourl,
      };
}
