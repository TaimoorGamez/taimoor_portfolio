import 'package:flutter/material.dart';
import '../services/responsive_helper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//------------------ Idle Vlogger-------------
class IdleVloggerPage extends ConsumerWidget {
  const IdleVloggerPage({super.key});

  static const String githubUrl = "https://github.com/TaimoorGamez/Kamal---Idle-Vlogger.git";

  Future<void> _openGithub() async {
    final uri = Uri.parse(githubUrl);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch GitHub");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: responsive.contentWidth,
            ),
            child: Padding(
              padding: EdgeInsets.all(responsive.gap),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    _projectHeader(context),

                    SizedBox(height: responsive.gap),

                    responsive.isDesktop
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                        _thumbnail(),

                        SizedBox(width: responsive.gap * 1.5),

                        Expanded(
                            child: _projectInfo(),
                        ),
                        ],
                    )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        _thumbnail(),

                        SizedBox(height: responsive.gap),

                        _projectInfo(),
                        ],
                    ),

                  SizedBox(height: responsive.gap * 2.5),

                  _updateSystemSection(ref),

                  SizedBox(height: responsive.gap * 2.5),

                  _eventArchitectureSection(ref),

                  SizedBox(height: responsive.gap * 2.5),

                  _objectPoolingSection(ref),

                  SizedBox(height: responsive.gap * 2.5),

                  _addressablesSection(ref),

                  SizedBox(height: responsive.gap * 2.5),

                  _persistentSaveSection(ref),

                  SizedBox(height: responsive.gap * 2.5),

                  _economyFrameworkSection(ref),

                  SizedBox(height: responsive.gap * 2.5),
                  
                  _audioSystemSection(ref),

                  SizedBox(height: responsive.gap * 2.5),

                  _adsFrameworkSection(ref),

                  SizedBox(height: responsive.gap * 2.5),

                  _iapSection(ref),

                  SizedBox(height: responsive.gap * 2.5),
                  
                  _firebaseSection(ref),

                  SizedBox(height: responsive.gap * 2.5),
                  
                  _debugToolsSection(ref),

                  SizedBox(height: responsive.gap * 2.5),

                  _toastFrameworkSection(ref),

                  SizedBox(height: responsive.gap * 2.5),
                  
                  _projectStructureSection(ref),
                  // Other sections...
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _projectHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.home_rounded, size: 34),
        ),

        const SizedBox(width: 10),

        const Expanded(
          child: Text(
            "Idle Vlogger",
            textAlign: TextAlign.center,  
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              
            ),
          ),
        ),
      ],
    );
  }

  Widget _thumbnail() {
      return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
          width: 400,
          height: 225,
          child: Image.asset(
              "assets/thumbnails/idle.jpg",
              fit: BoxFit.cover,
          ),
          ),
      );
      }

  Widget _projectInfo() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text(
              "A complete idle simulation prototype developed in Unity using modular gameplay architecture, reusable systems, event-driven programming, Addressables, object pooling, and scalable gameplay design. The project focuses on clean architecture and maintainable code rather than game-specific implementation.",
              style: TextStyle(
              fontSize: 16,
              height: 1.7,
              ),
          ),

          const SizedBox(height: 24),

          SizedBox(
          height: 48,
          child: ElevatedButton.icon(
              onPressed: _openGithub,
              icon: const Icon(Icons.code),
              label: const Text("View GitHub Repository"),
              style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff1e293b), // Dark slate
          foregroundColor: Colors.white,
          elevation: 0,
          side: BorderSide(
              color: const Color(0xff111827),
              width: 1.2,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 14,
          )))),
          ],
      );
      }

  Widget _zoomableImage({
    required WidgetRef ref,
    required String asset,
  }) {
    final responsive = ref.watch(responsiveProvider);

    return GestureDetector(
      onTap: () {
        showDialog(
          context: ref.context,
          barrierColor: Colors.black87,
          builder: (_) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  InteractiveViewer(
                    minScale: 1,
                    maxScale: 5,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(responsive.radius),
                      child: Image.asset(asset),
                    ),
                  ),

                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(ref.context),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(responsive.radius),
            child: Image.asset(
              asset,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            right: 12,
            bottom: 12,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.zoom_in,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _conceptCard({
    required WidgetRef ref,
    required String title,
    required String description,
  }) {
    final responsive = ref.watch(responsiveProvider);

    return Padding(
      padding: EdgeInsets.only(bottom: responsive.gap),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(responsive.gap),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(8),
          borderRadius: BorderRadius.circular(responsive.radius),
          border: Border.all(color: Colors.white12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: responsive.h3,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: responsive.gap * .35),

            Text(
              description,
              style: TextStyle(
                color: Colors.white70,
                fontSize: responsive.body,
                height: 1.7,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _updateSystemSection(WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reusable Upgrade Framework",
          style: TextStyle(
            fontSize: responsive.h2,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        SizedBox(height: responsive.gap),

      _zoomableImage(
      ref: ref,
      asset: "assets/idle/update_idle.png",
      ),
      
        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Inheritance",
          description:
              "A common UpdateSystem base class provides all upgrade functionality. ApartmentUpdates, CameraUpdates, and AppearanceUpdate inherit the framework while implementing only their category-specific behaviour.",
        ),

        _conceptCard(
          ref: ref,
          title: "Polymorphism",
          description:
              "The framework invokes overridden methods such as UpdatePriceForAll() and GetAvailableUpdates(), allowing each upgrade system to provide its own implementation through the same interface.",
        ),

        _conceptCard(
          ref: ref,
          title: "Abstraction",
          description:
              "Pricing, upgrade processing, offline timers, restrictions, state persistence, and UI updates are encapsulated inside UpdateSystem. Child classes interact only through reusable methods such as UpdateItemProcess() and UpdateCost().",
        ),

        _conceptCard(
          ref: ref,
          title: "Encapsulation",
          description:
              "Internal upgrade data, pricing information, timers, and state management remain protected within the framework, preventing direct modification from external systems.",
        ),

        _conceptCard(
          ref: ref,
          title: "Template Method Pattern",
          description:
              "UpdateSystem defines the complete upgrade workflow while derived classes customize only the required steps by overriding virtual methods, creating a reusable and extensible architecture.",
        ),

        _conceptCard(
          ref: ref,
          title: "SOLID Principles",
          description:
              "The framework follows Single Responsibility (SRP), Open/Closed (OCP), and Liskov Substitution (LSP), allowing new upgrade categories to be added without modifying the existing framework.",
        ),
      ],
    );
  }

  Widget _eventArchitectureSection(WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Event-Driven Architecture",
          style: TextStyle(
            fontSize: responsive.h2,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/idle/events.jpg",
          ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Observer Pattern",
          description:
              "Gameplay systems communicate through events instead of direct references. Components subscribe when enabled and unsubscribe when disabled, allowing systems to react independently to gameplay changes.",
        ),

        _conceptCard(
          ref: ref,
          title: "Publish / Subscribe Architecture",
          description:
              "A centralized event framework broadcasts gameplay events such as economy updates, UI refreshes, audio triggers, advertisements, daily rewards, and progression. Publishers never need to know which systems are listening.",
        ),

        _conceptCard(
          ref: ref,
          title: "Loose Coupling",
          description:
              "Independent systems remain decoupled by exchanging events rather than object references. This reduces dependencies, simplifies maintenance, and allows new features to be integrated without modifying existing systems.",
        ),

        _conceptCard(
          ref: ref,
          title: "Centralized Event Bus",
          description:
              "SimpleEventsHolder, SingleIntegerEventsHolder, and DoubleIntegerEventHolder organize global game events by parameter type, providing a reusable communication layer shared across the entire project.",
        ),

        _conceptCard(
          ref: ref,
          title: "Strongly Typed Events",
          description:
              "Custom delegates define compile-time safe event signatures for parameterless events, single-value events, and multi-parameter events, eliminating string-based messaging and reducing runtime errors.",
        ),

        _conceptCard(
          ref: ref,
          title: "Scalable Modular Architecture",
          description:
              "Game flow, economy, audio, advertisements, rewards, UI, and progression systems all communicate through the same reusable event framework, enabling large gameplay systems to scale while remaining easy to extend.",
        ),
      ],
    );
  }

  Widget _objectPoolingSection(WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Object Pooling",
          style: TextStyle(
            fontSize: responsive.h2,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/idle/pool_idle.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Object Pool Pattern",
          description:
              "Cash particles are pre-instantiated during initialization and stored inside a Queue<GameObject>. Gameplay reuses existing objects instead of creating new GameObjects every spawn.",
        ),

        _conceptCard(
          ref: ref,
          title: "Queue-Based Pool Management",
          description:
              "A Queue<GameObject> manages available objects using FIFO order. Objects are dequeued when spawned and enqueued again after completing their animation, providing efficient reuse with minimal overhead.",
        ),

        _conceptCard(
          ref: ref,
          title: "Performance Optimization",
          description:
              "Repeated Instantiate() and Destroy() calls are eliminated during gameplay, significantly reducing CPU usage and garbage collection spikes for smoother mobile performance.",
        ),

        _conceptCard(
          ref: ref,
          title: "Object Lifecycle Management",
          description:
              "Objects transition between inactive and active states using SetActive(). After completing their animation they automatically return to the pool, making them immediately available for future reuse.",
        ),

        _conceptCard(
          ref: ref,
          title: "Coroutine-Based Spawning",
          description:
              "A coroutine controls continuous spawning at a configurable rate, providing lightweight asynchronous execution without blocking the main game loop.",
        ),

        _conceptCard(
          ref: ref,
          title: "DOTween Integration",
          description:
              "Each pooled object performs movement and rotation animations through DOTween sequences before automatically returning itself to the pool when the animation completes.",
        ),
      ],
    );
  }

  Widget _addressablesSection(WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Addressables Framework",
          style: TextStyle(
            fontSize: responsive.h2,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/idle/addressables_idle.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Asynchronous Asset Loading",
          description:
              "Gameplay assets are loaded asynchronously using Unity Addressables, preventing frame freezes while large assets are retrieved in the background.",
        ),

        _conceptCard(
          ref: ref,
          title: "Memory Management",
          description:
              "Loaded assets are released through the Addressables API after use, reducing memory consumption and avoiding unnecessary resource retention.",
        ),

        _conceptCard(
          ref: ref,
          title: "Dynamic Content Loading",
          description:
              "Characters, environments, UI elements, and gameplay assets are instantiated dynamically from Addressable references instead of direct scene dependencies.",
        ),

        _conceptCard(
          ref: ref,
          title: "Label-Based Asset Organization",
          description:
              "Assets are grouped using Addressable labels, allowing complete categories of content to be loaded without hardcoding individual asset references.",
        ),

        _conceptCard(
          ref: ref,
          title: "Content Catalog",
          description:
              "Addressables use a generated content catalog to resolve asset locations at runtime, enabling scalable asset management across the project.",
        ),

        _conceptCard(
          ref: ref,
          title: "Decoupled Asset References",
          description:
              "Gameplay systems reference assets through Addressable keys instead of direct prefab references, improving modularity and reducing scene dependencies.",
        ),
      ],
    );
  }

  Widget _persistentSaveSection(WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Persistent Save System",
          style: TextStyle(
            fontSize: responsive.h2,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/idle/persistent.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Automatic Initialization",
          description:
              "Every database variable initializes itself with a default value when accessed for the first time, ensuring missing save keys never cause runtime errors.",
        ),

        _conceptCard(
          ref: ref,
          title: "JSON Serialization",
          description:
              "Complex objects are stored using Unity JsonUtility through the JsonDB helper, enabling structured save data beyond primitive values while keeping serialization reusable.",
        ),

        _conceptCard(
          ref: ref,
          title: "Strongly Typed Data Access",
          description:
              "Gameplay systems interact with typed database objects instead of raw string keys, reducing duplication, preventing key mismatches, and improving maintainability.",
        ),

              _conceptCard(
          ref: ref,
          title: "Persistent Data Storage",
          description:
              "Player progress, upgrades, currencies, settings, rewards, timers, and gameplay state are automatically persisted using Unity PlayerPrefs, allowing progress to survive between game sessions.",
        ),

        _conceptCard(
          ref: ref,
          title: "Database Wrapper Layer",
          description:
              "Custom DBInt, DBFloat, and DBString wrapper classes abstract direct PlayerPrefs access behind strongly typed properties, providing a clean and reusable persistence API throughout the project.",
        ),

        _conceptCard(
          ref: ref,
          title: "Centralized Data Repository",
          description:
              "DBVariablesHolder acts as a single source of truth for every persistent game variable, allowing all gameplay systems to access shared save data through one centralized location.",
        ),
      ],
    );
  }

  Widget _economyFrameworkSection(WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Economy Framework",
          style: TextStyle(
            fontSize: responsive.h2,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/idle/economy.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Event-Driven UI Synchronization",
          description:
              "Currency classes automatically broadcast events whenever balances change. UI controllers subscribe to these events and refresh themselves instantly without polling or directly referencing gameplay systems.",
        ),

        _conceptCard(
          ref: ref,
          title: "Separation of Responsibilities (SRP)",
          description:
              "Economy logic, persistence, reward progression, and UI rendering are separated into independent classes. Currency classes manage balances, controllers update the interface, and gameplay systems only perform transactions.",
        ),

        _conceptCard(
          ref: ref,
          title: "Encapsulation",
          description:
              "All balance updates pass through controlled property setters where persistence, task tracking, analytics, and UI notifications are executed automatically. External systems cannot bypass the economy workflow.",
        ),

        _conceptCard(
          ref: ref,
          title: "Persistent Economy",
          description:
              "Player currency is automatically saved whenever balances change and restored during initialization, allowing the entire economy to persist across game sessions without additional save logic.",
        ),

        _conceptCard(
          ref: ref,
          title: "Extensible Multi-Currency Framework",
          description:
              "The framework supports multiple independent currencies including Cash, Gold, and Subscribers while sharing a consistent architecture. New currency types can be introduced with minimal changes to existing systems.",
        ),

      ],
    );
  }

  Widget _audioSystemSection(WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Audio Framework",
          style: TextStyle(
            fontSize: responsive.h2,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/idle/sfx.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Centralized Audio Manager",
          description:
              "A single SoundManager controls background music, UI sounds, and gameplay sound effects, providing one reusable entry point for the entire game's audio system.",
        ),

        _conceptCard(
          ref: ref,
          title: "Event-Driven Audio",
          description:
              "Gameplay systems never communicate directly with the SoundManager. Audio playback is triggered through the global event system, allowing any feature to play sounds without creating object dependencies.",
        ),

        _conceptCard(
          ref: ref,
          title: "Independent Audio Channels",
          description:
              "Background music, button clicks, and gameplay sound effects are separated into dedicated AudioSources, allowing each category to operate independently without interrupting one another.",
        ),

        _conceptCard(
          ref: ref,
          title: "Dynamic Runtime Audio Sources",
          description:
              "When multiple sound effects are triggered simultaneously, temporary AudioSources are created and destroyed automatically, preventing audio clipping while supporting overlapping sound playback.",
        ),

        _conceptCard(
          ref: ref,
          title: "Runtime Audio Configuration",
          description:
              "Music and sound effects can be enabled or disabled at runtime. AudioSources are created only when required and removed when disabled, reducing unnecessary resource usage.",
        ),

        _conceptCard(
          ref: ref,
          title: "Scalable Audio Architecture",
          description:
              "New music tracks, UI sounds, and gameplay effects can be added simply by extending the audio library without changing the communication architecture used throughout the project.",
        ),
      ],
    );
  }

  Widget _adsFrameworkSection(WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Advertisement Framework",
          style: TextStyle(
            fontSize: responsive.h2,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/idle/ads.png",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Extensible Ad Architecture",
          description:
              "A reusable AdHandler base class defines a common interface for loading, displaying, and managing advertisements. New advertisement formats can be added by implementing the same framework without modifying existing systems.",
        ),

        _conceptCard(
          ref: ref,
          title: "Polymorphism",
          description:
              "Interstitial and Rewarded advertisements inherit from the same base class while providing their own loading, availability checks, and display behaviour through overridden methods.",
        ),

        _conceptCard(
          ref: ref,
          title: "Remote Advertisement Configuration",
          description:
              "Advertisement behaviour is controlled through Firebase Remote Config, allowing rewarded ads, interstitial ads, timings, purchase availability, and advertisement blocking to be configured remotely without releasing a new build.",
        ),

        _conceptCard(
          ref: ref,
          title: "Asynchronous Advertisement Lifecycle",
          description:
              "Advertisements are loaded asynchronously, event callbacks handle loading, displaying, closing, failures, and rewards, while automatic reloading keeps inventory available during gameplay.",
        ),

        _conceptCard(
          ref: ref,
          title: "Reward Routing System",
          description:
              "A centralized reward pipeline maps rewarded advertisements to gameplay actions such as income multipliers, ad blockers, daily rewards, spin rewards, premium currency, and cash rewards without coupling advertisement code to gameplay systems.",
        ),

        _conceptCard(
          ref: ref,
          title: "State & Availability Management",
          description:
              "The framework prevents overlapping advertisements using runtime state flags, cooldown timers, purchase checks, and availability validation, ensuring advertisements are shown only under valid gameplay conditions.",
        ),

        _conceptCard(
          ref: ref,
          title: "Event-Driven Integration",
          description:
              "Advertisement rewards, cooldown timers, and gameplay updates communicate through the project's event system, keeping advertisement logic completely decoupled from gameplay components.",
        ),
      ],
    );
  }

  Widget _iapSection(WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "In-App Purchase Framework",
          style: TextStyle(
            fontSize: responsive.h2,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/idle/iap.png",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Extensible Product Architecture",
          description:
              "A reusable StoreProduct base class defines the purchase workflow while specialized product types implement their own purchase behaviour, allowing additional product categories to be introduced without modifying the purchasing system.",
        ),

        _conceptCard(
          ref: ref,
          title: "Polymorphism",
          description:
              "NonConsumableProduct and ConsumableProduct override BuyProduct() to execute different purchase logic while sharing the same purchasing pipeline, enabling the framework to process multiple product types uniformly.",
        ),

        _conceptCard(
          ref: ref,
          title: "Data-Driven Product Registration",
          description:
              "Products are registered dynamically from serialized product definitions into a dictionary, allowing the purchasing system to map store products to gameplay behaviour without hardcoded purchase logic.",
        ),

        _conceptCard(
          ref: ref,
          title: "Asynchronous Store Integration",
          description:
              "Store connection, product retrieval, purchases, and confirmations execute asynchronously using Unity IAP callbacks, ensuring the game remains responsive during store operations.",
        ),

        _conceptCard(
          ref: ref,
          title: "Purchase Lifecycle Management",
          description:
              "The framework manages the complete purchase lifecycle including initialization, product fetching, purchase requests, pending purchases, confirmations, failures, and store disconnections through a centralized controller.",
        ),

        _conceptCard(
          ref: ref,
          title: "Localized Store Metadata",
          description:
              "Product prices are retrieved directly from the store at runtime, allowing the UI to display localized pricing automatically for different currencies and regions.",
        ),

        _conceptCard(
          ref: ref,
          title: "Plugin Decoupling",
          description:
              "Gameplay systems remain independent of Unity IAP. Purchase processing is isolated inside a dedicated framework, while purchased products update game data and analytics without exposing store-specific implementation throughout the project.",
        ),
      ],
    );
  }

  Widget _firebaseSection(WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Firebase Analytics & Remote Config",
          style: TextStyle(
            fontSize: responsive.h2,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/idle/firebase.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Remote Config",
          description:
              "Advertisement configuration is downloaded from Firebase Remote Config during startup, enabling live configuration changes without publishing a new game update.",
        ),

        _conceptCard(
          ref: ref,
          title: "Asynchronous Initialization",
          description:
              "Firebase dependencies and Remote Config are initialized asynchronously using ContinueWith(), ensuring the game remains responsive while online services load in the background.",
        ),

        _conceptCard(
          ref: ref,
          title: "Runtime Configuration",
          description:
              "Downloaded Remote Config values are converted into strongly typed configuration objects and applied at runtime, allowing systems such as advertisements to be controlled remotely.",
        ),

        _conceptCard(
          ref: ref,
          title: "Custom Analytics Framework",
          description:
              "Gameplay systems record custom analytics events through LogEvent(), allowing upgrades, rewards, progression, and player actions to be tracked consistently without coupling gameplay code to Firebase Analytics.",
        ),

        _conceptCard(
          ref: ref,
          title: "Reusable Plugin Architecture",
          description:
              "Firebase initialization, analytics, and cloud configuration are isolated from gameplay logic, making the service reusable across multiple projects while keeping game systems clean and maintainable.",
        ),
      ],
    );
  }

  Widget _debugToolsSection(WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Debugging & Developer Tools",
          style: TextStyle(
            fontSize: responsive.h2,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/idle/debugger.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Mobile Runtime Debugging",
          description:
              "An in-game debugging panel designed for testing on physical Android devices where the Unity Console is unavailable. Runtime logs are captured and displayed directly inside the game, making it easier to diagnose issues during mobile testing.",
        ),

        _conceptCard(
          ref: ref,
          title: "Automatic Log Capture",
          description:
              "The tool listens to Unity's Application.logMessageReceived callback and records every runtime log, warning, and error into a scrollable in-game console for immediate inspection.",
        ),

        _conceptCard(
          ref: ref,
          title: "Real-Time Log Viewer",
          description:
              "New log messages are added dynamically, the interface automatically rebuilds its layout, and the view scrolls to the latest entry, allowing developers to monitor application behaviour in real time.",
        ),

        _conceptCard(
          ref: ref,
          title: "Developer Testing Utility",
          description:
              "A lightweight developer tool that can be toggled during gameplay to simplify debugging on mobile devices without requiring a USB connection or the Unity Editor.",
        ),
      ],
    );
  }

  Widget _toastFrameworkSection(WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Toast Notification Framework",
          style: TextStyle(
            fontSize: responsive.h2,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/idle/toast.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Duplicate Message Handling",
          description:
              "The framework detects repeated notification requests and prevents identical toast messages from being recreated while already visible, avoiding unnecessary UI spam and improving the player experience.",
        ),

        _conceptCard(
          ref: ref,
          title: "Automatic Lifetime Management",
          description:
              "Each notification manages its own display duration using coroutines and automatically hides after a configurable timeout without requiring manual cleanup from gameplay systems.",
        ),

        _conceptCard(
          ref: ref,
          title: "Reusable Animation Pipeline",
          description:
              "DOTween powers reusable entrance and exit animations with centralized movement and scaling effects, providing consistent transitions for every notification across the game.",
        ),

        _conceptCard(
          ref: ref,
          title: "Decoupled UI Architecture",
          description:
              "Gameplay code remains completely independent from presentation logic. Systems only request a notification by its identifier while the framework handles message selection, animation, timing, and visibility internally.",
        ),
      
        _conceptCard(
          ref: ref,
          title: "Reusable Notification Framework",
          description:
              "A centralized toast notification system designed as a reusable framework that can be integrated into any Unity project. Gameplay systems display notifications through a single interface without implementing their own UI logic.",
        ),

        _conceptCard(
          ref: ref,
          title: "Event-Driven Communication",
          description:
              "Toast messages are triggered through the global event system, allowing gameplay, advertisements, purchases, economy, and progression systems to notify the player without direct references to the UI.",
        ),

      ],
    );
  }

  Widget _projectStructureSection(WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Feature-Based Project Structure",
          style: TextStyle(
            fontSize: responsive.h2,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/idle/folder.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Feature-Based Organization",
          description:
              "Instead of grouping all Scripts, Prefabs, or Materials into global folders, every major gameplay feature owns its complete folder structure. Gameplay, Economy, Splash, Audio, and In-App Purchase systems, etc remain isolated and self-contained.",
        ),

        _conceptCard(
          ref: ref,
          title: "Modular Architecture",
          description:
              "Each module contains its own Scripts, Prefabs, Materials, Sprites, Animations, and other assets, allowing entire systems to be moved, reused, or maintained independently without affecting unrelated features.",
        ),

        _conceptCard(
          ref: ref,
          title: "High Reusability",
          description:
              "Complete systems can be extracted into another Unity project by copying a single feature folder instead of collecting assets from multiple global directories.",
        ),

        _conceptCard(
          ref: ref,
          title: "Low Coupling",
          description:
              "Keeping assets close to the code that owns them reduces cross-feature dependencies, making the project easier to extend, debug, and maintain.",
        ),

        _conceptCard(
          ref: ref,
          title: "Scalable Team Workflow",
          description:
              "Feature ownership minimizes merge conflicts because developers work inside independent modules rather than modifying shared asset folders.",
        ),

        _conceptCard(
          ref: ref,
          title: "Maintainability",
          description:
              "Every feature has a predictable internal layout, making assets quick to locate and simplifying long-term maintenance as the project grows.",
        ),
      ],
    );
  }

}

