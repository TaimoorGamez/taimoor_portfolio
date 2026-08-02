import '../models.dart';
import 'project_screens.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../services/responsive_helper.dart';
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
  HomePage({
    super.key,
    required this.responsive,
    required this.primaryColor,
  });

  final ResponsiveState responsive;
  final Color primaryColor;

  final List<Skill> skills = [
    Skill(
      logo: "assets/logos/unity.svg",
      title: "Unity Engine",
      description:
          "Built production-ready mobile games with gameplay systems, AI, UI, Addressables, and performance optimization.",
    ),
    Skill(
      logo: "assets/logos/csharp.svg",
      title: "C# Programming",
      description:
          "Developed scalable game systems using object-oriented programming, events, generics, async programming, and clean architecture.",
    ),
    Skill(
      logo: "assets/logos/git.svg",
      title: "Git",
      description:
          "Managed source code using Git, branching strategies, pull requests, and version control.",
    ),
    Skill(
      logo: "assets/logos/blender.svg",
      title: "Blender",
      description:
          "Created and edited low-poly assets, UV maps, and materials for mobile games.",
    ),
    Skill(
      logo: "assets/logos/photoshop.svg",
      title: "Adobe Photoshop",
      description:
          "Designed UI assets, textures, icons, and promotional graphics for games.",
    ),
    Skill(
      logo: "assets/logos/analytics.svg",
      title: "Google Analytics",
      description:
          "Tracked player behavior using custom events, funnels, retention, and user analytics.",
    ),
    Skill(
      logo: "assets/logos/ads.svg",
      title: "Google Mobile Ads",
      description:
          "Integrated rewarded, interstitial, banner, and app open ads for mobile game monetization.",
    ),
    Skill(
      logo: "assets/logos/google.svg",
      title: "Google Play Services",
      description:
          "Integrated Play Games, Play Billing, achievements, and publishing workflows.",
    ),
    Skill(
      logo: "assets/logos/firebase.svg",
      title: "Firebase",
      description:
          "Integrated Firebase services including Analytics, Remote Config, Authentication, and Crashlytics.",
    ),
    Skill(
      logo: "assets/logos/html.svg",
      title: "HTML5",
      description:
          "Built semantic and responsive web pages using modern HTML5 standards.",
    ),
    Skill(
      logo: "assets/logos/css.svg",
      title: "CSS3",
      description:
          "Created responsive layouts with Flexbox, Grid, and modern CSS features.",
    ),
    Skill(
      logo: "assets/logos/js.svg",
      title: "JavaScript",
      description:
          "Developed interactive web functionality using modern JavaScript and DOM manipulation.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    
  final List<Project> projects = [
    Project(
      image: "assets/thumbnails/idle.jpg",
      name: "Idle Vlogger",
      onTap: () {
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const IdleVloggerPage(),
        ),
      );},
    ),
    Project(
      image: "assets/thumbnails/police.jpg",
      name: "Endless Terrain Kit",
      onTap: () {
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const EndlessTerrainPage(),
        ),
      );},
    ),
    Project(
      image: "assets/thumbnails/paint.jpg",
      name: "Paint Sort Art",
      onTap: () { 
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const PaintSortArtPage(),
        ),
      );},
    ),
    Project(
      image: "assets/thumbnails/tattoo.jpg",
      name: "Tattoo Shop",
      onTap: () { 
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const TattooShopPage(),
        ),
      );},
    ),
    Project(
      image: "assets/thumbnails/ship.jpg",
      name: "Ship Jam",
      onTap: () {},
    ),
    Project(
      image: "assets/thumbnails/ludo.jpg",
      name: "Ludo",
      onTap: () {},
    ),
  ];

    return Scaffold(
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

                _sectionTitle("Projects"),

                SizedBox(height: responsive.gap),

                _projects(projects),

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _heroImage(),

              SizedBox(width: responsive.gap * 2),

              Column(
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
            ],
          ),

          SizedBox(height: responsive.gap * 1.5),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.gap,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: responsive.gap),
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

  Widget _projects(List<Project> projects) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 20,
        runSpacing: 20,
        children: projects.map(_projectCard).toList(),
      ),
    );
  }

  Widget _projectCard(Project project) {
    return GestureDetector(
      onTap: project.onTap,
      child: SizedBox(
        width: 400,
        height: 225,
        child: Card(
          color: Colors.white.withAlpha(5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(responsive.radius),
            side: const BorderSide(color: Colors.white12),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  project.image,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(180),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    project.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _skills() {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 20,
        runSpacing: 20,
        children: skills.map(_skillCard).toList(),
      ),
    );
  }

  Widget _skillCard(Skill skill) {
    return SizedBox(
      width: 400,
      height: 225,
      child: Card(
        color: Colors.white.withAlpha(5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(responsive.radius),
          side: const BorderSide(color: Colors.white12),
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
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
                      skill.logo,
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(width: 20),

                  Text(
                    skill.title,
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

              const SizedBox(height: 10),

              Center(
                child: Text(
                  skill.description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.chat,
              color: Colors.white70,
            ),
            SizedBox(width: responsive.gap * .25),
            SelectableText(
              "+92 315 5898130 (WhatsApp Messages Only)",
              style: TextStyle(
                color: Colors.white,
                fontSize: responsive.body,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

}
