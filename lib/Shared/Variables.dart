class CustomClass {
  late String title;
  late String imageUrl;

  CustomClass(
    this.title,
    this.imageUrl,
  );
}

class DietPlanSub {
  String title;
  String subtitle;
  String imageUrl;
  List<Dietimages> planDetail;
  DietPlanSub({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.planDetail,
  });
}

List<DietPlanSub> planScreen = [
  DietPlanSub(
      title: "Diet Plan for “Lean Body”",
      subtitle: "Recommended to adopt as daily routine",
      imageUrl: "assets/images/diet_1.jpg",
      planDetail: leanBody),
  DietPlanSub(
      title: "Diet Plan for “Bulky Body”",
      subtitle: "Recommended to adopt as daily routine",
      imageUrl: "assets/images/diet_2.jpg",
      planDetail: bulkyBody),
  DietPlanSub(
      title: "Diet Plan for “Shredded Body”",
      subtitle: "Diet plan for those who don’t want any fats",
      imageUrl: "assets/images/diet_3.jpg",
      planDetail: shreddedBody),
];
List<Dietimages> leanBody = [
  Dietimages("assets/images/Day1LB.png", "assets/images/Day1LBM.png"),
  Dietimages("assets/images/Day2LB.png", "assets/images/Day2LBM.png"),
  Dietimages("assets/images/Day3LB.png", "assets/images/Day3LBM.png"),
  Dietimages("assets/images/Day4LB.png", "assets/images/Day4LBM.png"),
  Dietimages("assets/images/Day5LB.png", "assets/images/Day5LBM.png"),
];

List<Dietimages> bulkyBody = [
  Dietimages("assets/images/Day1BDs.png", "assets/images/Day1BD.png"),
  Dietimages("assets/images/Day2BDs.png", "assets/images/Day2BD.png"),
  Dietimages("assets/images/Day3BDs.png", "assets/images/Day3BD.png"),
  Dietimages("assets/images/Day4BDs.png", "assets/images/Day4BD.png"),
  Dietimages("assets/images/Day5BDs.png", "assets/images/Day5BD.png"),
  Dietimages("assets/images/Day6BDs.png", "assets/images/Day6BD.png"),
  Dietimages("assets/images/Day7BDs.png", "assets/images/Day7BD.png"),
];

List<Dietimages> shreddedBody = [
  Dietimages("Ripped Meal", "assets/images/RippedMealPlan.png"),
  Dietimages("Muscle Meal", "assets/images/MuscleMealPlan.png"),
  Dietimages("10-Week Strategy", "assets/images/10WeekPlan.png"),
];

class Dietimages {
  final String mainImage;
  final String childImage;

  Dietimages(this.mainImage, this.childImage);
}
