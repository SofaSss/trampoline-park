 part of '../widgets_part.dart';

// class BaseMediumCard extends StatefulWidget {
//   const BaseMediumCard({
//     super.key,
//     required this.imageUrl,
//     required this.name,
//     required this.lastName,
//     this.description,
//   });
//   final String? description;
//   final String imageUrl;
//   final String name;
//   final String lastName;

//   @override
//   State<BaseMediumCard> createState() => _BaseMediumCardState();
// }

// class _BaseMediumCardState extends State<BaseMediumCard> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: AppConstants.mediumCardWidth,
//       height: AppConstants.mediumCardHeight,
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Positioned(
//             top: 0,
//             child: SizedBox(
//               width: AppConstants.mediumCardWidth,
//               height: AppConstants.mediumCardHeight - 20,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//                 child: Image.network(
//                   widget.imageUrl,
//                   fit: BoxFit.cover,
//                   loadingBuilder: (context, child, loadingProgress) {
//                     if (loadingProgress == null) {
//                       return child;
//                     } else {
//                       return BaseAnimatedBuilder(
//                         height: AppConstants.mediumCardHeight - 20,
//                         width: AppConstants.mediumCardWidth,
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             child: Container(
//               height: AppConstants.mediumCardHeight / 3,
//               width: AppConstants.mediumCardWidth,
//               decoration: ShapeDecoration(
//                 color: getRandomColor(),
//                 shape: CurvedPentagonBorder(
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(20),
//                   ),
//                   topCurveHeight: 25,
//                 ),
//               ),
//               child:
//                   widget.description != null
//                       ? Center(
//                         child: Text(
//                           widget.description!,
//                           textAlign: TextAlign.center,
//                           style: Theme.of(context).textTheme.headlineMedium,
//                         ),
//                       )
//                       : Column(
//                         children: [
//                           Text(
//                             widget.name,
//                             style: Theme.of(context).textTheme.headlineMedium,
//                           ),
//                           Text(
//                             widget.lastName,
//                             style: Theme.of(context).textTheme.headlineMedium,
//                           ),
//                         ],
//                       ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class BaseMediumCard extends StatefulWidget {
  const BaseMediumCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.lastName,
    this.description,
  });
  
  final String? description;
  final String imageUrl;
  final String name;
  final String lastName;

  @override
  State<BaseMediumCard> createState() => _BaseMediumCardState();
}

class _BaseMediumCardState extends State<BaseMediumCard> {
  Color? backgroundColor; // убрал late

  @override
  void initState() {
    super.initState();
    backgroundColor = getRandomColor(); // присваиваем сразу
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConstants.mediumCardWidth,
      height: AppConstants.mediumCardHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
              width: AppConstants.mediumCardWidth,
              height: AppConstants.mediumCardHeight - 20,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return BaseAnimatedBuilder(
                        height: AppConstants.mediumCardHeight - 20,
                        width: AppConstants.mediumCardWidth,
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: AppConstants.mediumCardHeight / 3,
              width: AppConstants.mediumCardWidth,
              decoration: ShapeDecoration(
                color: backgroundColor, // используем сохранённый цвет
                shape: CurvedPentagonBorder(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  topCurveHeight: 25,
                ),
              ),
              child: widget.description != null
                  ? Center(
                      child: Text(
                        widget.description!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    )
                  : Column(
                      children: [
                        Text(
                          widget.name,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          widget.lastName,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

