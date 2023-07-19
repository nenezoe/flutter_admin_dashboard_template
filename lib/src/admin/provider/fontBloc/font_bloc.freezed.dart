// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'font_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FontEvent {
  String get fontFamilyName => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fontFamilyName) changeFont,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fontFamilyName)? changeFont,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fontFamilyName)? changeFont,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeFont value) changeFont,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeFont value)? changeFont,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeFont value)? changeFont,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FontEventCopyWith<FontEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FontEventCopyWith<$Res> {
  factory $FontEventCopyWith(FontEvent value, $Res Function(FontEvent) then) =
      _$FontEventCopyWithImpl<$Res, FontEvent>;
  @useResult
  $Res call({String fontFamilyName});
}

/// @nodoc
class _$FontEventCopyWithImpl<$Res, $Val extends FontEvent>
    implements $FontEventCopyWith<$Res> {
  _$FontEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fontFamilyName = null,
  }) {
    return _then(_value.copyWith(
      fontFamilyName: null == fontFamilyName
          ? _value.fontFamilyName
          : fontFamilyName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChangeFontCopyWith<$Res>
    implements $FontEventCopyWith<$Res> {
  factory _$$_ChangeFontCopyWith(
          _$_ChangeFont value, $Res Function(_$_ChangeFont) then) =
      __$$_ChangeFontCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fontFamilyName});
}

/// @nodoc
class __$$_ChangeFontCopyWithImpl<$Res>
    extends _$FontEventCopyWithImpl<$Res, _$_ChangeFont>
    implements _$$_ChangeFontCopyWith<$Res> {
  __$$_ChangeFontCopyWithImpl(
      _$_ChangeFont _value, $Res Function(_$_ChangeFont) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fontFamilyName = null,
  }) {
    return _then(_$_ChangeFont(
      fontFamilyName: null == fontFamilyName
          ? _value.fontFamilyName
          : fontFamilyName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangeFont implements _ChangeFont {
  const _$_ChangeFont({required this.fontFamilyName});

  @override
  final String fontFamilyName;

  @override
  String toString() {
    return 'FontEvent.changeFont(fontFamilyName: $fontFamilyName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeFont &&
            (identical(other.fontFamilyName, fontFamilyName) ||
                other.fontFamilyName == fontFamilyName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fontFamilyName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeFontCopyWith<_$_ChangeFont> get copyWith =>
      __$$_ChangeFontCopyWithImpl<_$_ChangeFont>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fontFamilyName) changeFont,
  }) {
    return changeFont(fontFamilyName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fontFamilyName)? changeFont,
  }) {
    return changeFont?.call(fontFamilyName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fontFamilyName)? changeFont,
    required TResult orElse(),
  }) {
    if (changeFont != null) {
      return changeFont(fontFamilyName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeFont value) changeFont,
  }) {
    return changeFont(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeFont value)? changeFont,
  }) {
    return changeFont?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeFont value)? changeFont,
    required TResult orElse(),
  }) {
    if (changeFont != null) {
      return changeFont(this);
    }
    return orElse();
  }
}

abstract class _ChangeFont implements FontEvent {
  const factory _ChangeFont({required final String fontFamilyName}) =
      _$_ChangeFont;

  @override
  String get fontFamilyName;
  @override
  @JsonKey(ignore: true)
  _$$_ChangeFontCopyWith<_$_ChangeFont> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FontState {
  String get fontFamily => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fontFamily) fontFamily,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fontFamily)? fontFamily,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fontFamily)? fontFamily,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FontFamily value) fontFamily,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FontFamily value)? fontFamily,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FontFamily value)? fontFamily,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FontStateCopyWith<FontState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FontStateCopyWith<$Res> {
  factory $FontStateCopyWith(FontState value, $Res Function(FontState) then) =
      _$FontStateCopyWithImpl<$Res, FontState>;
  @useResult
  $Res call({String fontFamily});
}

/// @nodoc
class _$FontStateCopyWithImpl<$Res, $Val extends FontState>
    implements $FontStateCopyWith<$Res> {
  _$FontStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fontFamily = null,
  }) {
    return _then(_value.copyWith(
      fontFamily: null == fontFamily
          ? _value.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FontFamilyCopyWith<$Res>
    implements $FontStateCopyWith<$Res> {
  factory _$$_FontFamilyCopyWith(
          _$_FontFamily value, $Res Function(_$_FontFamily) then) =
      __$$_FontFamilyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fontFamily});
}

/// @nodoc
class __$$_FontFamilyCopyWithImpl<$Res>
    extends _$FontStateCopyWithImpl<$Res, _$_FontFamily>
    implements _$$_FontFamilyCopyWith<$Res> {
  __$$_FontFamilyCopyWithImpl(
      _$_FontFamily _value, $Res Function(_$_FontFamily) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fontFamily = null,
  }) {
    return _then(_$_FontFamily(
      fontFamily: null == fontFamily
          ? _value.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FontFamily implements _FontFamily {
  const _$_FontFamily({this.fontFamily = 'Nunito'});

  @override
  @JsonKey()
  final String fontFamily;

  @override
  String toString() {
    return 'FontState.fontFamily(fontFamily: $fontFamily)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FontFamily &&
            (identical(other.fontFamily, fontFamily) ||
                other.fontFamily == fontFamily));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fontFamily);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FontFamilyCopyWith<_$_FontFamily> get copyWith =>
      __$$_FontFamilyCopyWithImpl<_$_FontFamily>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fontFamily) fontFamily,
  }) {
    return fontFamily(this.fontFamily);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fontFamily)? fontFamily,
  }) {
    return fontFamily?.call(this.fontFamily);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fontFamily)? fontFamily,
    required TResult orElse(),
  }) {
    if (fontFamily != null) {
      return fontFamily(this.fontFamily);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FontFamily value) fontFamily,
  }) {
    return fontFamily(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FontFamily value)? fontFamily,
  }) {
    return fontFamily?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FontFamily value)? fontFamily,
    required TResult orElse(),
  }) {
    if (fontFamily != null) {
      return fontFamily(this);
    }
    return orElse();
  }
}

abstract class _FontFamily implements FontState {
  const factory _FontFamily({final String fontFamily}) = _$_FontFamily;

  @override
  String get fontFamily;
  @override
  @JsonKey(ignore: true)
  _$$_FontFamilyCopyWith<_$_FontFamily> get copyWith =>
      throw _privateConstructorUsedError;
}
