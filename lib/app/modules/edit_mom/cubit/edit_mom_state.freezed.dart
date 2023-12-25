// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_mom_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditMomState {
  List<User>? get wifesOfDad => throw _privateConstructorUsedError;
  User? get selectedMom => throw _privateConstructorUsedError;
  bool get saveDone => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditMomStateCopyWith<EditMomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditMomStateCopyWith<$Res> {
  factory $EditMomStateCopyWith(
          EditMomState value, $Res Function(EditMomState) then) =
      _$EditMomStateCopyWithImpl<$Res, EditMomState>;
  @useResult
  $Res call(
      {List<User>? wifesOfDad,
      User? selectedMom,
      bool saveDone,
      Object? error});
}

/// @nodoc
class _$EditMomStateCopyWithImpl<$Res, $Val extends EditMomState>
    implements $EditMomStateCopyWith<$Res> {
  _$EditMomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wifesOfDad = freezed,
    Object? selectedMom = freezed,
    Object? saveDone = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      wifesOfDad: freezed == wifesOfDad
          ? _value.wifesOfDad
          : wifesOfDad // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      selectedMom: freezed == selectedMom
          ? _value.selectedMom
          : selectedMom // ignore: cast_nullable_to_non_nullable
              as User?,
      saveDone: null == saveDone
          ? _value.saveDone
          : saveDone // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditMomStateCopyWith<$Res>
    implements $EditMomStateCopyWith<$Res> {
  factory _$$_EditMomStateCopyWith(
          _$_EditMomState value, $Res Function(_$_EditMomState) then) =
      __$$_EditMomStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<User>? wifesOfDad,
      User? selectedMom,
      bool saveDone,
      Object? error});
}

/// @nodoc
class __$$_EditMomStateCopyWithImpl<$Res>
    extends _$EditMomStateCopyWithImpl<$Res, _$_EditMomState>
    implements _$$_EditMomStateCopyWith<$Res> {
  __$$_EditMomStateCopyWithImpl(
      _$_EditMomState _value, $Res Function(_$_EditMomState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wifesOfDad = freezed,
    Object? selectedMom = freezed,
    Object? saveDone = null,
    Object? error = freezed,
  }) {
    return _then(_$_EditMomState(
      wifesOfDad: freezed == wifesOfDad
          ? _value._wifesOfDad
          : wifesOfDad // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      selectedMom: freezed == selectedMom
          ? _value.selectedMom
          : selectedMom // ignore: cast_nullable_to_non_nullable
              as User?,
      saveDone: null == saveDone
          ? _value.saveDone
          : saveDone // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$_EditMomState extends _EditMomState {
  const _$_EditMomState(
      {final List<User>? wifesOfDad,
      this.selectedMom,
      this.saveDone = false,
      this.error})
      : _wifesOfDad = wifesOfDad,
        super._();

  final List<User>? _wifesOfDad;
  @override
  List<User>? get wifesOfDad {
    final value = _wifesOfDad;
    if (value == null) return null;
    if (_wifesOfDad is EqualUnmodifiableListView) return _wifesOfDad;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final User? selectedMom;
  @override
  @JsonKey()
  final bool saveDone;
  @override
  final Object? error;

  @override
  String toString() {
    return 'EditMomState(wifesOfDad: $wifesOfDad, selectedMom: $selectedMom, saveDone: $saveDone, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditMomState &&
            const DeepCollectionEquality()
                .equals(other._wifesOfDad, _wifesOfDad) &&
            (identical(other.selectedMom, selectedMom) ||
                other.selectedMom == selectedMom) &&
            (identical(other.saveDone, saveDone) ||
                other.saveDone == saveDone) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_wifesOfDad),
      selectedMom,
      saveDone,
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditMomStateCopyWith<_$_EditMomState> get copyWith =>
      __$$_EditMomStateCopyWithImpl<_$_EditMomState>(this, _$identity);
}

abstract class _EditMomState extends EditMomState {
  const factory _EditMomState(
      {final List<User>? wifesOfDad,
      final User? selectedMom,
      final bool saveDone,
      final Object? error}) = _$_EditMomState;
  const _EditMomState._() : super._();

  @override
  List<User>? get wifesOfDad;
  @override
  User? get selectedMom;
  @override
  bool get saveDone;
  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$_EditMomStateCopyWith<_$_EditMomState> get copyWith =>
      throw _privateConstructorUsedError;
}
