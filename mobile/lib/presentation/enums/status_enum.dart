enum StatusProfile {
  loading,
  loaded,
  failure,
  success,
  successSignOut,
  successDeleteAccount,
}

enum SignInStatus {
  loading,
  loaded,
  failure,
  toClientMainScreen,
  toCoachMainScreen,
  successSendResetPassword,
}

enum InitialStatus {
  loading,
  toOnBoardingScreen,
  toClientMainScreen,
  toCoachMainScreen,
}

enum EventStatus {
  loading,
  loaded,
  failure,
  successCreateEvent,
  successValidateEvent,
}

enum Status { loading, loaded, failure, success }
