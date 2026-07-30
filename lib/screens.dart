import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'services/responsive_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//---------------Home Screen ---------------------------
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return HomePage(
      responsive: responsive,
      primaryColor: const Color(0xFF0D47A1),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.responsive,
    required this.primaryColor,
  });

  final ResponsiveState responsive;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0f172a),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: responsive.contentWidth,
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.horizontalPadding,
              vertical: responsive.gap * 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _heroSection(),

                SizedBox(height: responsive.gap * 3),

                _sectionTitle("Featured Projects"),

                SizedBox(height: responsive.gap),

                _projectsGrid(),

                SizedBox(height: responsive.gap * 3),

                _sectionTitle("Skills"),

                SizedBox(height: responsive.gap),

                _skills(),

                SizedBox(height: responsive.gap * 3),

                _contactSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _heroSection() {
    if (responsive.isDesktop) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _heroImage(),

              SizedBox(width: responsive.gap * 2),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Taimoor Hussain",
                      style: TextStyle(
                        fontSize: responsive.h1,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: responsive.gap * .4),

                    Text(
                      "Unity Game Developer",
                      style: TextStyle(
                        fontSize: responsive.h2,
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: responsive.gap * 1.5),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.gap,
            ),
            child: Text(
              "Unity Game Developer specialising in gameplay programming, performance optimisation, and third-party SDK integration.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: responsive.body,
                height: 1.7,
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _heroImage(),

        SizedBox(height: responsive.gap * 1.5),

        Text(
          "Taimoor Hussain",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: responsive.h1,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: responsive.gap * .4),

        Text(
          "Unity Game Developer",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: responsive.h2,
            color: primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),

        SizedBox(height: responsive.gap),

       Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsive.gap,
          ),
          child: Text(
            "Unity Game Developer specialising in gameplay programming, performance optimisation, and third-party SDK integration.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: responsive.body,
              height: 1.7,
            ),
          ),
        ),
      ],
    );
  }

  Widget _heroImage() {
    final double size = responsive.isDesktop
        ? 220
        : responsive.isTablet
            ? 200
            : 180;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(responsive.radius),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        'assets/images/dp.png',
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) {
          return Center(
            child: Icon(
              Icons.sports_esports,
              color: Colors.white30,
              size: size * 0.45,
            ),
          );
        },
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: responsive.h2,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _projectsGrid() {
    final crossAxisCount = responsive.isDesktop
        ? 3
        : responsive.isTablet
            ? 2
            : 1;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: responsive.gap,
        mainAxisSpacing: responsive.gap,
        childAspectRatio: 1.25,
      ),
      itemBuilder: (_, index) {
        return Container(
          padding: EdgeInsets.all(responsive.gap),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(5),
            borderRadius: BorderRadius.circular(responsive.radius),
            border: Border.all(color: Colors.white12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius:
                        BorderRadius.circular(responsive.radius),
                  ),
                ),
              ),
              SizedBox(height: responsive.gap),
              Text(
                "Prototype ${index + 1}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.body,
                ),
              ),
              SizedBox(height: responsive.gap * .3),
              Text(
                "Unity Gameplay Prototype",
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: responsive.small,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _skills() {
    final skills = [
      (
        logo: "assets/logos/unity.svg",
        title: "Unity Engine",
        description:
            "Built production-ready mobile games with gameplay systems, AI, UI, Addressables, and performance optimization.",
      ),
      (
        logo: "assets/logos/csharp.svg",
        title: "C# Programming",
        description:
            "Developed scalable game systems using object-oriented programming, events, generics, async programming, and clean architecture.",
      ),
      (
        logo: "assets/logos/git.svg",
        title: "Git",
        description:
            "Managed source code using Git, branching strategies, pull requests, and version control.",
      ),
      (
        logo: "assets/logos/blender.svg",
        title: "Blender",
        description:
            "Created and edited low-poly assets, UV maps, and materials for mobile games.",
      ),
      (
        logo: "assets/logos/photoshop.svg",
        title: "Adobe Photoshop",
        description:
            "Designed UI assets, textures, icons, and promotional graphics for games.",
      ),
      (
        logo: "assets/logos/analytics.svg",
        title: "Google Analytics",
        description:
            "Tracked player behavior using custom events, funnels, retention, and user analytics.",
      ),
      (
        logo: "assets/logos/ads.svg",
        title: "Google Mobile Ads",
        description:
            "Integrated rewarded, interstitial, banner, and app open ads for mobile game monetization.",
      ),
      (
        logo: "assets/logos/google.svg",
        title: "Google Play Services",
        description:
            "Integrated Play Games, Play Billing, achievements, and publishing workflows.",
      ),
      (
        logo: "assets/logos/firebase.svg",
        title: "Firebase",
        description:
            "Integrated Firebase services including Analytics, Remote Config, Authentication, and Crashlytics.",
      ),
      (
        logo: "assets/logos/html.svg",
        title: "HTML5",
        description:
            "Built semantic and responsive web pages using modern HTML5 standards.",
      ),
      (
        logo: "assets/logos/css.svg",
        title: "CSS3",
        description:
            "Created responsive layouts with Flexbox, Grid, and modern CSS features.",
      ),
      (
        logo: "assets/logos/js.svg",
        title: "JavaScript",
        description:
            "Developed interactive web functionality using modern JavaScript and DOM manipulation.",
      ),
    ];

   return LayoutBuilder(
      builder: (context, constraints) {
        const cardWidth = 350.0;

        final columns =
            (constraints.maxWidth / cardWidth).floor().clamp(1, 10);

        final spacing = columns > 1
            ? (constraints.maxWidth - (columns * cardWidth)) / (columns + 1)
            : (constraints.maxWidth - cardWidth) / 2;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing),
          child: Wrap(
            spacing: spacing,
            runSpacing: 20,
            children: skills.map((skill) {
              return SizedBox(
                width: cardWidth,
                child: _skillCard(
                  logo: skill.logo,
                  title: skill.title,
                  description: skill.description,
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Widget _skillCard({
    required String logo,
    required String title,
    required String description,
  }) {
    return SizedBox(
      width: 350,
      height: 250,
      child: Card(
        color: Colors.white.withAlpha(5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(responsive.radius),
          side: const BorderSide(color: Colors.white12),
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset(
                      logo,
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(width: 20),

                  Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.body,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Center(
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize:18,
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }

  Widget _contactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle("Let's Work Together"),

        SizedBox(height: responsive.gap * .3),

        Text(
          "I'm available for Unity game development opportunities, freelance projects, and long-term collaborations.",
          style: TextStyle(
            color: Colors.white70,
            fontSize: responsive.body,
            height: 1.6,
          ),
        ),

        SizedBox(height: responsive.gap * 0.3),

        Row(
          children: [
            const Icon(
              Icons.email,
              color: Colors.white70,
            ),
            SizedBox(width: responsive.gap * .25),
            SelectableText(
              "taimoorgamez@gmail.com",
              style: TextStyle(
                color: Colors.white,
                fontSize: responsive.body,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        SizedBox(height: responsive.gap * .3),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.chat,
              color: Colors.white70,
            ),
            SizedBox(width: responsive.gap * .25),
            Expanded(
              child: SelectableText(
                "+92 315 5898130 (WhatsApp Messages Only)",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: responsive.body,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

}
