import 'package:equatable/equatable.dart';
import 'package:nyt/core/service/remote/error_message_remote.dart';

abstract class Failure extends Equatable {
  const Failure(this.errorMessageModel);
  final ErrorMessageModel errorMessageModel;

  @override
  List<Object> get props => [errorMessageModel];
}