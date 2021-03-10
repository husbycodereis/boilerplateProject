import 'package:boilerplate/stores/theme/theme_store.dart';
import 'package:boilerplate/stores/todos/todos_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  ThemeStore _themeStore;
  TodosStore _todosStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStore = Provider.of<ThemeStore>(context);
    _todosStore = Provider.of<TodosStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        _todosStore.fetchTodos();
      }),
      appBar: AppBar(
        title: Text('Base Screen'),
        actions: [
          IconButton(
            onPressed: () {
              _themeStore.changeBrightnessToDark(!_themeStore.darkMode);
            },
            icon: Icon(
              _themeStore.darkMode ? Icons.brightness_5 : Icons.brightness_3,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      body: Observer(builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.separated(
            itemCount: _todosStore.todosList.length,
            separatorBuilder: (context, position) {
              return Divider();
            },
            itemBuilder: (context, position) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_todosStore.todosList[position].title),
                  Icon(_todosStore.todosList[position].completed
                      ? Icons.check_circle
                      : Icons.check_circle_outline),
                  Text('hello'),
                  Text('adams'),
                ],
              );
            },
          ),
        );
      }),
    );
  }
}

// Center(
//             child: FlatButton(
//                 color: Theme.of(context).accentColor,
//                 onPressed: () {
//                   Navigator.of(context).pushNamed(Routes.home);
//                   _postStore.getTodos();
//                 },
//                 child: null),
//           ),
