part of 'client_home_part.dart';

class HeaderSectionWidget extends StatelessWidget {
  const HeaderSectionWidget({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 18.0, bottom: 10, left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.displayLarge),
          Text(description, style: Theme.of(context).textTheme.headlineSmall),
        ],
      ),
    );
  }
}
