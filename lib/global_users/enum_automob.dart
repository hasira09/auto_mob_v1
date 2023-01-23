enum EmailSignUpResults{
  SignUpCompleted,
  EmailAlreadyPresent,
  SignUpNotCompleted,
}

enum EmailSignInResult{
  SignInCompleted,
  EmailNotVerified,
  EmailorPasswardInvalid,
  UnexpectedError,
}

enum GoogleSignInResult{
  SignInCompleted,
  SignInNotCompleted,
  UnexpectedError,
  AlreadySignedIn,
}