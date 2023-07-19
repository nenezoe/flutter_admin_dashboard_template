part of 'font_bloc.dart';

@freezed
class FontEvent with _$FontEvent {
  const factory FontEvent.changeFont({required String fontFamilyName}) = _ChangeFont;
}
