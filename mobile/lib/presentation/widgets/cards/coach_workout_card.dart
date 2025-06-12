part of '../widgets_part.dart';

class CoachWorkoutCard extends StatefulWidget {
  const CoachWorkoutCard({
    super.key,
    required this.time,
    required this.duration,
    required this.workoutType,
    required this.clientsList,
  });

  final DateTime time;
  final String duration;
  final String workoutType;
  final List<ClientModel> clientsList;

  @override
  State<CoachWorkoutCard> createState() => _CoachWorkoutCardState();
}

class _CoachWorkoutCardState extends State<CoachWorkoutCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 20) * 0.45,
      height: AppConstants.bigCardHeight + 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: getRandomColor(),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${widget.workoutType}  ${widget.duration}${context.localization.hour}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          Positioned(
            top: 65,
            left: 27,
            child: SvgPicture.asset(AppIcons.logo, width: 80, height: 80),
          ),
          Positioned(
            top: 30,
            left: 57,
            child: Container(
              width: 90,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.gray.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  widget.time.isAfter(DateTime.now().toLocal())
                      ? DateFormat('HH:mm').format(widget.time.toLocal())
                      : context.localization.completed,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 40,
            child: SizedBox(
              width: (MediaQuery.of(context).size.width - 20) * 0.5,
              height: AppConstants.bigCardHeight + 10,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text(context.localization.clients)),

                    if (widget.clientsList.isNotEmpty)
                      ...widget.clientsList.map((client) {
                        return Text('- ${client.firstName} ${client.lastName}');
                      }),
                    if (widget.clientsList.isEmpty)
                      Text(context.localization.noClients),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
