abstract class RegisterStates {}

//? States for Register
class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSucessState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  final error;
  RegisterErrorState(this.error);
}

//? States for create new user
class CreateNewUserSuccessState extends RegisterStates {}

class CreateNewUserErrorState extends RegisterStates {}

class RegisterChangePasswordVisibility extends RegisterStates {}
