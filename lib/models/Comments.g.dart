// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentsImpl _$$CommentsImplFromJson(Map<String, dynamic> json) =>
    _$CommentsImpl(
      username: json['username'] as String,
      userId: json['userId'] as String,
      commentUid: json['commentUid'] as String,
      comment: json['comment'] as String,
      likes: (json['likes'] as List<dynamic>).map((e) => e as String).toList(),
      commentTime: DateTime.parse(json['commentTime'] as String),
    );

Map<String, dynamic> _$$CommentsImplToJson(_$CommentsImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'userId': instance.userId,
      'commentUid': instance.commentUid,
      'comment': instance.comment,
      'likes': instance.likes,
      'commentTime': instance.commentTime.toIso8601String(),
    };
