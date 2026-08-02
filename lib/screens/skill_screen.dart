import '../models.dart';
import 'package:flutter/material.dart';
import '../services/responsive_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SkillScreen extends ConsumerWidget {
  final Skill skill;

  const SkillScreen({
    super.key,
    required this.skill,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = ref.watch(responsiveProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(responsive.gap),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Row(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(10),
                      borderRadius:
                          BorderRadius.circular(responsive.radius),
                    ),
                    child: SvgPicture.asset(
                      skill.logo,
                      fit: BoxFit.contain,
                    ),
                  ),

                  SizedBox(width: responsive.gap),

                  Expanded(
                    child: Text(
                      skill.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: responsive.h1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: responsive.gap * 1.5),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: skill.description.map((point) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.greenAccent,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            point,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: responsive.body,
                              height: 1.8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
