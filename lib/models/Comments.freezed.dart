// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Comments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Comments _$CommentsFromJson(Map<String, dynamic> json) {
  return _Comments.fromJson(json);
}

/// @nodoc
mixin _$Comments {
  String get username => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get commentUid => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  List<String> get likes => throw _privateConstructorUsedError;
  DateTime get commentTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentsCopyWith<Comments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsCopyWith<$Res> {
  factory $CommentsCopyWith(Comments value, $Res Function(Comments) then) =
      _$CommentsCopyWithImpl<$Res, Comments>;
  @useResult
  $Res call(
      {String username,
      String userId,
      String commentUid,
      String comment,
      List<String> likes,
      DateTime commentTime});
}

/// @nodoc
class _$CommentsCopyWithImpl<$Res, $Val extends Comments>
    implements $CommentsCopyWith<$Res> {
  _$CommentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? userId = null,
    Object? commentUid = null,
    Object? comment = null,
    Object? likes = null,
    Object? commentTime = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      commentUid: null == commentUid
          ? _value.commentUid
          : commentUid // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commentTime: null == commentTime
          ? _value.commentTime
          : commentTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentsImplCopyWith<$Res>
    implements $CommentsCopyWith<$Res> {
  factory _$$CommentsImplCopyWith(
          _$CommentsImpl value, $Res Function(_$CommentsImpl) then) =
      __$$CommentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String userId,
      String commentUid,
      String comment,
      List<String> likes,
      DateTime commentTime});
}

/// @nodoc
class __$$CommentsImplCopyWithImpl<$Res>
    extends _$CommentsCopyWithImpl<$Res, _$CommentsImpl>
    implements _$$CommentsImplCopyWith<$Res> {
  __$$CommentsImplCopyWithImpl(
      _$CommentsImpl _value, $Res Function(_$CommentsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? userId = null,
    Object? commentUid = null,
    Object? comment = null,
    Object? likes = null,
    Object? commentTime = null,
  }) {
    return _then(_$CommentsImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      commentUid: null == commentUid
          ? _value.commentUid
          : commentUid // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commentTime: null == commentTime
          ? _value.commentTime
          : commentTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentsImpl implements _Comments {
  const _$CommentsImpl(
      {required this.username,
      required this.userId,
      required this.commentUid,
      required this.comment,
      required final List<String> likes,
      required this.commentTime})
      : _likes = likes;

  factory _$CommentsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentsImplFromJson(json);

  @override
  final String username;
  @override
  final String userId;
  @override
  final String commentUid;
  @override
  final String comment;
  final List<String> _likes;
  @override
  List<String> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  @override
  final DateTime commentTime;

  @override
  String toString() {
    return 'Comments(username: $username, userId: $userId, commentUid: $commentUid, comment: $comment, likes: $likes, commentTime: $commentTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.commentUid, commentUid) ||
                other.commentUid == commentUid) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            (identical(other.commentTime, commentTime) ||
                other.commentTime == commentTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, userId, commentUid,
      comment, const DeepCollectionEquality().hash(_likes), commentTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsImplCopyWith<_$CommentsImpl> get copyWith =>
      __$$CommentsImplCopyWithImpl<_$CommentsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentsImplToJson(
      this,
    );
  }
}

abstract class _Comments implements Comments {
  const factory _Comments(
      {required final String username,
      required final String userId,
      required final String commentUid,
      required final String comment,
      required final List<String> likes,
      required final DateTime commentTime}) = _$CommentsImpl;

  factory _Comments.fromJson(Map<String, dynamic> json) =
      _$CommentsImpl.fromJson;

  @override
  String get username;
  @override
  String get userId;
  @override
  String get commentUid;
  @override
  String get comment;
  @override
  List<String> get likes;
  @override
  DateTime get commentTime;
  @override
  @JsonKey(ignore: true)
  _$$CommentsImplCopyWith<_$CommentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
