import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_themes.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(themeData: appThemeData[AppTheme.themeLight]!)) {
    on<ThemeChangedEvent>(
      (event, emit) {
        emit(ThemeState(themeData: appThemeData[event.theme]!));
      },
    );
  }
}
