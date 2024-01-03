// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Posts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Posts _$PostsFromJson(Map<String, dynamic> json) {
  return _Posts.fromJson(json);
}

/// @nodoc
mixin _$Posts {
  String get postUid => throw _privateConstructorUsedError;
  String get postedBy => throw _privateConstructorUsedError;
  String get postCaptions => throw _privateConstructorUsedError;
  String? get postImage => throw _privateConstructorUsedError;
  List<Users> get postsTags => throw _privateConstructorUsedError;
  String get postTime => throw _privateConstructorUsedError;
  String? get postIpAddress => throw _privateConstructorUsedError;
  List<String> get likes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostsCopyWith<Posts> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsCopyWith<$Res> {
  factory $PostsCopyWith(Posts value, $Res Function(Posts) then) =
      _$PostsCopyWithImpl<$Res, Posts>;
  @useResult
  $Res call(
      {String postUid,
      String postedBy,
      String postCaptions,
      String? postImage,
      List<Users> postsTags,
      String postTime,
      String? postIpAddress,
      List<String> likes});
}

/// @nodoc
class _$PostsCopyWithImpl<$Res, $Val extends Posts>
    implements $PostsCopyWith<$Res> {
  _$PostsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postUid = null,
    Object? postedBy = null,
    Object? postCaptions = null,
    Object? postImage = freezed,
    Object? postsTags = null,
    Object? postTime = null,
    Object? postIpAddress = freezed,
    Object? likes = null,
  }) {
    return _then(_value.copyWith(
      postUid: null == postUid
          ? _value.postUid
          : postUid // ignore: cast_nullable_to_non_nullable
              as String,
      postedBy: null == postedBy
          ? _value.postedBy
          : postedBy // ignore: cast_nullable_to_non_nullable
              as String,
      postCaptions: null == postCaptions
          ? _value.postCaptions
          : postCaptions // ignore: cast_nullable_to_non_nullable
              as String,
      postImage: freezed == postImage
          ? _value.postImage
          : postImage // ignore: cast_nullable_to_non_nullable
              as String?,
      postsTags: null == postsTags
          ? _value.postsTags
          : postsTags // ignore: cast_nullable_to_non_nullable
              as List<Users>,
      postTime: null == postTime
          ? _value.postTime
          : postTime // ignore: cast_nullable_to_non_nullable
              as String,
      postIpAddress: freezed == postIpAddress
          ? _value.postIpAddress
          : postIpAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostsImplCopyWith<$Res> implements $PostsCopyWith<$Res> {
  factory _$$PostsImplCopyWith(
          _$PostsImpl value, $Res Function(_$PostsImpl) then) =
      __$$PostsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String postUid,
      String postedBy,
      String postCaptions,
      String? postImage,
      List<Users> postsTags,
      String postTime,
      String? postIpAddress,
      List<String> likes});
}

/// @nodoc
class __$$PostsImplCopyWithImpl<$Res>
    extends _$PostsCopyWithImpl<$Res, _$PostsImpl>
    implements _$$PostsImplCopyWith<$Res> {
  __$$PostsImplCopyWithImpl(
      _$PostsImpl _value, $Res Function(_$PostsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postUid = null,
    Object? postedBy = null,
    Object? postCaptions = null,
    Object? postImage = freezed,
    Object? postsTags = null,
    Object? postTime = null,
    Object? postIpAddress = freezed,
    Object? likes = null,
  }) {
    return _then(_$PostsImpl(
      postUid: null == postUid
          ? _value.postUid
          : postUid // ignore: cast_nullable_to_non_nullable
              as String,
      postedBy: null == postedBy
          ? _value.postedBy
          : postedBy // ignore: cast_nullable_to_non_nullable
              as String,
      postCaptions: null == postCaptions
          ? _value.postCaptions
          : postCaptions // ignore: cast_nullable_to_non_nullable
              as String,
      postImage: freezed == postImage
          ? _value.postImage
          : postImage // ignore: cast_nullable_to_non_nullable
              as String?,
      postsTags: null == postsTags
          ? _value._postsTags
          : postsTags // ignore: cast_nullable_to_non_nullable
              as List<Users>,
      postTime: null == postTime
          ? _value.postTime
          : postTime // ignore: cast_nullable_to_non_nullable
              as String,
      postIpAddress: freezed == postIpAddress
          ? _value.postIpAddress
          : postIpAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostsImpl with DiagnosticableTreeMixin implements _Posts {
  const _$PostsImpl(
      {required this.postUid,
      required this.postedBy,
      required this.postCaptions,
      required this.postImage,
      required final List<Users> postsTags,
      required this.postTime,
      required this.postIpAddress,
      required final List<String> likes})
      : _postsTags = postsTags,
        _likes = likes;

  factory _$PostsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostsImplFromJson(json);

  @override
  final String postUid;
  @override
  final String postedBy;
  @override
  final String postCaptions;
  @override
  final String? postImage;
  final List<Users> _postsTags;
  @override
  List<Users> get postsTags {
    if (_postsTags is EqualUnmodifiableListView) return _postsTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_postsTags);
  }

  @override
  final String postTime;
  @override
  final String? postIpAddress;
  final List<String> _likes;
  @override
  List<String> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Posts(postUid: $postUid, postedBy: $postedBy, postCaptions: $postCaptions, postImage: $postImage, postsTags: $postsTags, postTime: $postTime, postIpAddress: $postIpAddress, likes: $likes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Posts'))
      ..add(DiagnosticsProperty('postUid', postUid))
      ..add(DiagnosticsProperty('postedBy', postedBy))
      ..add(DiagnosticsProperty('postCaptions', postCaptions))
      ..add(DiagnosticsProperty('postImage', postImage))
      ..add(DiagnosticsProperty('postsTags', postsTags))
      ..add(DiagnosticsProperty('postTime', postTime))
      ..add(DiagnosticsProperty('postIpAddress', postIpAddress))
      ..add(DiagnosticsProperty('likes', likes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostsImpl &&
            (identical(other.postUid, postUid) || other.postUid == postUid) &&
            (identical(other.postedBy, postedBy) ||
                other.postedBy == postedBy) &&
            (identical(other.postCaptions, postCaptions) ||
                other.postCaptions == postCaptions) &&
            (identical(other.postImage, postImage) ||
                other.postImage == postImage) &&
            const DeepCollectionEquality()
                .equals(other._postsTags, _postsTags) &&
            (identical(other.postTime, postTime) ||
                other.postTime == postTime) &&
            (identical(other.postIpAddress, postIpAddress) ||
                other.postIpAddress == postIpAddress) &&
            const DeepCollectionEquality().equals(other._likes, _likes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      postUid,
      postedBy,
      postCaptions,
      postImage,
      const DeepCollectionEquality().hash(_postsTags),
      postTime,
      postIpAddress,
      const DeepCollectionEquality().hash(_likes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostsImplCopyWith<_$PostsImpl> get copyWith =>
      __$$PostsImplCopyWithImpl<_$PostsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostsImplToJson(
      this,
    );
  }
}

abstract class _Posts implements Posts {
  const factory _Posts(
      {required final String postUid,
      required final String postedBy,
      required final String postCaptions,
      required final String? postImage,
      required final List<Users> postsTags,
      required final String postTime,
      required final String? postIpAddress,
      required final List<String> likes}) = _$PostsImpl;

  factory _Posts.fromJson(Map<String, dynamic> json) = _$PostsImpl.fromJson;

  @override
  String get postUid;
  @override
  String get postedBy;
  @override
  String get postCaptions;
  @override
  String? get postImage;
  @override
  List<Users> get postsTags;
  @override
  String get postTime;
  @override
  String? get postIpAddress;
  @override
  List<String> get likes;
  @override
  @JsonKey(ignore: true)
  _$$PostsImplCopyWith<_$PostsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
