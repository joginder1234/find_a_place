import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImagePreviewScreen extends StatefulWidget {
  List<String> allImages;
  ImagePreviewScreen({Key? key, required this.allImages}) : super(key: key);

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: CarouselSlider(
            items: widget.allImages.map((e) => Image.network(e)).toList(),
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 1,
              aspectRatio: 1.9,
              initialPage: 1,
            ),
          ),
        ),
      ]),
    );
  }
}
