class OnboardingContent {
  String image;
  String description;

  OnboardingContent({required this.image, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
    image: 'assets/images/stock_img1.png',
    description:
        'Empowering Farmers with advanced\nanalytics solutions that provide\nvaluable insights into their farming\noperations',
  ),
  OnboardingContent(
    image: 'assets/images/stock_img2.png',
    description:
        'Comprehensive platform offering real-\ntime monitoring, predictive analytics\nenabling farmers to enhance\nproductivity, reduce risks, and drive\noverall farm efficiency',
  ),
];
