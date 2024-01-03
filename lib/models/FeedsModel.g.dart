// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FeedsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedsModelImpl _$$FeedsModelImplFromJson(Map<String, dynamic> json) =>
    _$FeedsModelImpl(
      feedsUid: json['feedsUid'] as String,
      userUid: json['userUid'] as String,
      userName: json['userName'] as String,
      userImage: json['userImage'] as String,
      feedsImage: json['feedsImage'] as String,
      feedsLikes: json['feedsLikes'] as int,
      feedsComment: json['feedsComment'] as int,
    );

Map<String, dynamic> _$$FeedsModelImplToJson(_$FeedsModelImpl instance) =>
    <String, dynamic>{
      'feedsUid': instance.feedsUid,
      'userUid': instance.userUid,
      'userName': instance.userName,
      'userImage': instance.userImage,
      'feedsImage': instance.feedsImage,
      'feedsLikes': instance.feedsLikes,
      'feedsComment': instance.feedsComment,
    };
