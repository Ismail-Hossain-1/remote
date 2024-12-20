class UnbordingContent {
  String image;
  String title;
  String description;

  UnbordingContent({ required this.image,required this.title,required this.description});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'View Product In 360',
      image: 'assets/images/store1.svg',
      description: "You can see the product with all angles, true and convenient"
  ),
  UnbordingContent(
      title: 'Find products easily',
      image: 'assets/images/store2.svg',
      description: "You just need to take a photo or upload and we will find similar products for you "
  ),
  UnbordingContent(
      title: 'Payment is easy',
      image: 'assets/images/store.svg',
      description: "You just need to take a photo or upload and we will find similar products for you."
  ),
];