//------------------ Endless World Kit--------
class EndlessTerrainPage extends ConsumerWidget {
  const EndlessTerrainPage({super.key});

  static const String githubUrl = "https://github.com/TaimoorGamez/PolicePursuit.git";

  Future<void> _openGithub() async {
    final uri = Uri.parse(githubUrl);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch GitHub");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: responsive.contentWidth,
            ),
            child: Padding(
              padding: EdgeInsets.all(responsive.gap),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _projectHeader(context),

                    SizedBox(height: responsive.gap),

                    responsive.isDesktop
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        _thumbnail(),

                        SizedBox(width: responsive.gap * 1.5),

                        Expanded(
                            child: _projectInfo(),
                        ),
                        ],
                    )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        _thumbnail(),

                        SizedBox(height: responsive.gap),

                        _projectInfo(),
                        ],
                    ),

                  SizedBox(height: responsive.gap * 2.5),

                  _endlessTerrainFrameworkSection(ref),
                  
                  // Other sections...
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _projectHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.home_rounded, size: 34),
        ),

        const SizedBox(width: 10),

        const Expanded(
          child: Text(
            "Endless Terrain Kit",
            textAlign: TextAlign.center,  
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              
            ),
          ),
        ),
      ],
    );
  }

  Widget _thumbnail() {
        return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
            width: 400,
            height: 225,
            child: Image.asset(
                "assets/thumbnails/police.jpg",
                fit: BoxFit.cover,
            ),
            ),
        );
      }

  Widget _projectInfo() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          const Text(
            "A modular Unity framework focused on endless world streaming, reusable gameplay architecture, ScriptableObject-driven systems, extensible AI, and scalable world management. Built to rapidly create endless driving, survival, combat, and exploration games by reusing the same core systems.",
            style: TextStyle(
              fontSize: 16,
              height: 1.7,
            ),
          ),

          const SizedBox(height: 24),

          SizedBox(
          height: 48,
          child: ElevatedButton.icon(
              onPressed: _openGithub,
              icon: const Icon(Icons.code),
              label: const Text("View GitHub Repository"),
              style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff1e293b), // Dark slate
          foregroundColor: Colors.white,
          elevation: 0,
          side: BorderSide(
              color: const Color(0xff111827),
              width: 1.2,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 14,
          )))),
          ],
      );
      }

  Widget _zoomableImage({
    required WidgetRef ref,
    required String asset,
  }) {
    final responsive = ref.watch(responsiveProvider);

    return GestureDetector(
      onTap: () {
        showDialog(
          context: ref.context,
          barrierColor: Colors.black87,
          builder: (_) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  InteractiveViewer(
                    minScale: 1,
                    maxScale: 5,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(responsive.radius),
                      child: Image.asset(asset),
                    ),
                  ),

                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(ref.context),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(responsive.radius),
            child: Image.asset(
              asset,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            right: 12,
            bottom: 12,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.zoom_in,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _conceptCard({
    required WidgetRef ref,
    required String title,
    required String description,
  }) {
    final responsive = ref.watch(responsiveProvider);

    return Padding(
      padding: EdgeInsets.only(bottom: responsive.gap),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(responsive.gap),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(8),
          borderRadius: BorderRadius.circular(responsive.radius),
          border: Border.all(color: Colors.white12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: responsive.h3,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: responsive.gap * .35),

            Text(
              description,
              style: TextStyle(
                color: Colors.white70,
                fontSize: responsive.body,
                height: 1.7,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _endlessTerrainFrameworkSection(WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/endless/ground.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Endless World Streaming",
          description:
              "A reusable infinite world framework that repositions a column or row of grid around the player, creating the illusion of an endless world while keeping memory usage constant.",
        ),

        _conceptCard(
          ref: ref,
          title: "Dynamic Tile Recycling",
          description:
              "Terrain tiles are recycled instead of instantiated or destroyed. Existing tiles are repositioned intelligently whenever the player crosses tile boundaries, eliminating unnecessary allocations.",
        ),

        _conceptCard(
          ref: ref,
          title: "Grid-Based World Management",
          description:
              "A dictionary-driven grid tracks all active terrain tiles and reorganizes them around the player's current position, providing efficient and scalable world streaming.",
        ),     

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/endless/car.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Modular Character Framework",
          description:
              "The gameplay architecture is independent of the controlled character. The player can be a human, animal, zombie, superhero, vehicle, boat, aircraft, or any custom actor by replacing the controller while reusing the same endless world, AI, camera, and gameplay systems.",
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/endless/ai.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Extensible AI Framework",
          description:
              "Enemy vehicles inherit from a shared AI controller, making it easy to build specialized behaviors for police, military units, zombies, bosses, or custom enemy types while reusing common movement logic.",
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/endless/so.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "ScriptableObject Event Architecture",
          description:
              "Gameplay communication is built on reusable ScriptableObject events instead of direct object references. UI, player controllers, AI, audio, cameras, and gameplay systems communicate by raising shared events, greatly reducing dependencies while making systems reusable across multiple projects.",
        ),

        _conceptCard(
          ref: ref,
          title: "Scriptable Runtime Variables",
          description:
              "Runtime values such as player upgrades, selected vehicles, game state, and shared gameplay variables are stored inside reusable ScriptableObjects. Multiple systems can read and modify the same data without requiring singleton managers or scene references.",
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/endless/db.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Scriptable Persistent Database",
          description:
              "Persistent variables extend the same ScriptableObject workflow by automatically synchronizing with PlayerPrefs. Designers work with Scriptable assets while save/load operations remain completely transparent, providing reusable persistent data without custom save logic in gameplay scripts.",
        ),

        _conceptCard(
          ref: ref,
          title: "Reusable Game Framework",
          description:
              "Designed as a reusable foundation rather than a single game. The framework can power endless driving, zombie survival, military combat, rescue missions, delivery games, and open-world exploration. By replacing terrain assets, the same architecture can also be adapted from 2D to 3D projects.",
        ),
      ],
    );
  }

}

//------------------ Paint Sort Art-----------
class PaintSortArtPage extends ConsumerWidget {
  const PaintSortArtPage({super.key});

  static const String githubUrl = "https://github.com/TaimoorGamez/Water-Sort.git";

  Future<void> _openGithub() async {
    final uri = Uri.parse(githubUrl);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch GitHub");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: responsive.contentWidth,
            ),
            child: Padding(
              padding: EdgeInsets.all(responsive.gap),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _projectHeader(context),

                    SizedBox(height: responsive.gap),

                    responsive.isDesktop
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        _thumbnail(),

                        SizedBox(width: responsive.gap * 1.5),

                        Expanded(
                            child: _projectInfo(),
                        ),
                        ],
                    )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        _thumbnail(),

                        SizedBox(height: responsive.gap),

                        _projectInfo(),
                        ],
                    ),

                  SizedBox(height: responsive.gap * 2.5),

                  _waterSortFrameworkSection(ref),
                  
                  // Other sections...
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _projectHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.home_rounded, size: 34),
        ),

        const SizedBox(width: 10),

        const Expanded(
          child: Text(
            "Paint Sort Art",
            textAlign: TextAlign.center,  
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              
            ),
          ),
        ),
      ],
    );
  }

  Widget _thumbnail() {
        return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
            width: 400,
            height: 225,
            child: Image.asset(
                "assets/thumbnails/paint.jpg",
                fit: BoxFit.cover,
            ),
            ),
        );
      }

  Widget _projectInfo() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          const Text(
            "A modular casual game framework developed in Unity featuring a data-driven water sort engine, texture-based coloring system, custom shaders, reusable UI architecture, Addressables-based content streaming, ScriptableObject runtime database, event-driven communication, and scalable gameplay systems including daily rewards, tasks, progression, and weighted reward mechanics. Designed for rapid reskinning and reuse across multiple puzzle and casual game projects.",
            style: TextStyle(
              fontSize: 16,
              height: 1.7,
            ),
          ),

          const SizedBox(height: 24),

          SizedBox(
          height: 48,
          child: ElevatedButton.icon(
              onPressed: _openGithub,
              icon: const Icon(Icons.code),
              label: const Text("View GitHub Repository"),
              style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff1e293b), // Dark slate
          foregroundColor: Colors.white,
          elevation: 0,
          side: BorderSide(
              color: const Color(0xff111827),
              width: 1.2,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 14,
          )))),
          ],
      );
      }

  Widget _zoomableImage({
    required WidgetRef ref,
    required String asset,
  }) {
    final responsive = ref.watch(responsiveProvider);

    return GestureDetector(
      onTap: () {
        showDialog(
          context: ref.context,
          barrierColor: Colors.black87,
          builder: (_) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  InteractiveViewer(
                    minScale: 1,
                    maxScale: 5,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(responsive.radius),
                      child: Image.asset(asset),
                    ),
                  ),

                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(ref.context),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(responsive.radius),
            child: Image.asset(
              asset,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            right: 12,
            bottom: 12,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.zoom_in,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _conceptCard({
    required WidgetRef ref,
    required String title,
    required String description,
  }) {
    final responsive = ref.watch(responsiveProvider);

    return Padding(
      padding: EdgeInsets.only(bottom: responsive.gap),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(responsive.gap),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(8),
          borderRadius: BorderRadius.circular(responsive.radius),
          border: Border.all(color: Colors.white12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: responsive.h3,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: responsive.gap * .35),

            Text(
              description,
              style: TextStyle(
                color: Colors.white70,
                fontSize: responsive.body,
                height: 1.7,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _waterSortFrameworkSection(WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/paint/sort.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Modular Water Sort Framework",
          description:
              "Designed a reusable puzzle framework where gameplay logic is separated from liquid rendering and animations. The architecture allows the core sorting mechanics to be reused with different visual themes and puzzle variations.",
        ),

        _conceptCard(
          ref: ref,
          title: "Gameplay & Visual Separation",
          description:
              "Liquid rendering, particle effects, shaders, animations, and gameplay logic are implemented as independent systems. Visuals can be replaced without modifying the underlying sorting mechanics.",
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/paint/undo.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Move History & Undo System",
          description:
              "Implemented a stack-based undo architecture that records gameplay actions and accurately restores previous puzzle states while maintaining animation consistency.",
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/paint/addressables_paint.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Addressables & Runtime Cosmetics",
          description:
              "Integrated Unity Addressables to load cap cosmetics at runtime, allowing cosmetic content to remain modular without hard scene dependencies.",
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/paint/shader_paint.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Custom Shader Framework",
          description:
              "Developed multiple Shader Graph shaders specifically for the framework, including animated liquid rendering, multi-color painting materials, interactive color bowls, particle shaders, and gameplay-driven visual effects. Shader properties are updated at runtime through MaterialPropertyBlocks for efficient per-instance rendering without duplicating materials.",
        ),
        
        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/paint/lvl_paint.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Puzzle-to-Coloring Gameplay Transition",
          description:
              "Designed a two-stage gameplay framework where completing the water sorting puzzle seamlessly transitions into an interactive coloring experience. The sorting mechanics and coloring system operate independently while sharing progression through reusable game events.",
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/paint/coloring_lvl_paint.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Modular Coloring Framework",
          description:
              "Built the coloring system as a standalone framework rather than a level-specific implementation. Coloring stages, artwork, brushes, reference images, and progression are completely data-driven, allowing new coloring content to be added without modifying gameplay code.",
        ),

        _conceptCard(
          ref: ref,
          title: "Runtime Brush & Asset Loading",
          description:
              "Brushes, reference images, and coloring artwork are loaded dynamically using Unity Addressables. This keeps the framework lightweight while allowing new assets and cosmetic variations to be added without rebuilding gameplay scenes.",
        ),

        _conceptCard(
          ref: ref,
          title: "Texture-Based Pixel Filling",
          description:
              "Implemented runtime texture painting by directly modifying Texture2D pixel data. Each artwork is divided into multiple paintable regions, enabling accurate color filling while preserving artwork transparency and visual quality.",
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/paint/ui_paint.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Reusable UI State Framework",
          description:
              "Created a modular UI architecture where every screen is loaded independently through Addressables. Screens transition with reusable animations while memory cleanup, asset release, and scene lifecycle are managed automatically.",
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/paint/gradient_paint.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Custom UI Gradient Framework",
          description:
              "Developed a reusable UI gradient component extending Unity's BaseMeshEffect to generate real-time gradients for any UI element. The system supports multiple gradient directions, blend modes, runtime editing, and designer-friendly workflows without requiring custom UI textures or shaders. It was used throughout the game's interface to create a consistent visual style while keeping UI assets lightweight.",
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/paint/task_paint.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Daily Tasks & Reward Framework",
          description:
              "Implemented a reusable daily task system supporting randomized objectives, persistent progress tracking, reward claiming, notification badges, and event-driven gameplay integration that can be reused across future projects.",
        ),      

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/paint/capture_paint.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Persistent Artwork Capture",
          description:
              "Captured completed paintings directly from a dedicated render camera, generated runtime thumbnails, displayed them on the completion screen, and automatically saved finished artwork into the device gallery for later viewing.",
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/paint/daily_paint.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Daily Reward Framework",
          description:
              "Implemented a configurable daily reward system supporting reward streaks, countdown timers, reward multipliers, special milestone rewards, persistent progression, and event-driven reward claiming. The framework can be reused in any mobile game with different reward types.",
        ),

        SizedBox(height: responsive.gap),

        _zoomableImage(
          ref: ref,
          asset: "assets/paint/spin_paint.jpg",
        ),

        SizedBox(height: responsive.gap * 1.5),

        _conceptCard(
          ref: ref,
          title: "Weighted Spin Wheel Framework",
          description:
              "Developed a configurable spin wheel framework that generates wheel segments from reward data, supports weighted reward probabilities, reusable reward types, animated spinning, and independent reward handling. The system can be reused for lucky wheels, prize wheels, or event rewards across different games.",
        ),

      ],
    );
  }

}

//------------------ Tattoo Shop -------------
class TattooShopPage extends ConsumerWidget {
  const TattooShopPage({super.key});

  static const String githubUrl = "https://play.google.com/store/apps/details?id=com.fc.hz.ink.art.tattoo.drawing.asmr&hl=en";

  Future<void> _openGithub() async {
    final uri = Uri.parse(githubUrl);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: responsive.contentWidth,
            ),
            child: Padding(
              padding: EdgeInsets.all(responsive.gap),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _projectHeader(context),

                    SizedBox(height: responsive.gap),

                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        _thumbnail(),

                        SizedBox(height: responsive.gap),

                        _projectInfo(),
                        ],
                    ),
                  
                  // Other sections...
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _projectHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.home_rounded, size: 34),
        ),

        const SizedBox(width: 10),

        const Expanded(
          child: Text(
            "Tattoo Shop",
            textAlign: TextAlign.center,  
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              
            ),
          ),
        ),
      ],
    );
  }

  Widget _thumbnail() {
        return GestureDetector(
          onTap: _openGithub,
          child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
              width: 400,
              height: 225,
              child: Image.asset(
                  "assets/thumbnails/tattoo.jpg",
                  fit: BoxFit.cover,
              ),
              ),
          ),
        ));
      }

  Widget _projectInfo() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          const Text(
          "A published tattoo simulation game where players create tattoos by selecting ink colors, switching tattoo machines, and progressively completing detailed artwork through texture-based painting. The project features reusable pixel-level coloring technology, multi-stage tattoo progression, ScriptableObject-based architecture, event-driven gameplay systems, persistent progression, economy, daily rewards, daily tasks, spin wheel, unlockable cosmetics, and production-ready UI designed for scalable mobile game development. The source code is not available because the project belongs to my previous employer, but the published Google Play version is available below.",
          style: TextStyle(
            fontSize: 16,
            height: 1.7,
          ),
        ),

          const SizedBox(height: 24),

          SizedBox(
          height: 48,
          child: ElevatedButton.icon(
              onPressed: _openGithub,
              icon: const Icon(Icons.code),
              label: const Text("View on Play Store"),
              style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff1e293b), // Dark slate
          foregroundColor: Colors.white,
          elevation: 0,
          side: BorderSide(
              color: const Color(0xff111827),
              width: 1.2,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 14,
          )))),
          ],
      );
    }

}

