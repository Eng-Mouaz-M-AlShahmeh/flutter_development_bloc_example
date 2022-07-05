/* Developed by: Eng Mouaz M. Al-Shahmeh */
// TODO: import equatable
import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final int? id;
  final String? title;
  final String? dsc;

  const TodoModel({this.id, this.title, this.dsc});

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, dsc];
}
