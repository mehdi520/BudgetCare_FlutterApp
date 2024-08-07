
import 'package:equatable/equatable.dart';

class BaseResponseModel extends Equatable{
  final bool status;
  final String? message;

  const BaseResponseModel({
    required this.status,
    this.message
});

  @override
  List<Object?> get props => [status,message];

  factory BaseResponseModel.fromJson(Map < String, dynamic > map) {
    return BaseResponseModel(
      status: map['status'] ?? false,
      message: map['message'] ?? ""
    );
  }
}