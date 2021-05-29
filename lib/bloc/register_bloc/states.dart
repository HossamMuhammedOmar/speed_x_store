abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSucessState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  final error;
  RegisterErrorState(this.error);
}

class RegisterChangePasswordVisibility extends RegisterStates {}
