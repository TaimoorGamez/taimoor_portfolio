import 'dart:ui';

//--------------Projects ---------------
class Project {
  final String name;
  final String image;
  final VoidCallback? onTap;

  const Project({
    required this.name,
    required this.image,
    required this.onTap,
  });
}

//--------------Skills ----------------
class Skill {
  final String logo;
  final String title;
  final List<String> description;

  const Skill({
    required this.logo,
    required this.title,
    required this.description,
  });
}
