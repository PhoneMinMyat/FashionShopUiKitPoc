import 'package:dots_indicator/dots_indicator.dart';
import 'package:fashion_shop_ui_kit_poc/pages/details_page.dart';
import 'package:flutter/material.dart';

import 'package:fashion_shop_ui_kit_poc/resourses/dimens.dart';

const kDurationForAnimationForScreenFadeOut = Duration(milliseconds: 1000);
const kDurationForAnimation = Duration(milliseconds: 500);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDarkTheme = false;

  Color getTextColor() {
    return (isDarkTheme) ? Colors.white : Colors.black;
  }

  void changeTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: kDurationForAnimationForScreenFadeOut,
        width: double.infinity,
        height: double.infinity,
        color: (isDarkTheme) ? Colors.black : Colors.white,
        child: Stack(
          children: [
            Column(
              children: [
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: kDurationForAnimationForScreenFadeOut,
                  builder: (context, double tweenValue, child) => Opacity(
                    opacity: tweenValue,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: tweenValue * kMarginXXLarge,
                          left: kMarginMedium2x,
                          right: kMarginMedium2x),
                      child: child,
                    ),
                  ),
                  child: UserTopView(
                    textColor: getTextColor(),
                    onChangeTheme: () {
                      changeTheme();
                    },
                    isDarkTheme: isDarkTheme,
                  ),
                ),
                const SizedBox(
                  height: kMarginMedium2x,
                ),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: kDurationForAnimationForScreenFadeOut,
                  builder: (context, double tweenValue, child) => Opacity(
                    opacity: tweenValue,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: tweenValue * kMarginMedium2x,
                        right: kMarginMedium2x,
                      ),
                      child: child,
                    ),
                  ),
                  child: TrendingForYouSectionView(
                    textColor: getTextColor(),
                  ),
                ),
                const SizedBox(
                  height: kMarginMedium2x,
                ),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: kDurationForAnimationForScreenFadeOut,
                  builder: (context, double tweenValue, child) => Opacity(
                    opacity: tweenValue,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: kMarginMedium2x,
                          right: kMarginMedium2x,
                          top: (1 - tweenValue) * 100),
                      child: child,
                    ),
                  ),
                  child: RecomendedSectionView(
                    textColor: getTextColor(),
                  ),
                )
              ],
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: kDurationForAnimationForScreenFadeOut,
              builder: (context, double tweenValue, child) => Opacity(
                opacity: tweenValue,
                child: Padding(
                  padding: EdgeInsets.only(bottom: tweenValue * kMarginXXLarge),
                  child: child,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomBottomNavigationBar(isDarkTheme: isDarkTheme),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RecomendedSectionView extends StatelessWidget {
  final Color textColor;
  const RecomendedSectionView({
    Key? key,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndDotsIndicatiorSectionView(
            textColor: textColor, title: 'Recomended'),
        const SizedBox(
          height: kMarginMedium2x,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: kRecomendedBoxWidth,
              height: kRecomendedBoxHeight,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(kMarginXLarge),
              ),
              child: ImageAndTextView(
                imageAssetAdreess: 'assets/images/shoe.png',
                text: 'Shoe',
                textColor: textColor,
              ),
            ),
            Container(
              width: kRecomendedBoxWidth,
              height: kRecomendedBoxHeight,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(kMarginXLarge),
              ),
              child: ImageAndTextView(
                imageAssetAdreess: 'assets/images/cactus.png',
                text: 'Cactus',
                textColor: textColor,
              ),
            )
          ],
        )
      ],
    );
  }
}

class ImageAndTextView extends StatelessWidget {
  final String imageAssetAdreess;
  final String text;
  final Color textColor;
  const ImageAndTextView({
    Key? key,
    required this.imageAssetAdreess,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
          child: Image.asset(
            imageAssetAdreess,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          height: kMarginSmall,
        ),
        Text(
          text,
          style: TextStyle(color: textColor, fontSize: kTextRegular2x),
        )
      ],
    );
  }
}

class TrendingForYouSectionView extends StatelessWidget {
  final Color textColor;
  const TrendingForYouSectionView({
    Key? key,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndDotsIndicatiorSectionView(
            title: 'Trending for you', textColor: textColor),
        const SizedBox(
          height: kMarginMedium2x,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const DetailsPage()));
          },
          child: SizedBox(
            width: double.infinity,
            height: kHomePageImageHeight,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(kMarginXLarge),
                child: Image.asset(
                  'assets/images/main_image.jpg',
                  fit: BoxFit.cover,
                )),
          ),
        )
      ],
    );
  }
}

class TitleAndDotsIndicatiorSectionView extends StatelessWidget {
  const TitleAndDotsIndicatiorSectionView({
    Key? key,
    required this.textColor,
    required this.title,
  }) : super(key: key);

  final Color textColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        DotsIndicator(
          dotsCount: 2,
          decorator: const DotsDecorator(activeColor: Colors.deepPurple),
        )
      ],
    );
  }
}

class UserTopView extends StatelessWidget {
  final Color textColor;
  final Function onChangeTheme;
  final bool isDarkTheme;
  const UserTopView({
    Key? key,
    required this.onChangeTheme,
    required this.textColor,
    required this.isDarkTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.deepPurple,
          child: Icon(
            Icons.person,
            size: kMarginXLarge,
          ),
        ),
        const SizedBox(
          width: kMarginMedium,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Howdy,',
              style: TextStyle(color: textColor),
            ),
            Text(
              'Cristina Yota',
              style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            onChangeTheme();
          },
          icon: Icon(
            Icons.notifications,
            size: kBottomIconSize,
            color: (isDarkTheme) ? Colors.deepPurple : Colors.grey,
          ),
        )
      ],
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.isDarkTheme,
  }) : super(key: key);

  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomBarHeight,
      margin: const EdgeInsets.symmetric(horizontal: kMarginMedium2x),
      decoration: BoxDecoration(
          color: (isDarkTheme) ? Colors.white : Colors.grey[100],
          borderRadius: BorderRadius.circular(kMarginXLarge)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(
            Icons.home_filled,
            color: Colors.deepPurple,
            size: kBottomIconSize,
          ),
          Icon(
            Icons.search_outlined,
            color: Colors.grey,
            size: kBottomIconSize,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.grey,
            size: kBottomIconSize,
          ),
          Icon(
            Icons.bookmark_outline,
            color: Colors.grey,
            size: kBottomIconSize,
          ),
          Icon(
            Icons.person,
            color: Colors.grey,
            size: kBottomIconSize,
          ),
        ],
      ),
    );
  }
}
