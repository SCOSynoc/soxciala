import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'FeedsModel.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'FeedsModel.g.dart';

@freezed
class FeedsModel with _$FeedsModel  {
  const factory FeedsModel({
    required String feedsUid,
    required String userUid,
    required String userName,
    required String userImage,
    required String feedsImage,
    required int feedsLikes,
    required int feedsComment,
  }) = _FeedsModel;

  factory FeedsModel.fromJson(Map<String, Object?> json)
  => _$FeedsModelFromJson(json);
}