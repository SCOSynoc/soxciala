

import 'package:freezed_annotation/freezed_annotation.dart';

part 'Comments.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'Comments.g.dart';


@freezed
class Comments with _$Comments {
  const factory Comments({
    required String username,
    required String userId,
    required String commentUid,
    required String comment,
    required List<String> likes,
    required DateTime commentTime,
  }) = _Comments;

  factory Comments.fromJson(Map<String, dynamic> json)
  => _$CommentsFromJson(json);

}