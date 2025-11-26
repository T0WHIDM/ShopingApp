abstract class AuthEvent {}

class AuthLoginRequest extends AuthEvent {
  String userName;
  String password;

  AuthLoginRequest(this.userName, this.password);
}
