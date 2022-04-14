import 'package:equatable/equatable.dart';

class Moc extends Equatable {
  final String mocNum;
  final String name;
  final int year;
  final int themeId;
  final int numParts;
  final Uri imgUrl;
  final Uri url;
  final String designerName;
  final String designerUrl;
  bool hasInstruction = false;

  Moc.fromJson(Map<String, dynamic> json)
      : mocNum = json['set_num'],
        name = json['name'],
        year = json['year'],
        themeId = json['theme_id'],
        numParts = json['num_parts'],
        imgUrl = Uri.parse(json['moc_img_url']),
        url = Uri.parse(json['moc_url']),
        designerName = json['designer_name'],
        designerUrl = json['designer_url'];

  @override
  List<Object?> get props => [mocNum, name];
}
