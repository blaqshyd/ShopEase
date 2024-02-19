import 'package:flutter/material.dart';

extension LoadingWidget on Widget {
  Widget loader(bool isLoading) {
    return isLoading
        ? const SizedBox.square(
            dimension: 24,
            child: CircularProgressIndicator.adaptive(),
          )
        : this;
  }
}

extension LoadingButton on ElevatedButton {
  Widget loader(bool isLoading) {
    return isLoading
        ? const ElevatedButton(
            onPressed: null,
            child: SizedBox.square(
              dimension: 24,
              child: CircularProgressIndicator.adaptive(),
            ),
          )
        : this;
  }
}
