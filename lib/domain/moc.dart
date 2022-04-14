import 'package:equatable/equatable.dart';

class Moc extends Equatable {
  final String mocNum;
  final String name;

  const Moc(this.mocNum, this.name);

  @override
  List<Object?> get props => [mocNum, name];
}
