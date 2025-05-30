part of '../application_part.dart';

class AuthUserUseCases {
  final IAuthUserService authUserService;

  AuthUserUseCases({required this.authUserService});

  Future<void> signUp({
    required String name,
    required String lastName,
    required String email,
    required String phone,
    required String password,
    required DateTime birth,
    required bool isHealthy,
  }) async {
    UnregisteredClient unregisteredUser = UnregisteredClient(
      name: name,
      lastName: lastName,
      email: email,
      phone: phone,
      password: password,
      birth: birth,
      isHealthy: isHealthy,
    );
    await authUserService.signUp(model: unregisteredUser);
  }

  Future<TokenDto> signIn({
    required String email,
    required String password,
  }) async {
    final SignInDto signInModel = SignInDto(email: email, password: password);
    return await authUserService.signIn(dto: signInModel);
  }

  Future<bool> isClient() async {
    final userRole = await authUserService.getUserRole();
    return userRole.role == 'CLIENT';
  }

  Future<bool> isCoach() async {
    final userRole = await authUserService.getUserRole();
    return userRole.role == 'COACH';
  }

  Future<void> activateUser({
    required String uid,
    required String token,
  }) async {
    final ActivateDto activateDto = ActivateDto(uid: uid, token: token);
    await authUserService.activateUser(activateDto: activateDto);
  }

  Future<void> setPassword({
    required String newPassword,
    required String reNewPassword,
    required String oldPassword,
  }) async {
    final SetPasswordDto setPasswordDto = SetPasswordDto(
      newPassword: newPassword,
      reNewPassword: reNewPassword,
      oldPassword: oldPassword,
    );
    await authUserService.setPassword(setPasswordDto: setPasswordDto);
  }

  Future<void> deleteAccount({
    required int clientId,
    required String password,
  }) async {
    await authUserService.deleteAccount(
      clientId: clientId,
      deleteAccountDto: DeleteAccountDto(password: password),
    );
  }

  Future<void> sendResetPassword({required String email}) async {
    final SendResetPasswordDto sendResetPasswordDto = SendResetPasswordDto(
      email: email,
    );
    await authUserService.sendResetPasswordUrl(
      sendResetPasswordDto: sendResetPasswordDto,
    );
  }

  Future<void> resetPassword({
    required String uid,
    required String token,
    required String password,
    required String rePassword,
  }) async {
    final ResetPasswordDto resetPasswordDto = ResetPasswordDto(
      uid: uid,
      token: token,
      password: password,
      rePassword: rePassword,
    );
    await authUserService.resetPassword(resetPasswordDto: resetPasswordDto);
  }
}
