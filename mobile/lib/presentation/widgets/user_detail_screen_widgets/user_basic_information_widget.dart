part of '../widgets_part.dart';

class UserBasicInformationWidget extends StatefulWidget {
  const UserBasicInformationWidget({
    super.key,
    required this.experience,
    required this.firstName,
    required this.lastName,
    this.isClientInformation = false,
    this.isHealthy = true,
  });
  final String experience;
  final String firstName;
  final String lastName;
  final bool isClientInformation;
  final bool isHealthy;

  @override
  State<UserBasicInformationWidget> createState() =>
      _UserBasicInformationWidgetState();
}

class _UserBasicInformationWidgetState
    extends State<UserBasicInformationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Container(
              height: 30,
              width: widget.isHealthy ? 130 : 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.lightBlue,
              ),
              child:
                  !widget.isClientInformation
                      ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 5,
                        children: [
                          Text(context.localization.experience),
                          Text(widget.experience),
                          Text(context.localization.years),
                        ],
                      )
                      : Center(
                        child:
                            widget.isHealthy
                                ? Text(context.localization.healthy)
                                : Text(context.localization.notHealthy),
                      ),
            ),
          ),
          Row(
            spacing: 5,
            children: [
              SizedBox(width: 10),
              widget.isClientInformation
                  ? SizedBox()
                  : Text(
                    context.localization.coach,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
                  ),
              Text(
                widget.firstName,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
              ),
              Text(
                widget.lastName,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
