// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_by_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TreeByListState {
  int? get idJafa => throw _privateConstructorUsedError;
  List<TimeLine>? get timeLine => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TreeByListStateCopyWith<TreeByListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreeByListStateCopyWith<$Res> {
  factory $TreeByListStateCopyWith(
          TreeByListState value, $Res Function(TreeByListState) then) =
      _$TreeByListStateCopyWithImpl<$Res, TreeByListState>;
  @useResult
  $Res call(
      {int? idJafa, List<TimeLine>? timeLine, Object? error, bool isLoading});
}

/// @nodoc
class _$TreeByListStateCopyWithImpl<$Res, $Val extends TreeByListState>
    implements $TreeByListStateCopyWith<$Res> {
  _$TreeByListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idJafa = freezed,
    Object? timeLine = freezed,
    Object? error = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      idJafa: freezed == idJafa
          ? _value.idJafa
          : idJafa // ignore: cast_nullable_to_non_nullable
              as int?,
      timeLine: freezed == timeLine
          ? _value.timeLine
          : timeLine // ignore: cast_nullable_to_non_nullable
              as List<TimeLine>?,
      error: freezed == error ? _value.error : error,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TreeByListStateCopyWith<$Res>
    implements $TreeByListStateCopyWith<$Res> {
  factory _$$_TreeByListStateCopyWith(
          _$_TreeByListState value, $Res Function(_$_TreeByListState) then) =
      __$$_TreeByListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? idJafa, List<TimeLine>? timeLine, Object? error, bool isLoading});
}

/// @nodoc
class __$$_TreeByListStateCopyWithImpl<$Res>
    extends _$TreeByListStateCopyWithImpl<$Res, _$_TreeByListState>
    implements _$$_TreeByListStateCopyWith<$Res> {
  __$$_TreeByListStateCopyWithImpl(
      _$_TreeByListState _value, $Res Function(_$_TreeByListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idJafa = freezed,
    Object? timeLine = freezed,
    Object? error = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$_TreeByListState(
      idJafa: freezed == idJafa
          ? _value.idJafa
          : idJafa // ignore: cast_nullable_to_non_nullable
              as int?,
      timeLine: freezed == timeLine
          ? _value._timeLine
          : timeLine // ignore: cast_nullable_to_non_nullable
              as List<TimeLine>?,
      error: freezed == error ? _value.error : error,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TreeByListState extends _TreeByListState {
  const _$_TreeByListState(
      {this.idJafa,
      final List<TimeLine>? timeLine,
      this.error,
      this.isLoading = false})
      : _timeLine = timeLine,
        super._();

  @override
  final int? idJafa;
  final List<TimeLine>? _timeLine;
  @override
  List<TimeLine>? get timeLine {
    final value = _timeLine;
    if (value == null) return null;
    if (_timeLine is EqualUnmodifiableListView) return _timeLine;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Object? error;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'TreeByListState(idJafa: $idJafa, timeLine: $timeLine, error: $error, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TreeByListState &&
            (identical(other.idJafa, idJafa) || other.idJafa == idJafa) &&
            const DeepCollectionEquality().equals(other._timeLine, _timeLine) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      idJafa,
      const DeepCollectionEquality().hash(_timeLine),
      const DeepCollectionEquality().hash(error),
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TreeByListStateCopyWith<_$_TreeByListState> get copyWith =>
      __$$_TreeByListStateCopyWithImpl<_$_TreeByListState>(this, _$identity);
}

abstract class _TreeByListState extends TreeByListState {
  const factory _TreeByListState(
      {final int? idJafa,
      final List<TimeLine>? timeLine,
      final Object? error,
      final bool isLoading}) = _$_TreeByListState;
  const _TreeByListState._() : super._();

  @override
  int? get idJafa;
  @override
  List<TimeLine>? get timeLine;
  @override
  Object? get error;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_TreeByListStateCopyWith<_$_TreeByListState> get copyWith =>
      throw _privateConstructorUsedError;
}
