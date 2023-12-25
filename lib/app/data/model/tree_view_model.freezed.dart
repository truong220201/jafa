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
  @JsonKey(name: 'user_genealogy_id')
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'children')
  List<Parrent> get childrenParrent => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_root')
  bool get isRoot => throw _privateConstructorUsedError;
  bool? get self => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'user_genealogy_id') int? id,
      String? name,
      String? avatar,
      String? birthday,
      String? gender,
      @JsonKey(name: 'children') List<Parrent> childrenParrent,
      @JsonKey(name: 'is_root') bool isRoot,
      bool? self});
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
    Object? id = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? birthday = freezed,
    Object? gender = freezed,
    Object? childrenParrent = null,
    Object? isRoot = null,
    Object? self = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TreeViewModelCopyWith<$Res>
    implements $TreeViewModelCopyWith<$Res> {
  factory _$$_TreeViewModelCopyWith(
          _$_TreeViewModel value, $Res Function(_$_TreeViewModel) then) =
      __$$_TreeViewModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_genealogy_id') int? id,
      String? name,
      String? avatar,
      String? birthday,
      String? gender,
      @JsonKey(name: 'children') List<Parrent> childrenParrent,
      @JsonKey(name: 'is_root') bool isRoot,
      bool? self});
}

/// @nodoc
class __$$_TreeViewModelCopyWithImpl<$Res>
    extends _$TreeViewModelCopyWithImpl<$Res, _$_TreeViewModel>
    implements _$$_TreeViewModelCopyWith<$Res> {
  __$$_TreeViewModelCopyWithImpl(
      _$_TreeViewModel _value, $Res Function(_$_TreeViewModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? birthday = freezed,
    Object? gender = freezed,
    Object? childrenParrent = null,
    Object? isRoot = null,
    Object? self = freezed,
  }) {
    return _then(_$_TreeViewModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TreeViewModel extends _TreeViewModel {
  const _$_TreeViewModel(
      {@JsonKey(name: 'user_genealogy_id') this.id,
      this.name,
      this.avatar,
      this.birthday,
      this.gender,
      @JsonKey(name: 'children') final List<Parrent> childrenParrent = const [],
      @JsonKey(name: 'is_root') this.isRoot = false,
      this.self})
      : _childrenParrent = childrenParrent,
        super._();

  factory _$_TreeViewModel.fromJson(Map<String, dynamic> json) =>
      _$$_TreeViewModelFromJson(json);

  @override
  @JsonKey(name: 'user_genealogy_id')
  final int? id;
  @override
  final String? name;
  @override
  final String? avatar;
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
  String toString() {
    return 'TreeViewModel(id: $id, name: $name, avatar: $avatar, birthday: $birthday, gender: $gender, childrenParrent: $childrenParrent, isRoot: $isRoot, self: $self)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TreeViewModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            const DeepCollectionEquality()
                .equals(other._childrenParrent, _childrenParrent) &&
            (identical(other.isRoot, isRoot) || other.isRoot == isRoot) &&
            (identical(other.self, self) || other.self == self));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      avatar,
      birthday,
      gender,
      const DeepCollectionEquality().hash(_childrenParrent),
      isRoot,
      self);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TreeViewModelCopyWith<_$_TreeViewModel> get copyWith =>
      __$$_TreeViewModelCopyWithImpl<_$_TreeViewModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TreeViewModelToJson(
      this,
    );
  }
}

abstract class _TreeViewModel extends TreeViewModel {
  const factory _TreeViewModel(
      {@JsonKey(name: 'user_genealogy_id') final int? id,
      final String? name,
      final String? avatar,
      final String? birthday,
      final String? gender,
      @JsonKey(name: 'children') final List<Parrent> childrenParrent,
      @JsonKey(name: 'is_root') final bool isRoot,
      final bool? self}) = _$_TreeViewModel;
  const _TreeViewModel._() : super._();

  factory _TreeViewModel.fromJson(Map<String, dynamic> json) =
      _$_TreeViewModel.fromJson;

  @override
  @JsonKey(name: 'user_genealogy_id')
  int? get id;
  @override
  String? get name;
  @override
  String? get avatar;
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
  @JsonKey(ignore: true)
  _$$_TreeViewModelCopyWith<_$_TreeViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Parrent _$ParrentFromJson(Map<String, dynamic> json) {
  return _Parrent.fromJson(json);
}

/// @nodoc
mixin _$Parrent {
  @JsonKey(name: 'user_genealogy_id')
  int? get id => throw _privateConstructorUsedError;
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
      {@JsonKey(name: 'user_genealogy_id') int? id,
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
              as int?,
      relationType: freezed == relationType
          ? _value.relationType
          : relationType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ParrentCopyWith<$Res> implements $ParrentCopyWith<$Res> {
  factory _$$_ParrentCopyWith(
          _$_Parrent value, $Res Function(_$_Parrent) then) =
      __$$_ParrentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_genealogy_id') int? id,
      @JsonKey(name: 'relation_type') String? relationType});
}

/// @nodoc
class __$$_ParrentCopyWithImpl<$Res>
    extends _$ParrentCopyWithImpl<$Res, _$_Parrent>
    implements _$$_ParrentCopyWith<$Res> {
  __$$_ParrentCopyWithImpl(_$_Parrent _value, $Res Function(_$_Parrent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? relationType = freezed,
  }) {
    return _then(_$_Parrent(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      relationType: freezed == relationType
          ? _value.relationType
          : relationType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Parrent extends _Parrent {
  const _$_Parrent(
      {@JsonKey(name: 'user_genealogy_id') this.id,
      @JsonKey(name: 'relation_type') this.relationType})
      : super._();

  factory _$_Parrent.fromJson(Map<String, dynamic> json) =>
      _$$_ParrentFromJson(json);

  @override
  @JsonKey(name: 'user_genealogy_id')
  final int? id;
  @override
  @JsonKey(name: 'relation_type')
  final String? relationType;

  @override
  String toString() {
    return 'Parrent(id: $id, relationType: $relationType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Parrent &&
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
  _$$_ParrentCopyWith<_$_Parrent> get copyWith =>
      __$$_ParrentCopyWithImpl<_$_Parrent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ParrentToJson(
      this,
    );
  }
}

abstract class _Parrent extends Parrent {
  const factory _Parrent(
      {@JsonKey(name: 'user_genealogy_id') final int? id,
      @JsonKey(name: 'relation_type') final String? relationType}) = _$_Parrent;
  const _Parrent._() : super._();

  factory _Parrent.fromJson(Map<String, dynamic> json) = _$_Parrent.fromJson;

  @override
  @JsonKey(name: 'user_genealogy_id')
  int? get id;
  @override
  @JsonKey(name: 'relation_type')
  String? get relationType;
  @override
  @JsonKey(ignore: true)
  _$$_ParrentCopyWith<_$_Parrent> get copyWith =>
      throw _privateConstructorUsedError;
}
