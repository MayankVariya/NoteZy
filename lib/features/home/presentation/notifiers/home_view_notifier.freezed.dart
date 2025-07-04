// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_view_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 bool get loading; Object? get error; String? get currentUserId; bool get loggedOut; List<Note> get notes;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.loading, loading) || other.loading == loading)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId)&&(identical(other.loggedOut, loggedOut) || other.loggedOut == loggedOut)&&const DeepCollectionEquality().equals(other.notes, notes));
}


@override
int get hashCode => Object.hash(runtimeType,loading,const DeepCollectionEquality().hash(error),currentUserId,loggedOut,const DeepCollectionEquality().hash(notes));

@override
String toString() {
  return 'HomeState(loading: $loading, error: $error, currentUserId: $currentUserId, loggedOut: $loggedOut, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 bool loading, Object? error, String? currentUserId, bool loggedOut, List<Note> notes
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loading = null,Object? error = freezed,Object? currentUserId = freezed,Object? loggedOut = null,Object? notes = null,}) {
  return _then(_self.copyWith(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,currentUserId: freezed == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String?,loggedOut: null == loggedOut ? _self.loggedOut : loggedOut // ignore: cast_nullable_to_non_nullable
as bool,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as List<Note>,
  ));
}

}


/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.loading = false, this.error, this.currentUserId, this.loggedOut = false, final  List<Note> notes = const []}): _notes = notes;
  

@override@JsonKey() final  bool loading;
@override final  Object? error;
@override final  String? currentUserId;
@override@JsonKey() final  bool loggedOut;
 final  List<Note> _notes;
@override@JsonKey() List<Note> get notes {
  if (_notes is EqualUnmodifiableListView) return _notes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notes);
}


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.loading, loading) || other.loading == loading)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId)&&(identical(other.loggedOut, loggedOut) || other.loggedOut == loggedOut)&&const DeepCollectionEquality().equals(other._notes, _notes));
}


@override
int get hashCode => Object.hash(runtimeType,loading,const DeepCollectionEquality().hash(error),currentUserId,loggedOut,const DeepCollectionEquality().hash(_notes));

@override
String toString() {
  return 'HomeState(loading: $loading, error: $error, currentUserId: $currentUserId, loggedOut: $loggedOut, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 bool loading, Object? error, String? currentUserId, bool loggedOut, List<Note> notes
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loading = null,Object? error = freezed,Object? currentUserId = freezed,Object? loggedOut = null,Object? notes = null,}) {
  return _then(_HomeState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,currentUserId: freezed == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String?,loggedOut: null == loggedOut ? _self.loggedOut : loggedOut // ignore: cast_nullable_to_non_nullable
as bool,notes: null == notes ? _self._notes : notes // ignore: cast_nullable_to_non_nullable
as List<Note>,
  ));
}


}

// dart format on
