class Set {
  final String setNum;
  final String name;
  final int year;
  final int themeId;
  final int numParts;
  final Uri setImgUrl;
  final Uri setUrl;
  final DateTime lastModified;

  Set.fromJson(Map<String, dynamic> json)
      : setNum = json['set_num'],
        name = json['name'],
        year = json['year'],
        themeId = json['theme_id'],
        numParts = json['num_parts'],
        setImgUrl = Uri.parse(json['set_img_url']),
        setUrl = Uri.parse(json['set_url']),
        lastModified = DateTime.parse(json['last_modified_dt']);
}
