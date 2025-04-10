part of '../widgets_part.dart';

AppBar appBarWithCalendar({
  required BuildContext context,
  required String title,
  required void Function()? back,
  required List<DateTime> days,
  required void Function(DateTime day) onTapDate,
  required DateTime selectedDate,
}) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: GestureDetector(
        onTap: back,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(AppIcons.back, color: AppColors.lightYellow),
        ),
      ),
    ),
    leadingWidth: 50,
    title: Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.displayLarge?.copyWith(color: AppColors.white),
    ),
    centerTitle: true,
    backgroundColor: AppColors.blue,
    toolbarHeight: 70,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(65),
      child: Container(
        color: AppColors.blue,
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: days.length,
          itemBuilder: (context, index) {
            DateTime day = days[index];
            bool isSelected = day.day == selectedDate.day;

            return GestureDetector(
              onTap: () => onTapDate(day),
              child: Container(
                width: 60,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.yellow : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat.E('ru').format(day).substring(0, 2),
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${day.day}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
}
