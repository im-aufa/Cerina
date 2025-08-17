enum OnboardingPageType { informational, finalPage }

class OnboardingData {
  final String title;
  final String description;
  final String image;
  final OnboardingPageType pageType;

  OnboardingData({
    required this.title,
    required this.description,
    this.image = '',
    this.pageType = OnboardingPageType.informational,
  });

  static List<OnboardingData> getPages() {
    return [
      OnboardingData(
        title: "Welcome",
        description: "This is page 1",
        pageType: OnboardingPageType.informational, 
      ),
      OnboardingData(
        title: "Explore",
        description: "This is page 2",
        pageType: OnboardingPageType.informational,
      ),
      OnboardingData(
        title: "Learn",
        description: "This is page 3",
        pageType: OnboardingPageType.informational,
      ),
      OnboardingData(
        title: "Get Started",
        description: "Selamat Datang di",
        image: "assets/logos/CerinaLogo-Landscape.png",
        pageType: OnboardingPageType.finalPage,
      ),
    ];
  }
}
