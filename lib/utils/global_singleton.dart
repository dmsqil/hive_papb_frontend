class GlobalSingleton {
  // Private constructor
  GlobalSingleton._internal();

  // Single instance of the class
  static final GlobalSingleton _instance = GlobalSingleton._internal();

  // Factory constructor to return the same instance
  factory GlobalSingleton() => _instance;

  // Example global variables
  String apiKey = "http://172.16.1.3:8000/api";
}
