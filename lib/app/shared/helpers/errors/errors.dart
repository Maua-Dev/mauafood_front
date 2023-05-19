class Failure implements Exception {
  final String message;

  Failure({required this.message});
}

class DatasourceResultNull extends Failure {
  DatasourceResultNull({required super.message});
}

class EmptyList extends Failure {
  EmptyList({required super.message});
}
