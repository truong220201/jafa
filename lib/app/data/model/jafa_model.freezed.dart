// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jafa_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JafaModel _$JafaModelFromJson(Map<String, dynamic> json) {
  return _JafaModel.fromJson(json);
}

/// @nodoc
mixin _$JafaModel {
  String get name => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get imageJafa => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JafaModelCopyWith<JafaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JafaModelCopyWith<$Res> {
  factory $JafaModelCopyWith(JafaModel value, $Res Function(JafaModel) then) =
      _$JafaModelCopyWithImpl<$Res, JafaModel>;
  @useResult
  $Res call({String name, String content, String imageJafa});
}

/// @nodoc
class _$JafaModelCopyWithImpl<$Res, $Val extends JafaModel>
    implements $JafaModelCopyWith<$Res> {
  _$JafaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? content = null,
    Object? imageJafa = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageJafa: null == imageJafa
          ? _value.imageJafa
          : imageJafa // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JafaModelCopyWith<$Res> implements $JafaModelCopyWith<$Res> {
  factory _$$_JafaModelCopyWith(
          _$_JafaModel value, $Res Function(_$_JafaModel) then) =
      __$$_JafaModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String content, String imageJafa});
}

/// @nodoc
class __$$_JafaModelCopyWithImpl<$Res>
    extends _$JafaModelCopyWithImpl<$Res, _$_JafaModel>
    implements _$$_JafaModelCopyWith<$Res> {
  __$$_JafaModelCopyWithImpl(
      _$_JafaModel _value, $Res Function(_$_JafaModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? content = null,
    Object? imageJafa = null,
  }) {
    return _then(_$_JafaModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageJafa: null == imageJafa
          ? _value.imageJafa
          : imageJafa // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JafaModel extends _JafaModel {
  const _$_JafaModel({this.name = '', this.content = '', this.imageJafa = ''})
      : super._();

  factory _$_JafaModel.fromJson(Map<String, dynamic> json) =>
      _$$_JafaModelFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String imageJafa;

  @override
  String toString() {
    return 'JafaModel(name: $name, content: $content, imageJafa: $imageJafa)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JafaModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageJafa, imageJafa) ||
                other.imageJafa == imageJafa));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, content, imageJafa);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JafaModelCopyWith<_$_JafaModel> get copyWith =>
      __$$_JafaModelCopyWithImpl<_$_JafaModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JafaModelToJson(
      this,
    );
  }
}

abstract class _JafaModel extends JafaModel {
  const factory _JafaModel(
      {final String name,
      final String content,
      final String imageJafa}) = _$_JafaModel;
  const _JafaModel._() : super._();

  factory _JafaModel.fromJson(Map<String, dynamic> json) =
      _$_JafaModel.fromJson;

  @override
  String get name;
  @override
  String get content;
  @override
  String get imageJafa;
  @override
  @JsonKey(ignore: true)
  _$$_JafaModelCopyWith<_$_JafaModel> get copyWith =>
      throw _privateConstructorUsedError;
}
