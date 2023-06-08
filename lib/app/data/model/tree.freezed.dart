// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Tree {
  String get name => throw _privateConstructorUsedError;
  String? get discription => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get province => throw _privateConstructorUsedError;
  String? get district => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get relationship => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TreeCopyWith<Tree> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreeCopyWith<$Res> {
  factory $TreeCopyWith(Tree value, $Res Function(Tree) then) =
      _$TreeCopyWithImpl<$Res, Tree>;
  @useResult
  $Res call(
      {String name,
      String? discription,
      String? image,
      String? province,
      String? district,
      String? address,
      String? relationship});
}

/// @nodoc
class _$TreeCopyWithImpl<$Res, $Val extends Tree>
    implements $TreeCopyWith<$Res> {
  _$TreeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? discription = freezed,
    Object? image = freezed,
    Object? province = freezed,
    Object? district = freezed,
    Object? address = freezed,
    Object? relationship = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      discription: freezed == discription
          ? _value.discription
          : discription // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      relationship: freezed == relationship
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TreeCopyWith<$Res> implements $TreeCopyWith<$Res> {
  factory _$$_TreeCopyWith(_$_Tree value, $Res Function(_$_Tree) then) =
      __$$_TreeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? discription,
      String? image,
      String? province,
      String? district,
      String? address,
      String? relationship});
}

/// @nodoc
class __$$_TreeCopyWithImpl<$Res> extends _$TreeCopyWithImpl<$Res, _$_Tree>
    implements _$$_TreeCopyWith<$Res> {
  __$$_TreeCopyWithImpl(_$_Tree _value, $Res Function(_$_Tree) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? discription = freezed,
    Object? image = freezed,
    Object? province = freezed,
    Object? district = freezed,
    Object? address = freezed,
    Object? relationship = freezed,
  }) {
    return _then(_$_Tree(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      discription: freezed == discription
          ? _value.discription
          : discription // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      relationship: freezed == relationship
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Tree extends _Tree {
  const _$_Tree(
      {this.name = '',
      this.discription,
      this.image,
      this.province,
      this.district,
      this.address,
      this.relationship})
      : super._();

  @override
  @JsonKey()
  final String name;
  @override
  final String? discription;
  @override
  final String? image;
  @override
  final String? province;
  @override
  final String? district;
  @override
  final String? address;
  @override
  final String? relationship;

  @override
  String toString() {
    return 'Tree(name: $name, discription: $discription, image: $image, province: $province, district: $district, address: $address, relationship: $relationship)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tree &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.discription, discription) ||
                other.discription == discription) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.relationship, relationship) ||
                other.relationship == relationship));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, discription, image,
      province, district, address, relationship);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TreeCopyWith<_$_Tree> get copyWith =>
      __$$_TreeCopyWithImpl<_$_Tree>(this, _$identity);
}

abstract class _Tree extends Tree {
  const factory _Tree(
      {final String name,
      final String? discription,
      final String? image,
      final String? province,
      final String? district,
      final String? address,
      final String? relationship}) = _$_Tree;
  const _Tree._() : super._();

  @override
  String get name;
  @override
  String? get discription;
  @override
  String? get image;
  @override
  String? get province;
  @override
  String? get district;
  @override
  String? get address;
  @override
  String? get relationship;
  @override
  @JsonKey(ignore: true)
  _$$_TreeCopyWith<_$_Tree> get copyWith => throw _privateConstructorUsedError;
}
