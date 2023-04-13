class Report {
  static Report? _empty;
  String? content;

  Report({this.content});

  static Report empty() {
    return _empty ??= Report(content: "");
  }

  Report copy() {
    return Report(
      content: content,
    );
  }

  static Report? fromMap(Map<String, dynamic>? data) {
    // data!["kontak"] = data["kontak"].map((e) => jsonDecode(e)).toList();
    // data["pelatihan"] = data["pelatihan"].map((e) => jsonDecode(e)).toList();
    // data["pendidikan"] = data["pendidikan"].map((e) => jsonDecode(e)).toList();
    // data["penugasan"] = data["penugasan"].map((e) => jsonDecode(e)).toList();
    // data["publikasi"] = data["publikasi"].map((e) => jsonDecode(e)).toList();
    return data == null
        ? null
        : Report(
            content: data["content"],
          );
  }

  static List<Report?> fromMapList(List<dynamic>? data) {
    return data == null ? [] : data.map((e) => fromMap(e)).toList();
  }

  Map<String, dynamic> toVariables() {
    return {
      "content": content,
    };
  }

  Future<void> update() async {
    // await instance.collection('users').doc(id).update(toVariables());
  }
}
