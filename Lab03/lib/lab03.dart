import 'dart:async';
import 'dart:convert';

abstract class Developer {
  String name;
  int experience;

  Developer(this.name, this.experience);

  void develop();
}

// Интерфейс Testing
abstract class Testing {
  void writeTests();
}

// Mixin для CodeReviewer
mixin CodeReviewer {
  void reviewCode() {
    print('Этот разработчик проверяет код.');
  }
}

// Класс FlutterDeveloper
class FlutterDeveloper extends Developer with CodeReviewer implements Testing, Comparable<FlutterDeveloper>  {
  String favoriteFramework;

  FlutterDeveloper.withFramework(String name, int experience, {this.favoriteFramework = 'Flutter'})
    : super(name, experience);

  FlutterDeveloper(String name, int experience) : favoriteFramework = 'Flutter', super(name, experience);

  @override
  void develop() {
    print('$name с $experience годами опыта работает с $favoriteFramework.');
  }

  @override
  void writeTests() {
    print('$name пишет тесты для приложений на $favoriteFramework.');
  }

// Реализация Comparable
  @override
  int compareTo(FlutterDeveloper other) {
    return experience.compareTo(other.experience);
  }

// JSON сериализация
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'experience': experience,
      'framework': favoriteFramework,
    };
  }

  static FlutterDeveloper fromJson(Map<String, dynamic> json) {
    return FlutterDeveloper(json['name'], json['experience']);
  }
}

// Класс AndroidDeveloper
class AndroidDeveloper extends Developer {
  String favoriteIDE;

  AndroidDeveloper(String name, int experience, this.favoriteIDE) : super(name, experience);

  @override
  void develop() {
    print('$name с $experience годами опыта работает с $favoriteIDE.');
  }
}

// Реализация Iterator и Iterable
abstract class DeveloperCollection implements Iterable<Developer> {
  List<Developer> developers;

  DeveloperCollection(this.developers);

  @override
  Iterator<Developer> get iterator => DeveloperIterator(developers);
}

class DeveloperIterator implements Iterator<Developer> {
  final List<Developer> developers;
  int _index = -1;

  DeveloperIterator(this.developers);

  @override
  Developer get current => developers[_index];

  @override
  bool moveNext() {
    _index++;
    return _index < developers.length;
  }
}

// Асинхронный метод
Future<void> loadDeveloperData() async {
  print('Загрузка данных разработчика...');
  await Future.delayed(Duration(seconds: 2));
  print('Данные разработчика загружены.');
}

// Работа с Future
void demonstrateFuture() async {
  print('Начало загрузки данных...');
  await loadDeveloperData();
  print('Загрузка завершена.');
}

// Работа с Stream
Stream<int> numberStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void demonstrateSingleSubscriptionStream() {
  numberStream().listen((number) {
    print('Получено значение: $number');
  });
}

// BroadcastStream
Stream<int> broadcastStream = numberStream().asBroadcastStream();

void demonstrateBroadcastStream() {
  broadcastStream.listen((number) {
    print('Первый слушатель получил: $number');
  });

  broadcastStream.listen((number) {
    print('Второй слушатель получил: $number');
  });
}

void main() {
// Демонстрация работы mixin
FlutterDeveloper dev = FlutterDeveloper('Alice', 3);
dev.develop();
dev.reviewCode();

// Сравнение разработчиков
FlutterDeveloper dev1 = FlutterDeveloper('Bob', 5);
FlutterDeveloper dev2 = FlutterDeveloper('Charlie', 2);
print(dev1.compareTo(dev2));

// JSON сериализация
String jsonDev = jsonEncode(dev.toJson());
print('JSON: $jsonDev');

// Демонстрация работы с Future
demonstrateFuture();
print('------------');
// Демонстрация работы с Stream
// demonstrateSingleSubscriptionStream();
demonstrateBroadcastStream();
}
