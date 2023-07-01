import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel {
  final int? id;
  final int? postId;
  final String? name;
  final String? email;
  final String? body;

  CommentModel({this.id, this.postId, this.name, this.email, this.body});

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}
