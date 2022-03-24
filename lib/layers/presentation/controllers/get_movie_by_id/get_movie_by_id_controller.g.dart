// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_by_id_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GetMovieByIdController on GetMovieByIdControllerBase, Store {
  final _$futureStateAtom =
      Atom(name: 'GetMovieByIdControllerBase.futureState');

  @override
  FutureState get futureState {
    _$futureStateAtom.reportRead();
    return super.futureState;
  }

  @override
  set futureState(FutureState value) {
    _$futureStateAtom.reportWrite(value, super.futureState, () {
      super.futureState = value;
    });
  }

  final _$fetchAsyncAction = AsyncAction('GetMovieByIdControllerBase.fetch');

  @override
  Future fetch(int id) {
    return _$fetchAsyncAction.run(() => super.fetch(id));
  }

  @override
  String toString() {
    return '''
futureState: ${futureState}
    ''';
  }
}
