import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      msg: json["message"] as String,
    );
  }

  const ErrorMessageModel({
    required this.msg,
  });
  final String msg;

  @override
  List<Object?> get props => [
    msg,
  ];
}
