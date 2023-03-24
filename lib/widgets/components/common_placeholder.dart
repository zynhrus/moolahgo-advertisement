import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxShape shape;
  final BorderRadiusGeometry borderRadius;
  final BoxFit imageFit;
  final ImageProvider<Object> assetsPlaceholder;
  final bool noPlaceholder;
  final BoxConstraints constraints;

  const ImagePlaceholder({
    Key key,
    this.height,
    this.width,
    this.imageUrl,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.imageFit = BoxFit.cover,
    this.assetsPlaceholder,
    this.noPlaceholder = false,
    this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        useOldImageOnUrlChange: true,
        placeholder: (context, url) => _buildPlaceholder(context),
        imageBuilder: (context, imageProvider) => Container(
            constraints: constraints,
            height: height,
            width: width,
            decoration: BoxDecoration(
                shape: shape,
                borderRadius: borderRadius,
                image: DecorationImage(
                  fit: imageFit,
                  image: imageProvider,
                ))),
        errorWidget: (context, url, error) => _buildPlaceholder(context),
      );
    } else {
      return _buildPlaceholder(context);
    }
  }

  BorderRadiusGeometry placeHolderBorderRadius() {
    if (shape == BoxShape.circle || borderRadius != null) {
      return borderRadius;
    } else {
      return BorderRadius.circular(8);
    }
  }

  Widget _buildPlaceholder(BuildContext context) {
    if (noPlaceholder) {
      return SizedBox(
        height: height,
        width: width,
      );
    }
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: shape,
        borderRadius: placeHolderBorderRadius(),
        image: DecorationImage(
          fit: imageFit,
          image: assetsPlaceholder ??
              const AssetImage("assets/images/place_holder.png"),
        ),
      ),
    );
  }
}
