late double screenWidth;
late double screenHeight;

// *Function to divide screen height base on params input on percentage
// * ex:
double scalableHeight(double height) {
  return screenHeight * (height / 100);
}

double scalableWidth(double width) {
  return screenHeight * (width / 100);
}
