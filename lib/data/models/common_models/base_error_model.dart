import 'package:equatable/equatable.dart';

class BaseErrorModel extends Equatable{
  final bool status;
  final String? message;
  final int? code;

  const BaseErrorModel({
    required this.status,
    this.message,
    this.code
  });

  @override
  List<Object?> get props => [status,message,code];

  factory BaseErrorModel.fromJson(Map < String, dynamic > map) {
    return BaseErrorModel(
        status: map['status'] ?? false,
        message: map['message'] ?? "",
        code: map['code'] ?? 0
    );
  }
}