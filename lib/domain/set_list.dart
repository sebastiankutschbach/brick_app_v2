import 'package:equatable/equatable.dart';

class SetList extends Equatable {
  final int id;
  final String name;
  final int numberSets;

  const SetList(this.id, this.name, this.numberSets);

  @override
  List<Object?> get props => [id, name, numberSets];

  SetList.fromJson(json)
      : id = json['id'],
        name = json['name'],
        numberSets = json['num_sets'];
}
