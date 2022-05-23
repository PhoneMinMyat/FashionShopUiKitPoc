import 'package:dots_indicator/dots_indicator.dart';
import 'package:fashion_shop_ui_kit_poc/animation/explicit_animation_expanded_icon.dart';
import 'package:fashion_shop_ui_kit_poc/animation/explicit_animation_heart_icon.dart';
import 'package:fashion_shop_ui_kit_poc/resourses/dimens.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

const kDurationForAnimation = Duration(milliseconds: 500);
const List<String> sizeList = ['S', 'M', 'L', 'XL', 'XXL'];

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isDescriptionShow = true;

  void changeDescription() {
    setState(() {
      isDescriptionShow = !isDescriptionShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopImageSectionView(),
          const TitleSectionView(),
          const SizedBox(
            height: kMarginMedium2x,
          ),
          DescriptionSectionView(
            isDescriptionShow: isDescriptionShow,
            changeDescription: () {
              changeDescription();
            },
          ),
          const SizedBox(
            height: kMarginMedium2x,
          ),
          const SizeYourSizeSectionView(),
        ],
      ),
    );
  }
}

class SizeYourSizeSectionView extends StatelessWidget {
  const SizeYourSizeSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMarginMedium2x),
          child: Row(
            children: const [
              Text(
                'Size your size',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: kTextRegular2x),
              ),
              Spacer(),
              Text(
                'Size Guide',
                style: TextStyle(color: Colors.deepPurple),
              )
            ],
          ),
        ),
        const SizedBox(
          height: kMarginMedium2x,
        ),
        SizedBox(
          height: kSizeButtonWidth,
          width: double.infinity,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: kMarginMedium2x),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: sizeList.length,
            itemBuilder: (context, index) =>
                ChooseSizedButton(text: sizeList[index]),
            separatorBuilder: (context, index) => const SizedBox(
              width: kMarginMedium2x,
            ),
          ),
        )
      ],
    );
  }
}

class ChooseSizedButton extends StatefulWidget {
  final String text;
  const ChooseSizedButton({Key? key, required this.text}) : super(key: key);

  @override
  State<ChooseSizedButton> createState() => _ChooseSizedButtonState();
}

class _ChooseSizedButtonState extends State<ChooseSizedButton> {
  bool isChoose = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        setState(() {
          isChoose = !isChoose;
        });
      }),
      child: AnimatedContainer(
        duration: kDurationForAnimation,
        width: kSizeButtonWidth,
        height: kSizeButtonWidth,

        curve: Curves.easeInCirc,
        decoration: BoxDecoration(
            color: (isChoose) ? Colors.deepPurple : Colors.grey[300],
            borderRadius: BorderRadius.circular(kMarginMedium2x)),
        child: Center(
            child: Text(
          widget.text,
          style: TextStyle(
              color: isChoose ? Colors.white : Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: kTextRegular2x),
        )),
      ),
    );
  }
}

class DescriptionSectionView extends StatelessWidget {
  const DescriptionSectionView({
    Key? key,
    required this.isDescriptionShow,
    required this.changeDescription,
  }) : super(key: key);

  final bool isDescriptionShow;
  final Function changeDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMarginMedium2x),
          child: Row(
            children: [
              const Text(
                'Description',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: kTextRegular2x),
              ),
              const Spacer(),
              ExplicitAnimationExpandedIcon(
                onTap: () {
                  changeDescription();
                },
              ),
            ],
          ),
        ),
        AnimatedSize(
          duration: kDurationForAnimation,
          child: SizedBox(
            height: isDescriptionShow ? null : 0,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: kMarginMedium2x),
              child: Text(
                'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The paint of using Lorem Ipsum is that it has a more-or-less normal',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TitleSectionView extends StatelessWidget {
  const TitleSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'OUTFIT IDEAS',
          style: TextStyle(color: Colors.black54),
        ),
        SizedBox(
          height: kMarginMedium,
        ),
        Text(
          'Modern Blue Jacket',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: kTextHeading),
        ),
        SizedBox(
          height: kMarginMedium,
        ),
        Text(
          '\$ 19,39',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: kTextRegular3x),
        ),
      ],
    );
  }
}

class TopImageSectionView extends StatelessWidget {
  const TopImageSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kDetailPageImageHeight,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/main_image.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kMarginMedium2x),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    const ExplicitAnimationHeartIcon(),
                    const Icon(
                      Icons.share,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DotsIndicator(
                  dotsCount: 3,
                  decorator: DotsDecorator(
                      activeColor: Colors.white,
                      activeSize: const Size(kMarginMedium2x, kMarginMedium),
                      activeShape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(kMarginMedium2x))),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(kMarginLarge),
                          topRight: Radius.circular(kMarginLarge))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
