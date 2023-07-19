part of 'font_bloc.dart';

@freezed
class FontState with _$FontState {
  const factory FontState.fontFamily({@Default('Nunito') String fontFamily}) =
      _FontFamily;
}
