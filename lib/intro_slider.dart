import 'package:flutter/material.dart';
import 'package:flutter_intro_slider/home.dart';

import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroSliderPage extends StatefulWidget {
  const IntroSliderPage({super.key});

  @override
  _IntroSliderPageState createState() => _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage> {
  List<Slide> slides = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides.add(
      Slide(
        title: "Hello Food!",
        description:
            "The easiest way to order food from your favorite restaurant!",
        pathImage: "assets/images/hamburger.png",
      ),
    );
    slides.add(
      Slide(
        title: "Movie Tickets",
        description: "Book movie tickets for your family and friends!",
        pathImage: "assets/images/movie.png",
      ),
    );
    slides.add(
      Slide(
        title: "Great Discounts",
        description: "Best discounts on every single service we offer!",
        pathImage: "assets/images/discount.png",
      ),
    );
    slides.add(
      Slide(
        title: "World Travel",
        description: "Book tickets of any transportation and travel the world!",
        pathImage: "assets/images/travel.png",
      ),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(bottom: 160, top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    "${currentSlide.pathImage}",
                    matchTextDirection: true,
                    height: 60,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    "${currentSlide.title}",
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  margin: const EdgeInsets.only(
                    top: 15,
                    left: 20,
                    right: 20,
                  ),
                  child: Text(
                    "${currentSlide.description}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.5,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      backgroundColorAllSlides: Colors.green[700],
      renderSkipBtn: const Text("Skip"),
      renderNextBtn: Text(
        "Next",
        style: TextStyle(color: Colors.green[700]),
      ),
      renderDoneBtn: Text(
        "Done",
        style: TextStyle(color: Colors.green[700]),
      ),
      colorDoneBtn: Colors.white,
      colorActiveDot: Colors.white,
      sizeDot: 8.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
      listCustomTabs: renderListCustomTabs(),
      scrollPhysics: const BouncingScrollPhysics(),
      onDonePress: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomePage(),
        ),
      ),
    );
  }
}
