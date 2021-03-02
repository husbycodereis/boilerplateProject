// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodosStore on _TodosStoreBase, Store {
  final _$todosListAtom = Atom(name: '_TodosStoreBase.todosList');

  @override
  ObservableList<Todos> get todosList {
    _$todosListAtom.reportRead();
    return super.todosList;
  }

  @override
  set todosList(ObservableList<Todos> value) {
    _$todosListAtom.reportWrite(value, super.todosList, () {
      super.todosList = value;
    });
  }

  final _$fetchTodosAsyncAction = AsyncAction('_TodosStoreBase.fetchTodos');

  @override
  Future<dynamic> fetchTodos() {
    return _$fetchTodosAsyncAction.run(() => super.fetchTodos());
  }

  @override
  String toString() {
    return '''
todosList: ${todosList}
    ''';
  }
}
