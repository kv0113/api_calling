class Responceclass<T> {
  String message;
  bool success;
  T? data;

  Responceclass({
    required this.message,
    required this.success,
    this.data,
  });
}
