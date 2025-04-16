part of '../widgets_part.dart';

class BaseWorkoutCard extends StatefulWidget {
  const BaseWorkoutCard({
    super.key,
    required this.time,
    required this.duration,
    required this.freeSpace,
    required this.workoutType,
    required this.coachPicture,
    required this.coachFirstName,
    required this.coachLastName,
    required this.price,
  });
  final String time;
  final String duration;
  final String freeSpace;
  final String workoutType;
  final String coachPicture;
  final String coachFirstName;
  final String coachLastName;
  final String price;

  @override
  State<BaseWorkoutCard> createState() => _BaseWorkoutCardState();
}

class _BaseWorkoutCardState extends State<BaseWorkoutCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: AppConstants.bigCardHeight + 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: getRandomColor(),
      ),
      child: Stack(
        children: [
          Positioned(top: 5, left: 12, child: Text(widget.time)),
          Positioned(
            top: 5,
            left: 55,
            child: Text(
              '${widget.duration} ${context.localization.hour}',
              style: TextStyle(color: AppColors.lightGray),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              height: 20,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white.withValues(alpha: 0.5),
              ),
              child: Center(
                child: Text(
                  '${context.localization.spaces} ${widget.freeSpace}',
                ),
              ),
            ),
          ),
          Positioned(
            top: 28,
            left: 12,
            child: Text(
              widget.workoutType,
              style: Theme.of(
                context,
              ).textTheme.displayMedium?.copyWith(color: AppColors.white),
            ),
          ),
          Positioned(
            top: 55,
            left: 12,
            child: BaseImageNetworkWidget(
              url: widget.coachPicture,
              width: 50,
              height: 50,
            ),
          ),
          Positioned(
            top: 55,
            left: 70,
            child: Text('${widget.coachFirstName} ${widget.coachLastName}'),
          ),
          Positioned(
            top: 75,
            left: 70,
            child: Text('${widget.price} ${context.localization.rub}'),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: ElevatedButton(
              onPressed: () => (),
              child: Text(context.localization.enter),
            ),
          ),
        ],
      ),
    );
  }
}
