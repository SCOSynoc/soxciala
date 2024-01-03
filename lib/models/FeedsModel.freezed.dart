// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'FeedsModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeedsModel _$FeedsModelFromJson(Map<String, dynamic> json) {
  return _FeedsModel.fromJson(json);
}

/// @nodoc
mixin _$FeedsModel {
  String get feedsUid => throw _privateConstructorUsedError;
  String get userUid => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userImage => throw _privateConstructorUsedError;
  String get feedsImage => throw _privateConstructorUsedError;
  int get feedsLikes => throw _privateConstructorUsedError;
  int get feedsComment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedsModelCopyWith<FeedsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedsModelCopyWith<$Res> {
  factory $FeedsModelCopyWith(
          FeedsModel value, $Res Function(FeedsModel) then) =
      _$FeedsModelCopyWithImpl<$Res, FeedsModel>;
  @useResult
  $Res call(
      {String feedsUid,
      String userUid,
      String userName,
      String userImage,
      String feedsImage,
      int feedsLikes,
      int feedsComment});
}

/// @nodoc
class _$FeedsModelCopyWithImpl<$Res, $Val extends FeedsModel>
    implements $FeedsModelCopyWith<$Res> {
  _$FeedsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedsUid = null,
    Object? userUid = null,
    Object? userName = null,
    Object? userImage = null,
    Object? feedsImage = null,
    Object? feedsLikes = null,
    Object? feedsComment = null,
  }) {
    return _then(_value.copyWith(
      feedsUid: null == feedsUid
          ? _value.feedsUid
          : feedsUid // ignore: cast_nullable_to_non_nullable
              as String,
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String,
      feedsImage: null == feedsImage
          ? _value.feedsImage
          : feedsImage // ignore: cast_nullable_to_non_nullable
              as String,
      feedsLikes: null == feedsLikes
          ? _value.feedsLikes
          : feedsLikes // ignore: cast_nullable_to_non_nullable
              as int,
      feedsComment: null == feedsComment
          ? _value.feedsComment
          : feedsComment // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedsModelImplCopyWith<$Res>
    implements $FeedsModelCopyWith<$Res> {
  factory _$$FeedsModelImplCopyWith(
          _$FeedsModelImpl value, $Res Function(_$FeedsModelImpl) then) =
      __$$FeedsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String feedsUid,
      String userUid,
      String userName,
      String userImage,
      String feedsImage,
      int feedsLikes,
      int feedsComment});
}

/// @nodoc
class __$$FeedsModelImplCopyWithImpl<$Res>
    extends _$FeedsModelCopyWithImpl<$Res, _$FeedsModelImpl>
    implements _$$FeedsModelImplCopyWith<$Res> {
  __$$FeedsModelImplCopyWithImpl(
      _$FeedsModelImpl _value, $Res Function(_$FeedsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedsUid = null,
    Object? userUid = null,
    Object? userName = null,
    Object? userImage = null,
    Object? feedsImage = null,
    Object? feedsLikes = null,
    Object? feedsComment = null,
  }) {
    return _then(_$FeedsModelImpl(
      feedsUid: null == feedsUid
          ? _value.feedsUid
          : feedsUid // ignore: cast_nullable_to_non_nullable
              as String,
      userUid: null == userUid
          ? _value.userUid
          : userUid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String,
      feedsImage: null == feedsImage
          ? _value.feedsImage
          : feedsImage // ignore: cast_nullable_to_non_nullable
              as String,
      feedsLikes: null == feedsLikes
          ? _value.feedsLikes
          : feedsLikes // ignore: cast_nullable_to_non_nullable
              as int,
      feedsComment: null == feedsComment
          ? _value.feedsComment
          : feedsComment // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedsModelImpl with DiagnosticableTreeMixin implements _FeedsModel {
  const _$FeedsModelImpl(
      {required this.feedsUid,
      required this.userUid,
      required this.userName,
      required this.userImage,
      required this.feedsImage,
      required this.feedsLikes,
      required this.feedsComment});

  factory _$FeedsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedsModelImplFromJson(json);

  @override
  final String feedsUid;
  @override
  final String userUid;
  @override
  final String userName;
  @override
  final String userImage;
  @override
  final String feedsImage;
  @override
  final int feedsLikes;
  @override
  final int feedsComment;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeedsModel(feedsUid: $feedsUid, userUid: $userUid, userName: $userName, userImage: $userImage, feedsImage: $feedsImage, feedsLikes: $feedsLikes, feedsComment: $feedsComment)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FeedsModel'))
      ..add(DiagnosticsProperty('feedsUid', feedsUid))
      ..add(DiagnosticsProperty('userUid', userUid))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('userImage', userImage))
      ..add(DiagnosticsProperty('feedsImage', feedsImage))
      ..add(DiagnosticsProperty('feedsLikes', feedsLikes))
      ..add(DiagnosticsProperty('feedsComment', feedsComment));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedsModelImpl &&
            (identical(other.feedsUid, feedsUid) ||
                other.feedsUid == feedsUid) &&
            (identical(other.userUid, userUid) || other.userUid == userUid) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.feedsImage, feedsImage) ||
                other.feedsImage == feedsImage) &&
            (identical(other.feedsLikes, feedsLikes) ||
                other.feedsLikes == feedsLikes) &&
            (identical(other.feedsComment, feedsComment) ||
                other.feedsComment == feedsComment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, feedsUid, userUid, userName,
      userImage, feedsImage, feedsLikes, feedsComment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedsModelImplCopyWith<_$FeedsModelImpl> get copyWith =>
      __$$FeedsModelImplCopyWithImpl<_$FeedsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedsModelImplToJson(
      this,
    );
  }
}

abstract class _FeedsModel implements FeedsModel {
  const factory _FeedsModel(
      {required final String feedsUid,
      required final String userUid,
      required final String userName,
      required final String userImage,
      required final String feedsImage,
      required final int feedsLikes,
      required final int feedsComment}) = _$FeedsModelImpl;

  factory _FeedsModel.fromJson(Map<String, dynamic> json) =
      _$FeedsModelImpl.fromJson;

  @override
  String get feedsUid;
  @override
  String get userUid;
  @override
  String get userName;
  @override
  String get userImage;
  @override
  String get feedsImage;
  @override
  int get feedsLikes;
  @override
  int get feedsComment;
  @override
  @JsonKey(ignore: true)
  _$$FeedsModelImplCopyWith<_$FeedsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
