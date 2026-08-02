import '../models.dart';
import 'skill_screen.dart';
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
  const HomePage({
    super.key,
    required this.responsive,
    required this.primaryColor,
  });

  final ResponsiveState responsive;
  final Color primaryColor;

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
        onTap: () { 
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ShipJamPage(),
          ),
        );},
      ),
      Project(
        image: "assets/thumbnails/ludo.jpg",
        name: "Ludo",
        onTap: () { 
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const LudoPage(),
          ),
        );},
      ),
    ];
    
    final List<Skill> skills = [
      Skill(
        logo: "assets/logos/unity.svg",
        title: "Unity Engine",
          description: [
            "Strong understanding of Unity Engine architecture and editor workflow.",
            "URP pipeline, Shader Graph, custom UI shaders, and rendering optimization.",
            "Gameplay systems, AI, ScriptableObject architecture, and event-driven design.",
            "Addressables, object pooling, asset management, and memory optimization.",
            "Unity Physics (2D & 3D), Timeline, animation system, and particle effects.",
            "Unity Profiler, Frame Debugger, batching, and mobile optimization.",
            "Camera systems, Cinemachine, and post-processing.",
            "Terrain tools, procedural generation, pathfinding, and reusable frameworks.",
            "Play Store publishing, Firebase, ads, analytics, and live game maintenance.",
          ]),
      Skill(
        logo: "assets/logos/csharp.svg",
        title: "C# Programming",
          description: [
            "Strong understanding of object-oriented programming (OOP) principles including encapsulation, inheritance, abstraction, and polymorphism.",
            "Designed modular and reusable gameplay systems using interfaces, composition, and event-driven architecture.",
            "Developed scalable game frameworks with clear separation of gameplay, UI, data, and service layers.",
            "Experience with delegates, events, async/await, coroutines, generics, collections, and LINQ.",
            "Built extensible systems using dependency reduction, reusable components, and clean code practices.",
            "Implemented data-driven architectures using ScriptableObjects, configuration classes, and runtime data models.",
            "Optimized gameplay code by minimizing allocations, reducing update overhead, and improving maintainability.",
          ]),
      Skill(
        logo: "assets/logos/git.svg",
        title: "Git",
          description: [
          "Daily Git workflow for professional Unity projects using GitHub.",
          "Worked in multi-developer teams alongside programmers, artists, designers, and QA using a shared Git workflow.",
          "Experienced with feature branching, development branches, release branches, and production (main/master) branches.",
          "Followed a team workflow where developers created feature branches from the development branch, submitted Pull Requests back to development, and only stable release builds were merged into the main branch.",
          "Created, reviewed, and resolved Pull Requests while handling merge conflicts during collaborative development.",
          "Good understanding of Git trees, commit history, branching strategies, merges, tags, and release management.",
          "Configured .gitignore files for Unity projects and managed large repositories while excluding generated and temporary files.",
        ]),
      Skill(
        logo: "assets/logos/blender.svg",
        title: "Blender",
          description: [
          "Proficient in Blender for creating production-ready low-poly and stylized game assets for Unity projects.",
          "Modeled a wide variety of game assets including vehicles, environmental props, buildings, tools, obstacles, and gameplay objects.",
          "Created complete 3D assets from concept to game-ready models, including UV unwrapping, materials, and export optimization.",
          "Experienced with mesh editing, modifiers, topology cleanup, pivot setup, and asset optimization for real-time mobile games.",
        ]),
      Skill(
        logo: "assets/logos/photoshop.svg",
        title: "Adobe Photoshop",
          description: [
            "Designed and edited game UI elements, icons, buttons, backgrounds, promotional artwork, screenshots, and store graphics for mobile games.",
            "Created and optimized textures, sprite sheets, masks, seamless assets, and game-ready visual resources for Unity projects.",
            "Strong understanding of selection tools, Pen Tool, layer masks, adjustment layers, smart objects, blending modes, clipping masks, and non-destructive editing workflows.",
          ]),
      Skill(
        logo: "assets/logos/analytics.svg",
        title: "Analytics",
          description: [
          "Integrated multiple analytics SDKs into Unity projects, including Firebase Analytics, Google Analytics, Falcon, and other third-party services.",
          "Implemented SDKs independently by studying official documentation, configuring project dependencies, and validating event delivery.",
          "Designed custom analytics events to track gameplay progression, player behavior, economy, tutorials, rewards, advertisements, and feature usage.",
        ]),
      Skill(
        logo: "assets/logos/ads.svg",
        title: "Mobile Ads",
        description: [
          "Integrated Google AdMob, Unity Ads, AppLovin MAX, and IronSource (LevelPlay) into production Unity projects.",
          "Implemented rewarded, interstitial, rewarded interstitial, banner, and app open advertisements.",
          "Configured mediation platforms, ad loading, callbacks, retry mechanisms, and complete ad lifecycle management.",
          "Integrated additional ad networks through mediation by following official SDK documentation.",
        ]),
      Skill(
        logo: "assets/logos/google.svg",
        title: "Google Play Services",
          description: [
          "Integrated Google Sign-In and Facebook Login into Unity games, allowing players to securely authenticate and access their profiles.",
          "Implemented Google Play Games Services for player authentication, achievements, and leaderboard integration in offline and hybrid mobile games.",
          "Worked with player profile retrieval, including display names and profile images, to personalize the in-game experience.",
          "Configured platform-specific SDKs, OAuth credentials, SHA certificates, and project settings by following official Google and Facebook documentation.",
        ]),
      Skill(
        logo: "assets/logos/firebase.svg",
        title: "Firebase",
          description: [
          "Integrated Firebase into multiple Unity projects for production-ready mobile games.",
          "Implemented Firebase Analytics with custom gameplay events to track player progression, economy, tutorials, advertisements, and feature usage.",
          "Configured Firebase Remote Config to remotely control gameplay parameters, feature flags, advertisements, and live game settings without requiring app updates.",
          "Worked with Firebase Crashlytics to monitor crashes, identify production issues, and improve application stability.",
        ]),
      Skill(
        logo: "assets/logos/flutter.svg",
        title: "Flutter & Dart",
        description: [
          "Developed production-quality Flutter applications using Dart with clean, maintainable architecture.",
          "Experienced with Riverpod state management, responsive UI design, reusable widgets, navigation, local storage, Firebase, Supabase, and mobile integrations.",
          "Built complete application features including resume generation, PDF export, authentication, analytics, advertisements, and backend-driven content.",
        ],),
      Skill(
        logo: "assets/logos/html.svg",
        title: "HTML5",
        description: [
          "Created and modified HTML pages for small front-end projects, landing pages, and website layouts.",
          "Built responsive static web interfaces, including a construction company website and Blogger customizations.",
          "Worked with forms, images, navigation, media embedding, and basic page styling while integrating external assets.",
          "Comfortable reading, editing, and extending existing HTML codebases for project-specific requirements.",
        ]),
      Skill(
        logo: "assets/logos/css.svg",
        title: "CSS3",
        description: [
          "Designed and styled responsive web pages using CSS for personal and small front-end projects.",
          "Worked with layouts, typography, colors, spacing, Flexbox, positioning, and responsive design principles.",
          "Created CSS-based transitions and animations to improve user interaction and visual presentation.",
          "Comfortable modifying and extending existing stylesheets to match project requirements and UI designs.",
        ]),
      Skill(
        logo: "assets/logos/js.svg",
        title: "JavaScript",        
        description: [
          "Used JavaScript to add interactivity and client-side functionality to front-end web projects.",
          "Implemented button click events, DOM manipulation, dynamic content updates, and user interaction logic.",
          "Worked with adding, removing, and modifying CSS classes and inline styles at runtime to create responsive UI behavior.",
          "Comfortable reading and extending existing JavaScript code for small web features and interface customization.",
        ]),
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

                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 20,
                    runSpacing: 20,
                    children: projects.map(_projectCard).toList(),
                  ),
                ),

                SizedBox(height: responsive.gap * 3),

                _sectionTitle("Skills"),

                SizedBox(height: responsive.gap),

                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 20,
                    runSpacing: 20,
                    children: skills.map((skill) => _skillCard(skill, context)).toList(),
                  ),
                ),

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

  Widget _skillCard(Skill skill, BuildContext context) {
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
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SkillScreen(skill: skill),
              ),
            );
          },
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
          
                    Text( skill.title, 
                    maxLines: 2, overflow: 
                    TextOverflow.ellipsis, 
                    style: TextStyle( color: Colors.white, 
                      fontSize: responsive.body, 
                      fontWeight: FontWeight.bold, )),          
                  ],
                ),
          
                const SizedBox(height: 10),
          
                Center(
                  child: Text(
                      skill.description
                          .take(3)
                          .map((e) => "• $e")
                          .join("\n"),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    )
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
