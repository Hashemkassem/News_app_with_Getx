import 'package:flutter/material.dart';
import 'package:news_app_with_getx/component/navigation_bar.dart';
import 'package:news_app_with_getx/pages/HomePage/widgets/new_Tile.dart';
import 'package:news_app_with_getx/pages/HomePage/widgets/trending_card_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const MyBotttomNav(),
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.surface,
      //   title: Text(
      //     'NEWSWEEKERS',
      //     style: Theme.of(context).textTheme.headlineLarge,
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color:
                              Theme.of(context).colorScheme.primaryContainer),
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.dashboard_sharp,
                        size: 30,
                      ),
                    ),
                    Text(
                      'NEWSWEEKERS',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color:
                              Theme.of(context).colorScheme.primaryContainer),
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.person,
                        size: 30,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hottest News',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'See All',
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TrendingCard(
                        img:
                            'https://yt3.googleusercontent.com/FlcCWhg2-xPoBL-yH2CjEn9P8b026eZjxS8iCli0AEKnU0PZlHi7-MFEiGrearxlLUCJUf1haw=w1707-fcrop64=1,00005a57ffffa5a8-k-c0xffffffff-no-nd-rj',
                        author: 'witanimes',
                        tag: 'nin wa Sorezore Uso wo',
                        time: '2022',
                        title:
                            'أربعة زملاء الدراسة لديهم أسرار خاصة يخفونها عن بعضهم البعض ولكن إلى متى !؟',
                      ),
                      TrendingCard(
                        img:
                            'https://witanime.cyou/wp-content/uploads/2024/10/Dandadan-413x559.jpg',
                        author: 'witanime',
                        tag: 'Dandadan',
                        time: '2022',
                        title:
                            'لقصة تتحدث عن كين تاكاكورا هو شاب عاشق للسحر ولا يؤمن بالأشباح بينما صديقته مومو أياسي لا تؤمن بوجود الكائنات الفضائية لكنهما معًا سيعثرون على لغز يتحدى جميع معتقداتهم وأعرافهم فتبدأ قصة مثيرة للاهتمام!',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hottest News',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'See All',
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SingleChildScrollView(
                  // scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      NewTile(
                          time: '2 Day ago',
                          tag:
                              'لقصة تتحدث عن كين تاكاكورا هو شاب عاشق للسحر ولا يؤمن بالأشباح بينما صديقته مومو أياسي لا تؤمن بوجود الكائنات الفضائية لكنهما معًا سيعثرون على لغز يتحدى جميع معتقداتهم وأعرافهم فتبدأ قصة مثيرة للاهتمام!',
                          title: 'Blue Lock',
                          imgUrl:
                              'https://witanime.cyou/wp-content/uploads/2024/10/Blue-Lock-vs.-U-20-Japan-413x559.jpg'),
                      NewTile(
                          time: '2 Day ago',
                          tag:
                              'لقصة تتحدث عن كين تاكاكورا هو شاب عاشق للسحر ولا يؤمن بالأشباح بينما صديقته مومو أياسي لا تؤمن بوجود الكائنات الفضائية لكنهما معًا سيعثرون على لغز يتحدى جميع معتقداتهم وأعرافهم فتبدأ قصة مثيرة للاهتمام!',
                          title: 'Ao no Miburo',
                          imgUrl:
                              'https://witanime.cyou/wp-content/uploads/2024/10/Ao-no-Miburo-413x559.jpg')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
