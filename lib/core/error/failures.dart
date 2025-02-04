import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();

  @override
  List<dynamic> get props => [true];
}

class ServerFailure extends Failure {
  final String? message;
  const ServerFailure({this.message});
}

class CacheFailure extends Failure {}
