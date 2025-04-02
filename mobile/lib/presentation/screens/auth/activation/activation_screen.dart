part of 'activation_part.dart';

@RoutePage()
class ActivationScreen extends StatefulWidget implements AutoRouteWrapper {
  const ActivationScreen({super.key, required this.uid, required this.token});
  final String uid;
  final String token;

  @override
  State<ActivationScreen> createState() => _ActivationScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              ActivationBloc(authUserUseCases: injection())
                ..add(ActivationEvent(uid: uid, token: token)),
      child: this,
    );
  }
}

class _ActivationScreenState extends State<ActivationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActivationBloc, ActivationState>(
      listener: (context, state) {
        if (state.status == StatusProfile.success) {
          ScaffoldMessenger.of(context)
              .showSnackBar(
                baseSnackBar(
                  context: context,
                  message: context.localization.activeAccount,
                ),
              )
              .closed
              .then((_) => context.router.replace(SignInRoute()));
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case StatusProfile.loading:
            return BaseProgressIndicator();
          case StatusProfile.failure:
            return FailureWidget();
          default:
            return Container();
        }
      },
    );
  }
}
