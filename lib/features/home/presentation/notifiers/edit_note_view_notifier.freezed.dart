// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_note_view_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditNoteState {

 TextEditingController get titleController; TextEditingController get noteController; bool get loading; bool get enabled; bool get pop; Object? get error; Note? get note;
/// Create a copy of EditNoteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditNoteStateCopyWith<EditNoteState> get copyWith => _$EditNoteStateCopyWithImpl<EditNoteState>(this as EditNoteState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditNoteState&&(identical(other.titleController, titleController) || other.titleController == titleController)&&(identical(other.noteController, noteController) || other.noteController == noteController)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.pop, pop) || other.pop == pop)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,titleController,noteController,loading,enabled,pop,const DeepCollectionEquality().hash(error),note);

@override
String toString() {
  return 'EditNoteState(titleController: $titleController, noteController: $noteController, loading: $loading, enabled: $enabled, pop: $pop, error: $error, note: $note)';
}


}

/// @nodoc
abstract mixin class $EditNoteStateCopyWith<$Res>  {
  factory $EditNoteStateCopyWith(EditNoteState value, $Res Function(EditNoteState) _then) = _$EditNoteStateCopyWithImpl;
@useResult
$Res call({
 TextEditingController titleController, TextEditingController noteController, bool loading, bool enabled, bool pop, Object? error, Note? note
});


$NoteCopyWith<$Res>? get note;

}
/// @nodoc
class _$EditNoteStateCopyWithImpl<$Res>
    implements $EditNoteStateCopyWith<$Res> {
  _$EditNoteStateCopyWithImpl(this._self, this._then);

  final EditNoteState _self;
  final $Res Function(EditNoteState) _then;

/// Create a copy of EditNoteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? titleController = null,Object? noteController = null,Object? loading = null,Object? enabled = null,Object? pop = null,Object? error = freezed,Object? note = freezed,}) {
  return _then(_self.copyWith(
titleController: null == titleController ? _self.titleController : titleController // ignore: cast_nullable_to_non_nullable
as TextEditingController,noteController: null == noteController ? _self.noteController : noteController // ignore: cast_nullable_to_non_nullable
as TextEditingController,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,pop: null == pop ? _self.pop : pop // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as Note?,
  ));
}
/// Create a copy of EditNoteState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteCopyWith<$Res>? get note {
    if (_self.note == null) {
    return null;
  }

  return $NoteCopyWith<$Res>(_self.note!, (value) {
    return _then(_self.copyWith(note: value));
  });
}
}


/// @nodoc


class _EditNoteState implements EditNoteState {
  const _EditNoteState({required this.titleController, required this.noteController, this.loading = false, this.enabled = false, this.pop = false, this.error, this.note});
  

@override final  TextEditingController titleController;
@override final  TextEditingController noteController;
@override@JsonKey() final  bool loading;
@override@JsonKey() final  bool enabled;
@override@JsonKey() final  bool pop;
@override final  Object? error;
@override final  Note? note;

/// Create a copy of EditNoteState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditNoteStateCopyWith<_EditNoteState> get copyWith => __$EditNoteStateCopyWithImpl<_EditNoteState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditNoteState&&(identical(other.titleController, titleController) || other.titleController == titleController)&&(identical(other.noteController, noteController) || other.noteController == noteController)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.pop, pop) || other.pop == pop)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,titleController,noteController,loading,enabled,pop,const DeepCollectionEquality().hash(error),note);

@override
String toString() {
  return 'EditNoteState(titleController: $titleController, noteController: $noteController, loading: $loading, enabled: $enabled, pop: $pop, error: $error, note: $note)';
}


}

/// @nodoc
abstract mixin class _$EditNoteStateCopyWith<$Res> implements $EditNoteStateCopyWith<$Res> {
  factory _$EditNoteStateCopyWith(_EditNoteState value, $Res Function(_EditNoteState) _then) = __$EditNoteStateCopyWithImpl;
@override @useResult
$Res call({
 TextEditingController titleController, TextEditingController noteController, bool loading, bool enabled, bool pop, Object? error, Note? note
});


@override $NoteCopyWith<$Res>? get note;

}
/// @nodoc
class __$EditNoteStateCopyWithImpl<$Res>
    implements _$EditNoteStateCopyWith<$Res> {
  __$EditNoteStateCopyWithImpl(this._self, this._then);

  final _EditNoteState _self;
  final $Res Function(_EditNoteState) _then;

/// Create a copy of EditNoteState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? titleController = null,Object? noteController = null,Object? loading = null,Object? enabled = null,Object? pop = null,Object? error = freezed,Object? note = freezed,}) {
  return _then(_EditNoteState(
titleController: null == titleController ? _self.titleController : titleController // ignore: cast_nullable_to_non_nullable
as TextEditingController,noteController: null == noteController ? _self.noteController : noteController // ignore: cast_nullable_to_non_nullable
as TextEditingController,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,pop: null == pop ? _self.pop : pop // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as Note?,
  ));
}

/// Create a copy of EditNoteState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteCopyWith<$Res>? get note {
    if (_self.note == null) {
    return null;
  }

  return $NoteCopyWith<$Res>(_self.note!, (value) {
    return _then(_self.copyWith(note: value));
  });
}
}

// dart format on