//------------------ Ship Jam ----------------
class ShipJamPage extends ConsumerWidget {
  const ShipJamPage({super.key});

  static const String githubUrl = "https://play.google.com/store/apps/details?id=com.ship.parking.jam.traffic.rush&hl=en";

  Future<void> _openGithub() async {
    final uri = Uri.parse(githubUrl);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: responsive.contentWidth,
            ),
            child: Padding(
              padding: EdgeInsets.all(responsive.gap),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _projectHeader(context),

                    SizedBox(height: responsive.gap),

                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        _thumbnail(),

                        SizedBox(height: responsive.gap),

                        _projectInfo(),
                        ],
                    ),
                  
                  // Other sections...
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _projectHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.home_rounded, size: 34),
        ),

        const SizedBox(width: 10),

        const Expanded(
          child: Text(
            "Ship Jam",
            textAlign: TextAlign.center,  
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              
            ),
          ),
        ),
      ],
    );
  }

  Widget _thumbnail() {
        return GestureDetector(
          onTap: _openGithub,
          child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
              width: 400,
              height: 225,
              child: Image.asset(
                  "assets/thumbnails/ship.jpg",
                  fit: BoxFit.cover,
              ),
              ),
          ),
        ));
      }

  Widget _projectInfo() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          const Text(
            "A published 3D traffic puzzle game where players guide colored passengers through a grid-based environment to board matching ships. The gameplay is built around a tile-based movement system with directional movement rules, occupancy validation, pathfinding, passenger queuing, and fail-state detection when waiting areas become blocked. Levels are created from reusable ScriptableObject data that defines passenger placement, ship configurations, and puzzle layouts, allowing large amounts of content to be produced without scene duplication. The project also includes power-ups such as Undo and direct passenger transport, progression systems, production-ready UI, optimized mobile gameplay, and a modular architecture designed for scalable level creation. The source code is not available because the project belongs to my previous employer, but the published Google Play version is available below.",
            style: TextStyle(
              fontSize: 16,
              height: 1.7,
            ),
          ),

          const SizedBox(height: 24),

          SizedBox(
          height: 48,
          child: ElevatedButton.icon(
              onPressed: _openGithub,
              icon: const Icon(Icons.code),
              label: const Text("View on Play Store"),
              style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff1e293b), // Dark slate
          foregroundColor: Colors.white,
          elevation: 0,
          side: BorderSide(
              color: const Color(0xff111827),
              width: 1.2,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 14,
          )))),
          ],
      );
    }

}

