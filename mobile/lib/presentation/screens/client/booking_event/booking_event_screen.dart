part of 'booking_event_part.dart';

@RoutePage()
class BookingEventScreen extends StatefulWidget implements AutoRouteWrapper {
  const BookingEventScreen({super.key});

  @override
  State<BookingEventScreen> createState() => _BookingEventScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              (EventBookingBloc(eventUseCases: injection())
                ..add(EventBookingEvent.loadData())),
      child: this,
    );
  }
}

class _BookingEventScreenState extends State<BookingEventScreen> {
  DateTime _selectedDate = DateTime.now();
  int? animatorSelectedIndex;
  int? showSelectedIndex;
  int? masterClassSelectedIndex;
  bool isPhotographer = false;
  bool isVideographer = false;
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  Set<int> selectedOptionalServiceIndexes = {};

  List<DateTime> _daysInMonth(DateTime date) {
    int lastDay = DateTime(date.year, date.month + 1, 0).day;
    return List.generate(
      lastDay,
      (index) => DateTime(date.year, date.month, index + 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    List<DateTime> days =
        _daysInMonth(today).where((day) => !day.isBefore(today)).toList();

    return BlocConsumer<EventBookingBloc, EventBookingState>(
      listener: (context, state) {
        final bloc = context.read<EventBookingBloc>();
        if (state.status == EventStatus.successCreateEvent) {
          context.router.push(SuccessBookingEventRoute());
          ScaffoldMessenger.of(context).showSnackBar(
            baseSnackBar(
              context: context,
              message: context.localization.successBookingEvent,
            ),
          );
        } else if (state.status == EventStatus.successValidateEvent) {
          showDialog(
            context: context,
            builder:
                (context) => BlocProvider.value(
                  value: bloc,
                  child: confirmAlertDialog(
                    context: context,
                    sureText: context.localization.booking,
                    widgetContent: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextSelectedOptions(
                            optionName: context.localization.date,
                            optionSelectText: DateFormat(
                              'dd-MM-yyyy',
                            ).format(_selectedDate),
                          ),
                          TextSelectedOptions(
                            optionName: context.localization.time,
                            optionSelectText:
                                '${startController.text.trim()} - ${endController.text.trim()} ',
                          ),
                          TextSelectedOptions(
                            optionName: context.localization.photo,
                            optionSelectText:
                                isPhotographer == true
                                    ? '${context.localization.yes} - ${state.finalPhotoPrice} ${context.localization.rub}'
                                    : context.localization.no,
                          ),
                          TextSelectedOptions(
                            optionName: context.localization.videographer,
                            optionSelectText:
                                isVideographer == true
                                    ? '${context.localization.yes}  - ${state.finalVideoPrice} ${context.localization.rub}'
                                    : context.localization.no,
                          ),
                          TextSelectedOptions(
                            optionName: context.localization.animator,
                            optionSelectText:
                                '${state.coachCostumeList[animatorSelectedIndex!].name} - ${state.finalAnimatorPrice} ${context.localization.rub}',
                          ),
                          TextSelectedOptions(
                            optionName: context.localization.masterClass,
                            optionSelectText:
                                masterClassSelectedIndex != null
                                    ? '${state.masterClassList[masterClassSelectedIndex!].name} - ${state.masterClassList[masterClassSelectedIndex!].price} ${context.localization.rub}'
                                    : context.localization.no,
                          ),
                          TextSelectedOptions(
                            optionName: context.localization.showProgram,
                            optionSelectText:
                                showSelectedIndex != null
                                    ? '${state.showProgramList[showSelectedIndex!].name} - ${state.showProgramList[showSelectedIndex!].price} ${context.localization.rub}'
                                    : context.localization.no,
                          ),
                          TextSelectedOptions(
                            optionName: context.localization.all,
                            optionSelectText: state.finalPrice,
                          ),
                        ],
                      ),
                    ),
                    onSure: () {
                      final optionalServices = <int?>[];
                      if (masterClassSelectedIndex != null) {
                        optionalServices.add(
                          state.masterClassList[masterClassSelectedIndex!].id,
                        );
                      }
                      if (showSelectedIndex != null) {
                        optionalServices.add(
                          state.showProgramList[showSelectedIndex!].id,
                        );
                      }
                      bloc.add(
                        EventBookingEvent.createEvent(
                          date: _selectedDate,
                          eventStartTime: parseTimeToDateTime(
                            startController.text.trim(),
                          ),
                          eventEndTime: parseTimeToDateTime(
                            endController.text.trim(),
                          ),
                          isPhotographer: isPhotographer,
                          isVideographer: isVideographer,
                          optionalService: optionalServices,
                          coachCostume:
                              state.coachCostumeList[animatorSelectedIndex!].id,
                        ),
                      );
                    },
                  ),
                ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: appBarWithCalendar(
            context: context,
            title: context.localization.bookingEvent,
            back: () => context.router.maybePop(),
            days: days,
            onTapDate: (day) {
              setState(() {
                _selectedDate = day;
              });
            },
            selectedDate: _selectedDate,
          ),

          body: switch (state.status) {
            EventStatus.loaded => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child:
                          DateFormat('yyyy-MM-dd').format(_selectedDate) !=
                                  DateFormat('yyyy-MM-dd').format(today)
                              ? Text(
                                DateFormat(
                                  'EEEE, d MMMM, yyyy',
                                  'ru',
                                ).format(_selectedDate),
                                style: Theme.of(context).textTheme.displayLarge
                                    ?.copyWith(color: AppColors.blue),
                              )
                              : Text(
                                context.localization.chooseDate,
                                style: Theme.of(context).textTheme.displayLarge
                                    ?.copyWith(color: AppColors.red),
                              ),
                    ),
                  ),

                  TimeSection(
                    startController: startController,
                    endController: endController,
                    startErrorText: state.errors[InputErrorTypeEnum.textField]
                        ?.localize(context.localization),
                    endErrorText: state.errors[InputErrorTypeEnum.textField]
                        ?.localize(context.localization),
                  ),
                  AnimatorSection(
                    animators: state.coachCostumeList,
                    selectedIndex: animatorSelectedIndex,
                    errorText: state.errors[InputErrorTypeEnum.textField]
                        ?.localize(context.localization),
                    onSelected: (index) {
                      setState(() {
                        animatorSelectedIndex = index;
                      });
                    },
                  ),
                  YesNoChoiceWidget(
                    title: context.localization.isPhotograph,
                    price: state.photoPrice,
                    initialValue: isPhotographer,
                    onChanged: (val) => setState(() => isPhotographer = val),
                  ),
                  YesNoChoiceWidget(
                    title: context.localization.isVideographer,
                    price: state.videoPrice,
                    initialValue: isVideographer,
                    onChanged: (val) => setState(() => isVideographer = val),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 18.0,
                      left: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      context.localization.isOptionalService,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  OptionalServiceSection(
                    optionalServiceType: context.localization.masterClasses,
                    optionalServiceList: state.masterClassList,
                    selectedIndex: masterClassSelectedIndex,
                    onSelected: (index) {
                      setState(() {
                        masterClassSelectedIndex = index;
                      });
                    },
                  ),

                  OptionalServiceSection(
                    optionalServiceType: context.localization.showPrograms,
                    optionalServiceList: state.showProgramList,
                    selectedIndex: showSelectedIndex,
                    onSelected: (index) {
                      setState(() {
                        showSelectedIndex = index;
                      });
                    },
                  ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<EventBookingBloc>().add(
                            EventBookingEvent.validateCreateEventData(
                              date:
                                  DateFormat(
                                            'yyyy-MM-dd',
                                          ).format(_selectedDate) !=
                                          DateFormat('yyyy-MM-dd').format(today)
                                      ? _selectedDate
                                      : null,
                              eventStartTime: startController.text.trim(),
                              eventEndTime: endController.text.trim(),
                              coachCostume: animatorSelectedIndex,
                              isPhotographer: isPhotographer,
                              isVideographer: isVideographer,
                              showPrice:
                                  showSelectedIndex == null
                                      ? 0
                                      : state
                                          .showProgramList[showSelectedIndex!]
                                          .price,
                              masterClassPrice:
                                  masterClassSelectedIndex == null
                                      ? 0
                                      : state
                                          .masterClassList[masterClassSelectedIndex!]
                                          .price,
                            ),
                          );
                        },
                        child: Text(context.localization.booking),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            EventStatus.loading => BaseProgressIndicator(),
            EventStatus.failure => FailureWidget(),
            _ => FailureWidget(),
          },
        );
      },
    );
  }

  @override
  void dispose() {
    startController.dispose();
    endController.dispose();
    super.dispose();
  }
}
