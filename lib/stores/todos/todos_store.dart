import 'package:boilerplate/data/repository.dart';
import 'package:boilerplate/models/todos/todos.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
part 'todos_store.g.dart';

class TodosStore = _TodosStoreBase with _$TodosStore;

abstract class _TodosStoreBase with Store {
  Repository _repository;

  _TodosStoreBase(Repository repository) {
    this._repository = repository;
  }
  @observable
  ObservableList<Todos> todosList = ObservableList.of([]);

  @action
  Future fetchTodos() async {
    _repository.getTodos().then((todos) {
      todosList.addAll(todos);
    }).catchError((e) {
      if (e is DioError) {
        print(e);
      }
    });
  }
}
