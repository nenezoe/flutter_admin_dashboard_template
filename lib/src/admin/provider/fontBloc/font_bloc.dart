import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'font_event.dart';
part 'font_state.dart';
part 'font_bloc.freezed.dart';

class FontBloc extends Bloc<FontEvent, FontState> {
  FontBloc() : super(const _FontFamily()) {
    on<FontEvent>(_changeFont);
  }

  FutureOr<void> _changeFont(FontEvent event, Emitter<FontState> emit) {
    if (event is _ChangeFont) {
      emit(state.copyWith(fontFamily: event.fontFamilyName));
    }
  }
}
