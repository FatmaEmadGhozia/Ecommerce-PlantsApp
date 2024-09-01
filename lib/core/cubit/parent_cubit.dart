import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'parent_state.dart';

class ParentCubit extends Cubit<ParentState> {
  static final ParentCubit instance = ParentCubit();
  ParentCubit() : super(ParentInitial()) {
    loadLang();
  }
  Map<String, dynamic> local = {};
  Future<void> loadLang() async {
    String s = await rootBundle.loadString('assets/lang/ar.json');
    local = json.decode(s);
    emit(ParentInitial());
  }
}
