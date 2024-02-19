import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_ease/common/loader.dart';

/// Relies on the circular_network_image package
/// The loader is a spin-off of the SpinKit package
/// Either Placeholder or ProgressIndicator is allowed but not both
//TODO: Refactor this code with what's on the helper project
class CacheNetwork {
  static Widget image(String imageUrl, {double? width, double? height}) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width ?? double.infinity,
      height: height ?? 160,
      // progressIndicatorBuilder: (context, url, downloadProgress) =>
      // LinearProgressIndicator(value: downloadProgress.progress),
      placeholder: (context, url) => const Loader(),
      errorWidget: (context, url, error) => const Icon(Icons.warning_amber),
    );
  }

  static Widget imageDeco(
      {required String imageUrl, double? height, double? width}) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: width ?? double.infinity,
        height: height ?? 160,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const Loader(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
