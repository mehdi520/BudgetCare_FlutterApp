part of 'get_logged_in_cubit.dart';

@immutable
sealed class GetLoggedInState {}

final class GetLoggedInInitial extends GetLoggedInState {}
final class GetLoggedSuccess extends GetLoggedInState {
  UserModel user;
  GetLoggedSuccess({required this.user});
}
final class GetLoggedFail extends GetLoggedInState {}


