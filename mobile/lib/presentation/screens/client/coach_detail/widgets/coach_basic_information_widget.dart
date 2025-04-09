part of '../coach_detail_part.dart';

class CoachBasicInformationWidget extends StatefulWidget {
  const CoachBasicInformationWidget({
    super.key,
    required this.experience,
    required this.firstName,
    required this.lastName,
  });
  final String experience;
  final String firstName;
  final String lastName;

  @override
  State<CoachBasicInformationWidget> createState() =>
      _CoachBasicInformationWidgetState();
}

class _CoachBasicInformationWidgetState
    extends State<CoachBasicInformationWidget> {
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
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.lightBlue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Text(context.localization.experience),
                  Text(widget.experience),
                  Text(context.localization.years),
                ],
              ),
            ),
          ),
          Row(
            spacing: 5,
            children: [
              SizedBox(width: 10),
              Text(
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
