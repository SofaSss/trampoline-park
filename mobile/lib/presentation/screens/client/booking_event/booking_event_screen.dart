part of 'booking_event_part.dart';

@RoutePage()
class BookingEventScreen extends StatefulWidget {
  const BookingEventScreen({super.key});

  @override
  State<BookingEventScreen> createState() => _BookingEventScreenState();
}

class _BookingEventScreenState extends State<BookingEventScreen> {
  DateTime _selectedDate = DateTime.now();
  int? animatorSelectedIndex;
  int? showSelectedIndex;
  int? masterClassSelectedIndex;
  bool isPhotographer = false;
  bool isVideographer = false;
  TextEditingController? startController;
  TextEditingController? endController;

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

    return Scaffold(
      appBar: appBarWithCalendar(
        context: context,
        title: 'Бронирование праздника',
        back: () => context.router.maybePop(),
        days: days,
        onTapDate: (day) {
          setState(() {
            _selectedDate = day;
          });
        },
        selectedDate: _selectedDate,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  DateFormat('EEEE, d MMMM, yyyy', 'ru').format(_selectedDate),
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge?.copyWith(color: AppColors.blue),
                ),
              ),
            ),

            TimeSection(
              startController: startController,
              endController: endController,
            ),
            AnimatorSection(
              selectedIndex: animatorSelectedIndex,
              onSelected: (index) {
                setState(() {
                  animatorSelectedIndex = index;
                });
              },
            ),
            YesNoChoiceWidget(
              title: context.localization.isPhotograph,
              initialValue: isPhotographer,
              onChanged: (val) => setState(() => isPhotographer = val),
            ),
            YesNoChoiceWidget(
              title: context.localization.isVideograph,
              initialValue: isVideographer,
              onChanged: (val) => setState(() => isVideographer = val),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 10, bottom: 10),
              child: Text(
                context.localization.isOptionalService,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            MasterClassSection(
              selectedIndex: masterClassSelectedIndex,
              onSelected: (index) {
                setState(() {
                  masterClassSelectedIndex = index;
                });
              },
            ),

            ShowSection(
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
                  onPressed: () => (),
                  child: Text(context.localization.booking),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
