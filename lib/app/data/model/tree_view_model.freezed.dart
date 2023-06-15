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
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  List<Parrent>? get childrenParrent => throw _privateConstructorUsedError;

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
      {int? id, String? name, String? avatar, List<Parrent>? childrenParrent});
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
    Object? childrenParrent = freezed,
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
      childrenParrent: freezed == childrenParrent
          ? _value.childrenParrent
          : childrenParrent // ignore: cast_nullable_to_non_nullable
              as List<Parrent>?,
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
      {int? id, String? name, String? avatar, List<Parrent>? childrenParrent});
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
    Object? childrenParrent = freezed,
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
      childrenParrent: freezed == childrenParrent
          ? _value._childrenParrent
          : childrenParrent // ignore: cast_nullable_to_non_nullable
              as List<Parrent>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TreeViewModel extends _TreeViewModel {
  const _$_TreeViewModel(
      {this.id, this.name, this.avatar, final List<Parrent>? childrenParrent})
      : _childrenParrent = childrenParrent,
        super._();

  factory _$_TreeViewModel.fromJson(Map<String, dynamic> json) =>
      _$$_TreeViewModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? avatar;
  final List<Parrent>? _childrenParrent;
  @override
  List<Parrent>? get childrenParrent {
    final value = _childrenParrent;
    if (value == null) return null;
    if (_childrenParrent is EqualUnmodifiableListView) return _childrenParrent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TreeViewModel(id: $id, name: $name, avatar: $avatar, childrenParrent: $childrenParrent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TreeViewModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            const DeepCollectionEquality()
                .equals(other._childrenParrent, _childrenParrent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatar,
      const DeepCollectionEquality().hash(_childrenParrent));

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
      {final int? id,
      final String? name,
      final String? avatar,
      final List<Parrent>? childrenParrent}) = _$_TreeViewModel;
  const _TreeViewModel._() : super._();

  factory _TreeViewModel.fromJson(Map<String, dynamic> json) =
      _$_TreeViewModel.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get avatar;
  @override
  List<Parrent>? get childrenParrent;
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
  int? get id => throw _privateConstructorUsedError;
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
  $Res call({int? id, String? relationType});
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
  $Res call({int? id, String? relationType});
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
  const _$_Parrent({this.id, this.relationType}) : super._();

  factory _$_Parrent.fromJson(Map<String, dynamic> json) =>
      _$$_ParrentFromJson(json);

  @override
  final int? id;
  @override
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
  const factory _Parrent({final int? id, final String? relationType}) =
      _$_Parrent;
  const _Parrent._() : super._();

  factory _Parrent.fromJson(Map<String, dynamic> json) = _$_Parrent.fromJson;

  @override
  int? get id;
  @override
  String? get relationType;
  @override
  @JsonKey(ignore: true)
  _$$_ParrentCopyWith<_$_Parrent> get copyWith =>
      throw _privateConstructorUsedError;
}

Couple _$CoupleFromJson(Map<String, dynamic> json) {
  return _Couple.fromJson(json);
}

/// @nodoc
mixin _$Couple {
  int? get idaPerson => throw _privateConstructorUsedError;
  List<int>? get listIdvk => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoupleCopyWith<Couple> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoupleCopyWith<$Res> {
  factory $CoupleCopyWith(Couple value, $Res Function(Couple) then) =
      _$CoupleCopyWithImpl<$Res, Couple>;
  @useResult
  $Res call({int? idaPerson, List<int>? listIdvk});
}

/// @nodoc
class _$CoupleCopyWithImpl<$Res, $Val extends Couple>
    implements $CoupleCopyWith<$Res> {
  _$CoupleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idaPerson = freezed,
    Object? listIdvk = freezed,
  }) {
    return _then(_value.copyWith(
      idaPerson: freezed == idaPerson
          ? _value.idaPerson
          : idaPerson // ignore: cast_nullable_to_non_nullable
              as int?,
      listIdvk: freezed == listIdvk
          ? _value.listIdvk
          : listIdvk // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CoupleCopyWith<$Res> implements $CoupleCopyWith<$Res> {
  factory _$$_CoupleCopyWith(_$_Couple value, $Res Function(_$_Couple) then) =
      __$$_CoupleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? idaPerson, List<int>? listIdvk});
}

/// @nodoc
class __$$_CoupleCopyWithImpl<$Res>
    extends _$CoupleCopyWithImpl<$Res, _$_Couple>
    implements _$$_CoupleCopyWith<$Res> {
  __$$_CoupleCopyWithImpl(_$_Couple _value, $Res Function(_$_Couple) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idaPerson = freezed,
    Object? listIdvk = freezed,
  }) {
    return _then(_$_Couple(
      idaPerson: freezed == idaPerson
          ? _value.idaPerson
          : idaPerson // ignore: cast_nullable_to_non_nullable
              as int?,
      listIdvk: freezed == listIdvk
          ? _value._listIdvk
          : listIdvk // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Couple extends _Couple {
  const _$_Couple({this.idaPerson, final List<int>? listIdvk})
      : _listIdvk = listIdvk,
        super._();

  factory _$_Couple.fromJson(Map<String, dynamic> json) =>
      _$$_CoupleFromJson(json);

  @override
  final int? idaPerson;
  final List<int>? _listIdvk;
  @override
  List<int>? get listIdvk {
    final value = _listIdvk;
    if (value == null) return null;
    if (_listIdvk is EqualUnmodifiableListView) return _listIdvk;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Couple(idaPerson: $idaPerson, listIdvk: $listIdvk)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Couple &&
            (identical(other.idaPerson, idaPerson) ||
                other.idaPerson == idaPerson) &&
            const DeepCollectionEquality().equals(other._listIdvk, _listIdvk));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, idaPerson, const DeepCollectionEquality().hash(_listIdvk));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoupleCopyWith<_$_Couple> get copyWith =>
      __$$_CoupleCopyWithImpl<_$_Couple>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoupleToJson(
      this,
    );
  }
}

abstract class _Couple extends Couple {
  const factory _Couple({final int? idaPerson, final List<int>? listIdvk}) =
      _$_Couple;
  const _Couple._() : super._();

  factory _Couple.fromJson(Map<String, dynamic> json) = _$_Couple.fromJson;

  @override
  int? get idaPerson;
  @override
  List<int>? get listIdvk;
  @override
  @JsonKey(ignore: true)
  _$$_CoupleCopyWith<_$_Couple> get copyWith =>
      throw _privateConstructorUsedError;
}
