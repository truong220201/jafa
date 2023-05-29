// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  Object? get showUserListError => throw _privateConstructorUsedError;
  bool get hasInfoJaFa => throw _privateConstructorUsedError;
  List<UserModel> get userList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {Object? showUserListError, bool hasInfoJaFa, List<UserModel> userList});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showUserListError = freezed,
    Object? hasInfoJaFa = null,
    Object? userList = null,
  }) {
    return _then(_value.copyWith(
      showUserListError: freezed == showUserListError
          ? _value.showUserListError
          : showUserListError,
      hasInfoJaFa: null == hasInfoJaFa
          ? _value.hasInfoJaFa
          : hasInfoJaFa // ignore: cast_nullable_to_non_nullable
              as bool,
      userList: null == userList
          ? _value.userList
          : userList // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Object? showUserListError, bool hasInfoJaFa, List<UserModel> userList});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showUserListError = freezed,
    Object? hasInfoJaFa = null,
    Object? userList = null,
  }) {
    return _then(_$_HomeState(
      showUserListError: freezed == showUserListError
          ? _value.showUserListError
          : showUserListError,
      hasInfoJaFa: null == hasInfoJaFa
          ? _value.hasInfoJaFa
          : hasInfoJaFa // ignore: cast_nullable_to_non_nullable
              as bool,
      userList: null == userList
          ? _value._userList
          : userList // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ));
  }
}

/// @nodoc

class _$_HomeState extends _HomeState {
  const _$_HomeState(
      {this.showUserListError,
      this.hasInfoJaFa = false,
      final List<UserModel> userList = const []})
      : _userList = userList,
        super._();

  @override
  final Object? showUserListError;
  @override
  @JsonKey()
  final bool hasInfoJaFa;
  final List<UserModel> _userList;
  @override
  @JsonKey()
  List<UserModel> get userList {
    if (_userList is EqualUnmodifiableListView) return _userList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userList);
  }

  @override
  String toString() {
    return 'HomeState(showUserListError: $showUserListError, hasInfoJaFa: $hasInfoJaFa, userList: $userList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            const DeepCollectionEquality()
                .equals(other.showUserListError, showUserListError) &&
            (identical(other.hasInfoJaFa, hasInfoJaFa) ||
                other.hasInfoJaFa == hasInfoJaFa) &&
            const DeepCollectionEquality().equals(other._userList, _userList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(showUserListError),
      hasInfoJaFa,
      const DeepCollectionEquality().hash(_userList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  const factory _HomeState(
      {final Object? showUserListError,
      final bool hasInfoJaFa,
      final List<UserModel> userList}) = _$_HomeState;
  const _HomeState._() : super._();

  @override
  Object? get showUserListError;
  @override
  bool get hasInfoJaFa;
  @override
  List<UserModel> get userList;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
