// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_popular_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MoviePopularController on MoviePopularControllerBase, Store {
  final _$futureStateAtom =
      Atom(name: 'MoviePopularControllerBase.futureState');

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

  final _$fetchAsyncAction = AsyncAction('MoviePopularControllerBase.fetch');

  @override
  Future fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
futureState: ${futureState}
    ''';
  }
}
