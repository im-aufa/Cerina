class OnboardingData {
  final String title;
  final String description;
  final String image;

  OnboardingData({
    required this.title,
    required this.description,
    this.image = '',
  });

  static List<OnboardingData> getPages() {
    return [
      OnboardingData(title: "Welcome", description: "This is page 1"),
      OnboardingData(title: "Explore", description: "This is page 2"),
      OnboardingData(title: "Learn", description: "This is page 3"),
      OnboardingData(
        title: "Get Started",
        description: "Selamat Datang di",
        image: "assets/logos/CerinaLogo-Landscape.png",
      ),
    ];
  }
}
