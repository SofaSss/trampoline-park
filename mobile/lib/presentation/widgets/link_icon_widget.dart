part of 'widgets_part.dart';

class LinkIconWidget extends StatefulWidget {
  const LinkIconWidget({
    super.key,
    required this.connectUrl,
    required this.icon,
  });
  final String connectUrl;
  final String icon;

  @override
  State<LinkIconWidget> createState() => _LinkIconWidgetState();
}

class _LinkIconWidgetState extends State<LinkIconWidget> {
  Future<void> _launchURL({
    required Uri url,
    required BuildContext context,
  }) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        baseSnackBar(context: context, message: context.localization.linkError),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return confirmAlertDialog(
                context: context,
                onSure: () {
                  _launchURL(
                    url: Uri.parse(widget.connectUrl),
                    context: context,
                  );
                },
                sureText: context.localization.conntect,
                content: 'Прыгаем в наши соцсети? Там много всего интересного о Батутном парке №1!',
              );
            },
          );
        },
        child: SvgPicture.network(widget.icon, width: 55, height: 55),
      ),
    );
  }
}
