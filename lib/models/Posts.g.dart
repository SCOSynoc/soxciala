// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Posts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostsImpl _$$PostsImplFromJson(Map<String, dynamic> json) => _$PostsImpl(
      postUid: json['postUid'] as String,
      postedBy: json['postedBy'] as String,
      postCaptions: json['postCaptions'] as String,
      postImage: json['postImage'] as String?,
      postsTags: (json['postsTags'] as List<dynamic>)
          .map((e) => Users.fromJson(e as Map<String, dynamic>))
          .toList(),
      postTime: json['postTime'] as String,
      postIpAddress: json['postIpAddress'] as String?,
      likes: (json['likes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PostsImplToJson(_$PostsImpl instance) =>
    <String, dynamic>{
      'postUid': instance.postUid,
      'postedBy': instance.postedBy,
      'postCaptions': instance.postCaptions,
      'postImage': instance.postImage,
      'postsTags': instance.postsTags,
      'postTime': instance.postTime,
      'postIpAddress': instance.postIpAddress,
      'likes': instance.likes,
    };
