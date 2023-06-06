// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TreeDetailModel _$TreeDetailModelFromJson(Map<String, dynamic> json) {
  return _TreeDetailModel.fromJson(json);
}

/// @nodoc
mixin _$TreeDetailModel {
  JafaModel get jafa => throw _privateConstructorUsedError;
  String get familyInfo => throw _privateConstructorUsedError;
  String get familyInfoContent => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TreeDetailModelCopyWith<TreeDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreeDetailModelCopyWith<$Res> {
  factory $TreeDetailModelCopyWith(
          TreeDetailModel value, $Res Function(TreeDetailModel) then) =
      _$TreeDetailModelCopyWithImpl<$Res, TreeDetailModel>;
  @useResult
  $Res call(
      {JafaModel jafa,
      String familyInfo,
      String familyInfoContent,
      String imageUrl});

  $JafaModelCopyWith<$Res> get jafa;
}

/// @nodoc
class _$TreeDetailModelCopyWithImpl<$Res, $Val extends TreeDetailModel>
    implements $TreeDetailModelCopyWith<$Res> {
  _$TreeDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jafa = null,
    Object? familyInfo = null,
    Object? familyInfoContent = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      jafa: null == jafa
          ? _value.jafa
          : jafa // ignore: cast_nullable_to_non_nullable
              as JafaModel,
      familyInfo: null == familyInfo
          ? _value.familyInfo
          : familyInfo // ignore: cast_nullable_to_non_nullable
              as String,
      familyInfoContent: null == familyInfoContent
          ? _value.familyInfoContent
          : familyInfoContent // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $JafaModelCopyWith<$Res> get jafa {
    return $JafaModelCopyWith<$Res>(_value.jafa, (value) {
      return _then(_value.copyWith(jafa: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TreeDetailModelCopyWith<$Res>
    implements $TreeDetailModelCopyWith<$Res> {
  factory _$$_TreeDetailModelCopyWith(
          _$_TreeDetailModel value, $Res Function(_$_TreeDetailModel) then) =
      __$$_TreeDetailModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {JafaModel jafa,
      String familyInfo,
      String familyInfoContent,
      String imageUrl});

  @override
  $JafaModelCopyWith<$Res> get jafa;
}

/// @nodoc
class __$$_TreeDetailModelCopyWithImpl<$Res>
    extends _$TreeDetailModelCopyWithImpl<$Res, _$_TreeDetailModel>
    implements _$$_TreeDetailModelCopyWith<$Res> {
  __$$_TreeDetailModelCopyWithImpl(
      _$_TreeDetailModel _value, $Res Function(_$_TreeDetailModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jafa = null,
    Object? familyInfo = null,
    Object? familyInfoContent = null,
    Object? imageUrl = null,
  }) {
    return _then(_$_TreeDetailModel(
      jafa: null == jafa
          ? _value.jafa
          : jafa // ignore: cast_nullable_to_non_nullable
              as JafaModel,
      familyInfo: null == familyInfo
          ? _value.familyInfo
          : familyInfo // ignore: cast_nullable_to_non_nullable
              as String,
      familyInfoContent: null == familyInfoContent
          ? _value.familyInfoContent
          : familyInfoContent // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TreeDetailModel extends _TreeDetailModel {
  const _$_TreeDetailModel(
      {this.jafa = const JafaModel(),
      this.familyInfo = '',
      this.familyInfoContent = '',
      this.imageUrl = ''})
      : super._();

  factory _$_TreeDetailModel.fromJson(Map<String, dynamic> json) =>
      _$$_TreeDetailModelFromJson(json);

  @override
  @JsonKey()
  final JafaModel jafa;
  @override
  @JsonKey()
  final String familyInfo;
  @override
  @JsonKey()
  final String familyInfoContent;
  @override
  @JsonKey()
  final String imageUrl;

  @override
  String toString() {
    return 'TreeDetailModel(jafa: $jafa, familyInfo: $familyInfo, familyInfoContent: $familyInfoContent, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TreeDetailModel &&
            (identical(other.jafa, jafa) || other.jafa == jafa) &&
            (identical(other.familyInfo, familyInfo) ||
                other.familyInfo == familyInfo) &&
            (identical(other.familyInfoContent, familyInfoContent) ||
                other.familyInfoContent == familyInfoContent) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, jafa, familyInfo, familyInfoContent, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TreeDetailModelCopyWith<_$_TreeDetailModel> get copyWith =>
      __$$_TreeDetailModelCopyWithImpl<_$_TreeDetailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TreeDetailModelToJson(
      this,
    );
  }
}

abstract class _TreeDetailModel extends TreeDetailModel {
  const factory _TreeDetailModel(
      {final JafaModel jafa,
      final String familyInfo,
      final String familyInfoContent,
      final String imageUrl}) = _$_TreeDetailModel;
  const _TreeDetailModel._() : super._();

  factory _TreeDetailModel.fromJson(Map<String, dynamic> json) =
      _$_TreeDetailModel.fromJson;

  @override
  JafaModel get jafa;
  @override
  String get familyInfo;
  @override
  String get familyInfoContent;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_TreeDetailModelCopyWith<_$_TreeDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}
