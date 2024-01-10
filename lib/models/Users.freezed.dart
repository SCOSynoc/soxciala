// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Users _$UsersFromJson(Map<String, dynamic> json) {
  return _Users.fromJson(json);
}

/// @nodoc
mixin _$Users {
  String get userUid => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userEmail => throw _privateConstructorUsedError;
  String get userMobile => throw _privateConstructorUsedError;
  List<FeedsModel> get userPost => throw _privateConstructorUsedError;
  String? get userIpAddress => throw _privateConstructorUsedError;
  String? get userImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersCopyWith<Users> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersCopyWith<$Res> {
  factory $UsersCopyWith(Users value, $Res Function(Users) then) =
      _$UsersCopyWithImpl<$Res, Users>;
  @useResult
  $Res call(
      {String userUid,
      String userName,
      String userEmail,
      String userMobile,
      List<FeedsModel> userPost,
      String? userIpAddress,
      String? userImage});
}

/// @nodoc
class _$UsersCopyWithImpl<$Res, $Val extends Users>
    implements $UsersCopyWith<$Res> {
  _$UsersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = null,
    Object? userName = null,
    Object? userEmail = null,
    Object? userMobile = null,
    Object? userPost = null,
    Object? userIpAddress = freezed,
    Object? userImage = freezed,
  }) {
    return _then(_value.copyWith(
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      userMobile: null == userMobile
          ? _value.userMobile
          : userMobile // ignore: cast_nullable_to_non_nullable
              as String,
      userPost: null == userPost
          ? _value.userPost
          : userPost // ignore: cast_nullable_to_non_nullable
              as List<FeedsModel>,
      userIpAddress: freezed == userIpAddress
          ? _value.userIpAddress
          : userIpAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      userImage: freezed == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsersImplCopyWith<$Res> implements $UsersCopyWith<$Res> {
  factory _$$UsersImplCopyWith(
          _$UsersImpl value, $Res Function(_$UsersImpl) then) =
      __$$UsersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userUid,
      String userName,
      String userEmail,
      String userMobile,
      List<FeedsModel> userPost,
      String? userIpAddress,
      String? userImage});
}

/// @nodoc
class __$$UsersImplCopyWithImpl<$Res>
    extends _$UsersCopyWithImpl<$Res, _$UsersImpl>
    implements _$$UsersImplCopyWith<$Res> {
  __$$UsersImplCopyWithImpl(
      _$UsersImpl _value, $Res Function(_$UsersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUid = null,
    Object? userName = null,
    Object? userEmail = null,
    Object? userMobile = null,
    Object? userPost = null,
    Object? userIpAddress = freezed,
    Object? userImage = freezed,
  }) {
    return _then(_$UsersImpl(
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      userMobile: null == userMobile
          ? _value.userMobile
          : userMobile // ignore: cast_nullable_to_non_nullable
              as String,
      userPost: null == userPost
          ? _value._userPost
          : userPost // ignore: cast_nullable_to_non_nullable
              as List<FeedsModel>,
      userIpAddress: freezed == userIpAddress
          ? _value.userIpAddress
          : userIpAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      userImage: freezed == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsersImpl with DiagnosticableTreeMixin implements _Users {
  const _$UsersImpl(
      {required this.userUid,
      required this.userName,
      required this.userEmail,
      required this.userMobile,
      required final List<FeedsModel> userPost,
      required this.userIpAddress,
      required this.userImage})
      : _userPost = userPost;

  factory _$UsersImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersImplFromJson(json);

  @override
  final String userUid;
  @override
  final String userName;
  @override
  final String userEmail;
  @override
  final String userMobile;
  final List<FeedsModel> _userPost;
  @override
  List<FeedsModel> get userPost {
    if (_userPost is EqualUnmodifiableListView) return _userPost;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userPost);
  }

  @override
  final String? userIpAddress;
  @override
  final String? userImage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Users(userUid: $userUid, userName: $userName, userEmail: $userEmail, userMobile: $userMobile, userPost: $userPost, userIpAddress: $userIpAddress, userImage: $userImage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Users'))
      ..add(DiagnosticsProperty('userUid', userUid))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('userEmail', userEmail))
      ..add(DiagnosticsProperty('userMobile', userMobile))
      ..add(DiagnosticsProperty('userPost', userPost))
      ..add(DiagnosticsProperty('userIpAddress', userIpAddress))
      ..add(DiagnosticsProperty('userImage', userImage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersImpl &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.userMobile, userMobile) ||
                other.userMobile == userMobile) &&
            const DeepCollectionEquality().equals(other._userPost, _userPost) &&
            (identical(other.userIpAddress, userIpAddress) ||
                other.userIpAddress == userIpAddress) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userUid,
      userName,
      userEmail,
      userMobile,
      const DeepCollectionEquality().hash(_userPost),
      userIpAddress,
      userImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersImplCopyWith<_$UsersImpl> get copyWith =>
      __$$UsersImplCopyWithImpl<_$UsersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersImplToJson(
      this,
    );
  }
}

abstract class _Users implements Users {
  const factory _Users(
      {required final String userUid,
      required final String userName,
      required final String userEmail,
      required final String userMobile,
      required final List<FeedsModel> userPost,
      required final String? userIpAddress,
      required final String? userImage}) = _$UsersImpl;

  factory _Users.fromJson(Map<String, dynamic> json) = _$UsersImpl.fromJson;

  @override
  String get userUid;
  @override
  String get userName;
  @override
  String get userEmail;
  @override
  String get userMobile;
  @override
  List<FeedsModel> get userPost;
  @override
  String? get userIpAddress;
  @override
  String? get userImage;
  @override
  @JsonKey(ignore: true)
  _$$UsersImplCopyWith<_$UsersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
