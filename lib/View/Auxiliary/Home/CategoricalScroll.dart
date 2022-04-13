import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zoofari/View/Auxiliary/Home/CategoricalScrollItem.dart';

final List<Map<String, String>> imgList = [
  {
    'imageURL':
        'https://a-z-animals.com/media/2022/03/red-eyed-tree-frog-2-768x461.jpg',
    'title': 'Amphibian'
  },
  {
    'imageURL':
        'https://a-z-animals.com/media/2021/04/Scarlet-Macaw-on-branch-768x401.jpg',
    'title': 'Bird'
  },
  {
    'imageURL':
        'https://a-z-animals.com/media/2022/01/Goldfish-header-768x401.jpg',
    'title': 'Fish'
  },
  {
    'imageURL':
        'https://a-z-animals.com/media/animals/images/original/jaguar6.jpg',
    'title': 'Mammal'
  },
  {
    'imageURL':
        'https://a-z-animals.com/media/2022/01/Green-Tree-Python-header-768x401.jpg',
    'title': 'Reptile'
  }
];

final List<Widget> imageSliders = imgList
    .map((item) => CategoricalScrollItem(
        imageURL: item['imageURL'] as String, title: item['title'] as String))
    .toList();

class CategoricalScroll extends StatelessWidget {
  const CategoricalScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40, bottom: 35, left: 18),
          child: Row(
            children: [
              Icon(
                Icons.category_outlined,
                color: Color(0xffd4af37),
                size: 18,
              ),
              Container(width: 10),
              Expanded(
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Quicksand-SemiBold',
                  ),
                ),
              ),
            ],
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              viewportFraction: (392.73/ MediaQuery.of(context).size.width) * 0.48,
              height: 185,
              initialPage: 5),
          items: imageSliders,
        ),
      ],
    );
  }
}
