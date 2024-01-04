// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TreeViewModel _$TreeViewModelFromJson(Map<String, dynamic> json) {
  return _TreeViewModel.fromJson(json);
}

/// @nodoc
mixin _$TreeViewModel {
  @JsonKey(name: 'id_jafa')
  String? get idJafa => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_genealogy_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'children')
  List<Parrent> get childrenParrent => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_root')
  bool get isRoot => throw _privateConstructorUsedError;
  bool? get self => throw _privateConstructorUsedError;
  @JsonKey(name: 'province_id')
  String? get pId => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TreeViewModelCopyWith<TreeViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreeViewModelCopyWith<$Res> {
  factory $TreeViewModelCopyWith(
          TreeViewModel value, $Res Function(TreeViewModel) then) =
      _$TreeViewModelCopyWithImpl<$Res, TreeViewModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_jafa') String? idJafa,
      @JsonKey(name: 'user_genealogy_id') String? id,
      String? name,
      String? image,
      String? birthday,
      String? gender,
      @JsonKey(name: 'children') List<Parrent> childrenParrent,
      @JsonKey(name: 'is_root') bool isRoot,
      bool? self,
      @JsonKey(name: 'province_id') String? pId,
      @JsonKey(name: 'address') String? address});
}

/// @nodoc
class _$TreeViewModelCopyWithImpl<$Res, $Val extends TreeViewModel>
    implements $TreeViewModelCopyWith<$Res> {
  _$TreeViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idJafa = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? birthday = freezed,
    Object? gender = freezed,
    Object? childrenParrent = null,
    Object? isRoot = null,
    Object? self = freezed,
    Object? pId = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      idJafa: freezed == idJafa
          ? _value.idJafa
          : idJafa // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      childrenParrent: null == childrenParrent
          ? _value.childrenParrent
          : childrenParrent // ignore: cast_nullable_to_non_nullable
              as List<Parrent>,
      isRoot: null == isRoot
          ? _value.isRoot
          : isRoot // ignore: cast_nullable_to_non_nullable
              as bool,
      self: freezed == self
          ? _value.self
          : self // ignore: cast_nullable_to_non_nullable
              as bool?,
      pId: freezed == pId
          ? _value.pId
          : pId // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TreeViewModelImplCopyWith<$Res>
    implements $TreeViewModelCopyWith<$Res> {
  factory _$$TreeViewModelImplCopyWith(
          _$TreeViewModelImpl value, $Res Function(_$TreeViewModelImpl) then) =
      __$$TreeViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_jafa') String? idJafa,
      @JsonKey(name: 'user_genealogy_id') String? id,
      String? name,
      String? image,
      String? birthday,
      String? gender,
      @JsonKey(name: 'children') List<Parrent> childrenParrent,
      @JsonKey(name: 'is_root') bool isRoot,
      bool? self,
      @JsonKey(name: 'province_id') String? pId,
      @JsonKey(name: 'address') String? address});
}

