// Абстрактный класс Developer, который является базовым для всех разработчиков
abstract class Developer {
  String name;
  int experience;

  Developer(this.name, this.experience);

  // Абстрактный метод, который должен быть перегружен в подклассах
  void develop();
}

// Интерфейс Testing
abstract class Testing {
  void writeTests();
}

// Класс FlutterDeveloper, наследующий Developer и реализующий Testing
class FlutterDeveloper extends Developer implements Testing {
  String favoriteFramework;

  // Именованный конструктор с параметром по умолчанию
  FlutterDeveloper.withFramework(String name, int experience, {this.favoriteFramework = 'Flutter'})
      : super(name, experience);

  // Обычный конструктор
  FlutterDeveloper(String name, int experience) : favoriteFramework = 'Flutter', super(name, experience);

  // Реализация метода develop() из Developer
  @override
  void develop() {
    print('$name с $experience годами опыта работает с $favoriteFramework.');
  }

  // Реализация метода writeTests() из интерфейса Testing
  @override
  void writeTests() {
    print('$name пишет тесты для приложений на $favoriteFramework.');
  }

  // Static поле и метод
  static int totalDevelopers = 0;

  static void incrementDevelopers() {
    totalDevelopers++;
  }

  // Getter и Setter
  String get framework => favoriteFramework;

  set framework(String value) {
    favoriteFramework = value;
  }

  // Метод с именованным параметром
  void debugApp({bool isDebug = true}) {
    if (isDebug) {
      print('$name отлаживает приложение.');
    } else {
      print('$name не отлаживает приложение.');
    }
  }

  // Метод с параметром типа функция
  void buildApp(Function buildFunction) {
    buildFunction();
  }

  // Метод с необязательным параметром
  void releaseApp([bool isReleased = true]) {
    if (isReleased) {
      print('$name выпускает приложение.');
    } else {
      print('$name отложил выпуск.');
    }
  }
}

// Класс AndroidDeveloper, наследующий Developer
class AndroidDeveloper extends Developer {
  String favoriteIDE;

  AndroidDeveloper(String name, int experience, this.favoriteIDE) : super(name, experience);

  @override
  void develop() {
    print('$name с $experience годами опыта работает с $favoriteIDE.');
  }
}

// Работа с массивом, коллекцией и множеством
void collectionDemo() {

  List<Developer> developers = [
    FlutterDeveloper('Alice', 3),
    AndroidDeveloper('Bob', 5, 'Android Studio'),
    FlutterDeveloper.withFramework('Charlie', 2)
  ];

  // Коллекция
  List<String> skills = ['Dart', 'Kotlin', 'Flutter', 'C#'];

  // Множество
  Set<String> frameworks = {'Flutter', '.NET Framework'};

  developers.forEach((developer) => developer.develop());
  print('Навыки: $skills');
  print('Фреймворки: $frameworks');
}

// Работа с continue и break
void loopDemo() {
  for (int i = 0; i < 5; i++) {
    if (i == 2) {
      continue;
    }
    if (i == 4) {
      break;
    }
    print('Текущий индекс: $i');
  }
}

// Обработка исключений
void exceptionDemo() {
  try {
    int result = 10 ~/ 0; // деление на ноль вызовет исключение
    print(result);
  } catch (e) {
    print('Ошибка: $e');
  } finally {
    print('Операция завершена.');
  }
}

void main() {
  // Демонстрация иерархии классов
  FlutterDeveloper flutterDev = FlutterDeveloper('Alice', 3);
  AndroidDeveloper androidDev = AndroidDeveloper('Bob', 5, 'Android Studio');

  flutterDev.develop();
  flutterDev.writeTests();

  androidDev.develop();

  // Работа с коллекцией, массивом и множеством
  collectionDemo();

  // Работа с continue и break
  loopDemo();

  // Обработка исключений
  exceptionDemo();
}