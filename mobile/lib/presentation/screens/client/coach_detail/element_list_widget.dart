part of 'coach_detail_part.dart';

class ElementListWidget extends StatefulWidget {
  const ElementListWidget({super.key, required this.element});
  final String element;

  @override
  State<ElementListWidget> createState() => _ElementListWidgetState();
}

class _ElementListWidgetState extends State<ElementListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 5),
      child: Row(
        children: [
          Icon(Icons.circle, size: 6, color: AppColors.gray),
          SizedBox(width: 8),
          Text(widget.element, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
