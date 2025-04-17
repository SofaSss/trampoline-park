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
    required this.onSignUpWorkout,
    required this.isClientSignUpWorkout,
  });
  final DateTime time;
  final String duration;
  final String freeSpace;
  final String workoutType;
  final String coachPicture;
  final String coachFirstName;
  final String coachLastName;
  final String price;
  final void Function()? onSignUpWorkout;
  final bool isClientSignUpWorkout;

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
          Positioned(
            top: 5,
            left: 12,
            child: Text(DateFormat('dd-MM-yyyy').format(widget.time)),
          ),
          Positioned(
            top: 25,
            left: 12,
            child: Text(DateFormat('HH:mm').format(widget.time)),
          ),
          Positioned(
            top: 25,
            left: 55,
            child: Text(
              ' ${widget.duration}${context.localization.hour}',
              style: TextStyle(color: AppColors.lightGray),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              height: widget.isClientSignUpWorkout ? 30 : 20,
              width: widget.isClientSignUpWorkout ? 150 : 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  widget.isClientSignUpWorkout ? 20 : 10,
                ),
                color: AppColors.white.withValues(alpha: 0.5),
              ),
              child: Center(
                child:
                    widget.isClientSignUpWorkout
                        ? Text(context.localization.clientWasSignUpWorkout)
                        : Text(
                          '${context.localization.spaces} ${widget.freeSpace}',
                        ),
              ),
            ),
          ),
          Positioned(
            top: 48,
            left: 12,
            child: Text(
              widget.workoutType,
              style: Theme.of(
                context,
              ).textTheme.displayMedium?.copyWith(color: AppColors.white),
            ),
          ),
          Positioned(
            top: 75,
            left: 12,
            child: BaseImageNetworkWidget(
              url: widget.coachPicture,
              width: 50,
              height: 50,
            ),
          ),
          Positioned(
            top: 75,
            left: 70,
            child: Text('${widget.coachFirstName} ${widget.coachLastName}'),
          ),
          Positioned(
            top: 95,
            left: 70,
            child: Text('${widget.price} ${context.localization.rub}'),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: ElevatedButton(
              onPressed: widget.onSignUpWorkout,
              child: Text(context.localization.enter),
            ),
          ),
        ],
      ),
    );
  }
}
