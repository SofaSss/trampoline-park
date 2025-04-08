part of 'service_detail_part.dart';

@RoutePage()
class ServiceDetailScreen extends StatefulWidget {
  const ServiceDetailScreen({super.key});

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(
        context: context,
        title: 'Тренировка',
        back: () => (context.router.maybePop()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            SizedBox(
              height: 270,
              width: MediaQuery.of(context).size.width - 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://avatars.mds.yandex.net/get-entity_search/1727263/530560909/S122x122Smart_2x',
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return BaseAnimatedBuilder(
                        height: 270,
                        width: MediaQuery.of(context).size.width - 50,
                      );
                    }
                  },
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Название тренировки',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                Text('7', style: Theme.of(context).textTheme.headlineSmall),
                Text('ч', style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Океан — это не просто огромная масса воды, покрывающая около 71% поверхности Земли. Это древний, бескрайний мир, хранящий в себе тайны прошлого, настоящего и будущего. Он вдохновляет, завораживает и даже пугает своим величием. В его глубинах скрываются сотни тысяч неизвестных видов, а мощные течения регулируют климат всей планеты, обеспечивая жизни необходимое тепло и влагу.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(onPressed: () => (), child: Text('Записаться')),
          ],
        ),
      ),
    );
  }
}