//------------------ Ludo ----------------
class LudoPage extends ConsumerWidget {
  const LudoPage({super.key});

  static const String githubUrl = "https://play.google.com/store/apps/details?id=com.ludo.world.fun.dice.game&hl=en";

  Future<void> _openGithub() async {
    final uri = Uri.parse(githubUrl);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch");
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: responsive.contentWidth,
            ),
            child: Padding(
              padding: EdgeInsets.all(responsive.gap),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _projectHeader(context),

                    SizedBox(height: responsive.gap),

                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        _thumbnail(),

                        SizedBox(height: responsive.gap),

                        _projectInfo(),
                        ],
                    ),
                  
                  // Other sections...
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _projectHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.home_rounded, size: 34),
        ),

        const SizedBox(width: 10),

        const Expanded(
          child: Text(
            "Ludo",
            textAlign: TextAlign.center,  
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              
            ),
          ),
        ),
      ],
    );
  }

  Widget _thumbnail() {
        return GestureDetector(
          onTap: _openGithub,
          child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
              width: 400,
              height: 225,
              child: Image.asset(
                  "assets/thumbnails/ludo.jpg",
                  fit: BoxFit.cover,
              ),
              ),
          ),
        ));
      }

  Widget _projectInfo() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          const Text(
            "A complete offline Ludo game featuring multiple gameplay modes, including Classic, Quick Match, and Killer Mode, each introducing unique rule variations while sharing a common gameplay framework. The game supports 2, 3, and 4 player matches against AI opponents or local multiplayer with friends on a single device, including team-based gameplay. A modular turn-based architecture manages token movement, dice logic, captures, safe zones, home progression, and victory conditions. AI opponents feature distinct personalities, ranging from aggressive strategies that prioritize eliminating opponents to defensive strategies focused on completing the race efficiently. The project also includes Google and Facebook authentication for player profiles, persistent progression, polished UI, animations, and optimized mobile performance. The source code is not available because the project belongs to my previous employer, but the published game is available below.",
            style: TextStyle(
              fontSize: 16,
              height: 1.7,
            ),
          ),

          const SizedBox(height: 24),

          SizedBox(
          height: 48,
          child: ElevatedButton.icon(
              onPressed: _openGithub,
              icon: const Icon(Icons.code),
              label: const Text("View on Play Store"),
              style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff1e293b), // Dark slate
          foregroundColor: Colors.white,
          elevation: 0,
          side: BorderSide(
              color: const Color(0xff111827),
              width: 1.2,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 14,
          )))),
          ],
      );
    }

}
