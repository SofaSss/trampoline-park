part of 'widgets_part.dart';

SnackBar baseSnackBar({
  required BuildContext context,
  required String message,
}) {
  return SnackBar(
    content: SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.info, color: AppColors.white),
          ),
          Expanded(
            child: Text(
              message,
              overflow: TextOverflow.visible,
              softWrap: true,
            ),
          ),
        ],
      ),
    ),
    duration: const Duration(seconds: 5),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    backgroundColor: AppColors.gray,
  );
}