/// @nodoc
class __$$TreeViewModelImplCopyWithImpl<$Res>
    extends _$TreeViewModelCopyWithImpl<$Res, _$TreeViewModelImpl>
    implements _$$TreeViewModelImplCopyWith<$Res> {
  __$$TreeViewModelImplCopyWithImpl(
      _$TreeViewModelImpl _value, $Res Function(_$TreeViewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idJafa = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? birthday = freezed,
    Object? gender = freezed,
    Object? childrenParrent = null,
    Object? isRoot = null,
    Object? self = freezed,
    Object? pId = freezed,
    Object? address = freezed,
  }) {
    return _then(_$TreeViewModelImpl(
      idJafa: freezed == idJafa
          ? _value.idJafa
          : idJafa // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      childrenParrent: null == childrenParrent
          ? _value._childrenParrent
          : childrenParrent // ignore: cast_nullable_to_non_nullable
              as List<Parrent>,
      isRoot: null == isRoot
          ? _value.isRoot
          : isRoot // ignore: cast_nullable_to_non_nullable
              as bool,
      self: freezed == self
          ? _value.self
          : self // ignore: cast_nullable_to_non_nullable
              as bool?,
      pId: freezed == pId
          ? _value.pId
          : pId // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TreeViewModelImpl extends _TreeViewModel {
  const _$TreeViewModelImpl(
      {@JsonKey(name: 'id_jafa') this.idJafa,
      @JsonKey(name: 'user_genealogy_id') this.id,
      this.name,
      this.image,
      this.birthday,
      this.gender,
      @JsonKey(name: 'children') final List<Parrent> childrenParrent = const [],
      @JsonKey(name: 'is_root') this.isRoot = false,
      this.self,
      @JsonKey(name: 'province_id') this.pId,
      @JsonKey(name: 'address') this.address})
      : _childrenParrent = childrenParrent,
        super._();

  factory _$TreeViewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreeViewModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_jafa')
  final String? idJafa;
  @override
  @JsonKey(name: 'user_genealogy_id')
  final String? id;
  @override
  final String? name;
  @override
  final String? image;
  @override
  final String? birthday;
  @override
  final String? gender;
  final List<Parrent> _childrenParrent;
  @override
  @JsonKey(name: 'children')
  List<Parrent> get childrenParrent {
    if (_childrenParrent is EqualUnmodifiableListView) return _childrenParrent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_childrenParrent);
  }

  @override
  @JsonKey(name: 'is_root')
  final bool isRoot;
  @override
  final bool? self;
  @override
  @JsonKey(name: 'province_id')
  final String? pId;
  @override
  @JsonKey(name: 'address')
  final String? address;

  @override
  String toString() {
    return 'TreeViewModel(idJafa: $idJafa, id: $id, name: $name, image: $image, birthday: $birthday, gender: $gender, childrenParrent: $childrenParrent, isRoot: $isRoot, self: $self, pId: $pId, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeViewModelImpl &&
            (identical(other.idJafa, idJafa) || other.idJafa == idJafa) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            const DeepCollectionEquality()
                .equals(other._childrenParrent, _childrenParrent) &&
            (identical(other.isRoot, isRoot) || other.isRoot == isRoot) &&
            (identical(other.self, self) || other.self == self) &&
            (identical(other.pId, pId) || other.pId == pId) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idJafa,
      id,
      name,
      image,
      birthday,
      gender,
      const DeepCollectionEquality().hash(_childrenParrent),
      isRoot,
      self,
      pId,
      address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeViewModelImplCopyWith<_$TreeViewModelImpl> get copyWith =>
      __$$TreeViewModelImplCopyWithImpl<_$TreeViewModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TreeViewModelImplToJson(
      this,
    );
  }
}

abstract class _TreeViewModel extends TreeViewModel {
  const factory _TreeViewModel(
      {@JsonKey(name: 'id_jafa') final String? idJafa,
      @JsonKey(name: 'user_genealogy_id') final String? id,
      final String? name,
      final String? image,
      final String? birthday,
      final String? gender,
      @JsonKey(name: 'children') final List<Parrent> childrenParrent,
      @JsonKey(name: 'is_root') final bool isRoot,
      final bool? self,
      @JsonKey(name: 'province_id') final String? pId,
      @JsonKey(name: 'address') final String? address}) = _$TreeViewModelImpl;
  const _TreeViewModel._() : super._();

  factory _TreeViewModel.fromJson(Map<String, dynamic> json) =
      _$TreeViewModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_jafa')
  String? get idJafa;
  @override
  @JsonKey(name: 'user_genealogy_id')
  String? get id;
  @override
  String? get name;
  @override
  String? get image;
  @override
  String? get birthday;
  @override
  String? get gender;
  @override
  @JsonKey(name: 'children')
  List<Parrent> get childrenParrent;
  @override
  @JsonKey(name: 'is_root')
  bool get isRoot;
  @override
  bool? get self;
  @override
  @JsonKey(name: 'province_id')
  String? get pId;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(ignore: true)
  _$$TreeViewModelImplCopyWith<_$TreeViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Parrent _$ParrentFromJson(Map<String, dynamic> json) {
  return _Parrent.fromJson(json);
}

/// @nodoc
mixin _$Parrent {
  @JsonKey(name: 'user_genealogy_id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'relation_type')
  String? get relationType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParrentCopyWith<Parrent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParrentCopyWith<$Res> {
  factory $ParrentCopyWith(Parrent value, $Res Function(Parrent) then) =
      _$ParrentCopyWithImpl<$Res, Parrent>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_genealogy_id') String? id,
      @JsonKey(name: 'relation_type') String? relationType});
}

/// @nodoc
class _$ParrentCopyWithImpl<$Res, $Val extends Parrent>
    implements $ParrentCopyWith<$Res> {
  _$ParrentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? relationType = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      relationType: freezed == relationType
          ? _value.relationType
          : relationType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParrentImplCopyWith<$Res> implements $ParrentCopyWith<$Res> {
  factory _$$ParrentImplCopyWith(
          _$ParrentImpl value, $Res Function(_$ParrentImpl) then) =
      __$$ParrentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_genealogy_id') String? id,
      @JsonKey(name: 'relation_type') String? relationType});
}

/// @nodoc
class __$$ParrentImplCopyWithImpl<$Res>
    extends _$ParrentCopyWithImpl<$Res, _$ParrentImpl>
    implements _$$ParrentImplCopyWith<$Res> {
  __$$ParrentImplCopyWithImpl(
      _$ParrentImpl _value, $Res Function(_$ParrentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? relationType = freezed,
  }) {
    return _then(_$ParrentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      relationType: freezed == relationType
          ? _value.relationType
          : relationType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParrentImpl extends _Parrent {
  const _$ParrentImpl(
      {@JsonKey(name: 'user_genealogy_id') this.id,
      @JsonKey(name: 'relation_type') this.relationType})
      : super._();

  factory _$ParrentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParrentImplFromJson(json);

  @override
  @JsonKey(name: 'user_genealogy_id')
  final String? id;
  @override
  @JsonKey(name: 'relation_type')
  final String? relationType;

  @override
  String toString() {
    return 'Parrent(id: $id, relationType: $relationType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParrentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.relationType, relationType) ||
                other.relationType == relationType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, relationType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParrentImplCopyWith<_$ParrentImpl> get copyWith =>
      __$$ParrentImplCopyWithImpl<_$ParrentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParrentImplToJson(
      this,
    );
  }
}

abstract class _Parrent extends Parrent {
  const factory _Parrent(
          {@JsonKey(name: 'user_genealogy_id') final String? id,
          @JsonKey(name: 'relation_type') final String? relationType}) =
      _$ParrentImpl;
  const _Parrent._() : super._();

  factory _Parrent.fromJson(Map<String, dynamic> json) = _$ParrentImpl.fromJson;

  @override
  @JsonKey(name: 'user_genealogy_id')
  String? get id;
  @override
  @JsonKey(name: 'relation_type')
  String? get relationType;
  @override
  @JsonKey(ignore: true)
  _$$ParrentImplCopyWith<_$ParrentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
