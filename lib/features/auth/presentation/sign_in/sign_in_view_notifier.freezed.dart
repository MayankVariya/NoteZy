// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_view_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignInState {

 TextEditingController get emailController; TextEditingController get passwordController; bool get loading; bool get success; Object? get error; bool get showPassword; bool get enableBtn;
/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInStateCopyWith<SignInState> get copyWith => _$SignInStateCopyWithImpl<SignInState>(this as SignInState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInState&&(identical(other.emailController, emailController) || other.emailController == emailController)&&(identical(other.passwordController, passwordController) || other.passwordController == passwordController)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.showPassword, showPassword) || other.showPassword == showPassword)&&(identical(other.enableBtn, enableBtn) || other.enableBtn == enableBtn));
}


@override
int get hashCode => Object.hash(runtimeType,emailController,passwordController,loading,success,const DeepCollectionEquality().hash(error),showPassword,enableBtn);

@override
String toString() {
  return 'SignInState(emailController: $emailController, passwordController: $passwordController, loading: $loading, success: $success, error: $error, showPassword: $showPassword, enableBtn: $enableBtn)';
}


}

/// @nodoc
abstract mixin class $SignInStateCopyWith<$Res>  {
  factory $SignInStateCopyWith(SignInState value, $Res Function(SignInState) _then) = _$SignInStateCopyWithImpl;
@useResult
$Res call({
 TextEditingController emailController, TextEditingController passwordController, bool loading, bool success, Object? error, bool showPassword, bool enableBtn
});




}
/// @nodoc
class _$SignInStateCopyWithImpl<$Res>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._self, this._then);

  final SignInState _self;
  final $Res Function(SignInState) _then;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? emailController = null,Object? passwordController = null,Object? loading = null,Object? success = null,Object? error = freezed,Object? showPassword = null,Object? enableBtn = null,}) {
  return _then(_self.copyWith(
emailController: null == emailController ? _self.emailController : emailController // ignore: cast_nullable_to_non_nullable
as TextEditingController,passwordController: null == passwordController ? _self.passwordController : passwordController // ignore: cast_nullable_to_non_nullable
as TextEditingController,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,showPassword: null == showPassword ? _self.showPassword : showPassword // ignore: cast_nullable_to_non_nullable
as bool,enableBtn: null == enableBtn ? _self.enableBtn : enableBtn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _SignInState implements SignInState {
  const _SignInState({required this.emailController, required this.passwordController, this.loading = false, this.success = false, this.error, this.showPassword = false, this.enableBtn = false});
  

@override final  TextEditingController emailController;
@override final  TextEditingController passwordController;
@override@JsonKey() final  bool loading;
@override@JsonKey() final  bool success;
@override final  Object? error;
@override@JsonKey() final  bool showPassword;
@override@JsonKey() final  bool enableBtn;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignInStateCopyWith<_SignInState> get copyWith => __$SignInStateCopyWithImpl<_SignInState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInState&&(identical(other.emailController, emailController) || other.emailController == emailController)&&(identical(other.passwordController, passwordController) || other.passwordController == passwordController)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.showPassword, showPassword) || other.showPassword == showPassword)&&(identical(other.enableBtn, enableBtn) || other.enableBtn == enableBtn));
}


@override
int get hashCode => Object.hash(runtimeType,emailController,passwordController,loading,success,const DeepCollectionEquality().hash(error),showPassword,enableBtn);

@override
String toString() {
  return 'SignInState(emailController: $emailController, passwordController: $passwordController, loading: $loading, success: $success, error: $error, showPassword: $showPassword, enableBtn: $enableBtn)';
}


}

/// @nodoc
abstract mixin class _$SignInStateCopyWith<$Res> implements $SignInStateCopyWith<$Res> {
  factory _$SignInStateCopyWith(_SignInState value, $Res Function(_SignInState) _then) = __$SignInStateCopyWithImpl;
@override @useResult
$Res call({
 TextEditingController emailController, TextEditingController passwordController, bool loading, bool success, Object? error, bool showPassword, bool enableBtn
});




}
/// @nodoc
class __$SignInStateCopyWithImpl<$Res>
    implements _$SignInStateCopyWith<$Res> {
  __$SignInStateCopyWithImpl(this._self, this._then);

  final _SignInState _self;
  final $Res Function(_SignInState) _then;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emailController = null,Object? passwordController = null,Object? loading = null,Object? success = null,Object? error = freezed,Object? showPassword = null,Object? enableBtn = null,}) {
  return _then(_SignInState(
emailController: null == emailController ? _self.emailController : emailController // ignore: cast_nullable_to_non_nullable
as TextEditingController,passwordController: null == passwordController ? _self.passwordController : passwordController // ignore: cast_nullable_to_non_nullable
as TextEditingController,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error ,showPassword: null == showPassword ? _self.showPassword : showPassword // ignore: cast_nullable_to_non_nullable
as bool,enableBtn: null == enableBtn ? _self.enableBtn : enableBtn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
