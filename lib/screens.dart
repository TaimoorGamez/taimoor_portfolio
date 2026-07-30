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
        title: "Unity",
        level: "Advanced",
        description:
            "Gameplay systems, UI, AI, Addressables, optimization and production-ready mobile games.",
        features: [
          "Addressables",
          "UI Toolkit",
          "Animation",
          "Physics",
          "AI",
          "Optimization"
        ],
      ),
      (
        title: "C#",
        level: "Advanced",
        description:
            "Object-Oriented Programming, clean architecture, events, async programming and reusable systems.",
        features: [
          "OOP",
          "SOLID",
          "Events",
          "Generics",
          "LINQ",
        ],
      ),
      (
        title: "Firebase",
        level: "Advanced",
        description:
            "Complete integration for production apps and games.",
        features: [
          "Analytics",
          "Remote Config",
          "Crashlytics",
          "Authentication",
        ],
      ),
      (
        title: "Ad Mediation",
        level: "Advanced",
        description:
            "Monetization, rewarded ads, interstitials and banner management.",
        features: [
          "AdMob",
          "Rewarded",
          "Interstitial",
          "Banner",
        ],
      ),
      (
        title: "Analytics",
        level: "Advanced",
        description:
            "Event tracking, funnels and player behaviour analysis.",
        features: [
          "Firebase Analytics",
          "Custom Events",
          "User Properties",
        ],
      ),
      (
        title: "Git",
        level: "Intermediate",
        description:
            "Version control, branching and collaborative workflows.",
        features: [
          "GitHub",
          "Branches",
          "Pull Requests",
        ],
      ),
      (
        title: "Blender",
        level: "Intermediate",
        description:
            "Basic modelling and editing for game assets.",
        features: [
          "Low Poly",
          "UV",
          "Materials",
        ],
      ),
      (
        title: "Adobe Photoshop",
        level: "Intermediate",
        description:
            "Texture editing, UI assets and marketing graphics.",
        features: [
          "UI",
          "Textures",
          "Icons",
        ],
      ),
      (
        title: "Google Play Services",
        level: "Advanced",
        description:
            "Publishing and Play Console integrations.",
        features: [
          "Play Games",
          "Billing",
          "Signing",
        ],
      ),
      (
        title: "HTML",
        level: "Intermediate",
        description:
            "Responsive webpage layouts and semantic markup.",
        features: [
          "Responsive",
          "SEO",
        ],
      ),
      (
        title: "CSS",
        level: "Intermediate",
        description:
            "Modern responsive layouts and animations.",
        features: [
          "Flexbox",
          "Grid",
        ],
      ),
      (
        title: "JavaScript",
        level: "Beginner",
        description:
            "Interactive web functionality and DOM manipulation.",
        features: [
          "DOM",
          "ES6",
        ],
      ),
    ];

    final int columns = responsive.isDesktop
        ? 4
        : responsive.isTablet
            ? 2
            : 1;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: skills.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: responsive.gap,
        mainAxisSpacing: responsive.gap,
        childAspectRatio: responsive.isDesktop
            ? 1.18
            : responsive.isTablet
                ? 1.25
                : 1.45,
      ),
      itemBuilder: (_, index) {
        final skill = skills[index];

        return InkWell(
          borderRadius: BorderRadius.circular(responsive.radius),
          onTap: () {
            // Navigate to skill details page later.
          },
          child: Container(
            padding: EdgeInsets.all(responsive.gap * .7),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(4),
              borderRadius: BorderRadius.circular(responsive.radius),
              border: Border.all(
                color: Colors.white12,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  skill.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: responsive.h3,
                  ),
                ),

                SizedBox(height: responsive.gap * .2),

                Text(
                  skill.level,
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: responsive.small,
                  ),
                ),

                SizedBox(height: responsive.gap * .4),

                Expanded(
                  child: Text(
                    skill.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: responsive.small,
                      height: 1.5,
                    ),
                  ),
                ),

                SizedBox(height: responsive.gap * .5),

                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: skill.features.take(4).map((feature) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: primaryColor.withAlpha(18),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        feature,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: responsive.small * .85,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _skillCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    final double height = responsive.isMobile
        ? 170
        : responsive.isTablet
            ? 180
            : 190;

    return SizedBox(
      height: height,
      child: Card(
        color: Colors.white.withAlpha(5),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(responsive.radius),
          side: const BorderSide(color: Colors.white12),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          borderRadius: BorderRadius.circular(responsive.radius),
          onTap: () {
            // Open skill details page
          },
          child: Padding(
            padding: EdgeInsets.all(responsive.gap * .8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Icon + Title
                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: primaryColor.withAlpha(15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        icon,
                        color: primaryColor,
                        size: 24,
                      ),
                    ),

                    SizedBox(width: responsive.gap * .6),

                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: responsive.body,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: responsive.gap * .8),

                Expanded(
                  child: Text(
                    description,
                    maxLines: responsive.isMobile ? 3 : 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: responsive.small,
                      height: 1.45,
                    ),
                  ),
                ),

                SizedBox(height: responsive.gap * .5),

                Row(
                  children: [
                    Text(
                      "View Details",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: responsive.small,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(
                      Icons.arrow_forward,
                      color: primaryColor,
                      size: 18,
                    ),
                  ],
                ),
              ],
            ),
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
