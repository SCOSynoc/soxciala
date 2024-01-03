// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersImpl _$$UsersImplFromJson(Map<String, dynamic> json) => _$UsersImpl(
      userUid: json['userUid'] as String,
      userName: json['userName'] as String,
      userEmail: json['userEmail'] as String,
      userMobile: json['userMobile'] as String,
      userPost: (json['userPost'] as List<dynamic>)
          .map((e) => FeedsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      userIpAddress: json['userIpAddress'] as String?,
    );

Map<String, dynamic> _$$UsersImplToJson(_$UsersImpl instance) =>
    <String, dynamic>{
      'userUid': instance.userUid,
      'userName': instance.userName,
      'userEmail': instance.userEmail,
      'userMobile': instance.userMobile,
      'userPost': instance.userPost,
      'userIpAddress': instance.userIpAddress,
    };
