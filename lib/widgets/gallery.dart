import 'package:flutter/material.dart';

class HorizontalImageList extends StatefulWidget {
  final List<String> imageUrls;

  const HorizontalImageList({Key? key, required this.imageUrls})
      : super(key: key);

  @override
  _HorizontalImageListState createState() => _HorizontalImageListState();
}

class _HorizontalImageListState extends State<HorizontalImageList> {
  final Map<int, BoxFit> _fitMap = {};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.imageUrls.length,
        itemBuilder: (context, index) {
          var imageUrl = widget.imageUrls[index];

          // If the fit for this image hasn't been determined yet,
          // default to BoxFit.contain while we check the image resolution.
          var boxFit = _fitMap[index] ?? BoxFit.contain;

          return Container(
            width: 150,
            height: 150,
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                fit: boxFit,
                frameBuilder: (BuildContext context, Widget child, int? frame,
                    bool wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) return child;
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: frame != null
                        ? child
                        : Container(
                            color: Colors.grey,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                  );
                },
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Center(
                    child: Icon(Icons.error),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.imageUrls.asMap().forEach((index, imageUrl) {
      var image = NetworkImage(imageUrl);
      image.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener((ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());

          BoxFit fit;
          if (size.width > size.height) {
            fit = BoxFit.fitHeight;
          } else {
            fit = BoxFit.fitWidth;
          }

          setState(() {
            _fitMap[index] = fit;
          });
        }),
      );
    });
  }
}
