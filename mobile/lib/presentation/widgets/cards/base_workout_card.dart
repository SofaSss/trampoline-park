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
    this.isCoach = false,
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
  final bool isCoach;

  @override
  State<BaseWorkoutCard> createState() => _BaseWorkoutCardState();
}

class _BaseWorkoutCardState extends State<BaseWorkoutCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height:
          widget.isCoach
              ? AppConstants.bigCardHeight + 25
              : AppConstants.bigCardHeight + 10,
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
          if (widget.isCoach == false) ...[
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
          ],
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
          if (widget.isCoach == false) ...[
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
            widget.isClientSignUpWorkout
                ? SizedBox()
                : Positioned(
                  bottom: 5,
                  right: 5,
                  child: ElevatedButton(
                    onPressed: widget.onSignUpWorkout,
                    child: Text(context.localization.enter),
                  ),
                ),
          ],
          if (widget.isCoach == true) ...[
            Positioned(
              right: 0,
              child: SizedBox(
                width: (MediaQuery.of(context).size.width - 20) * 0.55,
                height: AppConstants.bigCardHeight + 10,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 3),
                        child: Text('Клиенты:'),
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width - 20) * 0.40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.gray.withValues(alpha: 0.6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            BaseImageNetworkWidget(
                              url: widget.coachPicture,
                              width: 40,
                              height: 40,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.coachFirstName),
                                Text(widget.coachLastName),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
