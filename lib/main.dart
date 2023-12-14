import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Навигация'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          // Изменено число элемента, начиная с 1
          int itemNumber = index + 1;
          return ListTile(
            title: Text('Элемент $itemNumber'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen(itemNumber)),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final int index;

  DetailScreen(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Элемент $index'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Элемент $index'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Назад'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ReplacementScreen()),
                );
              },
              child: Text('Заменить экран'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => NewScreen()),
                  (route) => false,
                );
              },
              child: Text('Открыть и удалить предыдущие'),
            ),
          ],
        ),
      ),
    );
  }
}

class ReplacementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Замененный экран'),
      ),
      body: Center(
        child: Text('Это замененный экран.'),
      ),
    );
  }
}

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Новый экран'),
      ),
      body: Center(
        child: Text('Это новый экран.'),
      ),
    );
  }
}
