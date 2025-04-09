part of 'coach_detail_part.dart';

class QuoteWidget extends StatefulWidget {
  const QuoteWidget({super.key, required this.quote});
  final String quote;

  @override
  State<QuoteWidget> createState() => _QuoteWidgetState();
}

class _QuoteWidgetState extends State<QuoteWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.green,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.format_quote, size: 40, color: Colors.white70),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              widget.quote,
              maxLines: 2,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}
