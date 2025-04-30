part of '../coach_profile_part.dart';

// AlertDialog chooseOptionDialog({
//   required BuildContext context,
//   required String title,
//   required List<IdNameModel> options,
//   required void Function(int selectedId) onAdd,
// }) {
//   int? selectedId;

//   return AlertDialog(
//     title: Text(title),
//     content: StatefulBuilder(
//       builder: (context, setState) {
//         return SingleChildScrollView(
//           child: Wrap(
//             spacing: 8,
//             children: options.map((option) {
//               final isSelected = selectedId == option.id;
//               return ActionChip(
//                 label: Text(
//                   option.name,
//                   style: TextStyle(
//                     color: isSelected ? Colors.white : AppColors.blue,
//                   ),
//                 ),
//                 avatar: Text(
//                   '🏅',
//                   style: TextStyle(fontSize: 15),
//                 ),
//                 backgroundColor:
//                     isSelected ? AppColors.blue : Colors.transparent,
//                 shape: StadiumBorder(
//                   side: BorderSide(
//                     color: AppColors.blue,
//                     width: 2,
//                   ),
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     selectedId = option.id;
//                   });
//                 },
//               );
//             }).toList(),
//           ),
//         );
//       },
//     ),
//     actions: <Widget>[
//       TextButton(
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//         child: Text(context.localization.close),
//       ),
//       TextButton(
//         onPressed: () {
//           if (selectedId != null) {
//             onAdd(selectedId!);
//             Navigator.of(context).pop();
//           }
//         },
//         child: Text('Добавить'),
//       ),
//     ],
//   );
// }