import 'package:flutter/cupertino.dart';

class Category {
  Category({required this.id, required this.title, this.imageUrl, required this.onTapNavigation, this.subCategories, this.bubbleImageUrl, this.color, this.subtext});
  final String id;
  final String title;
  final String? imageUrl;
  final String? bubbleImageUrl;
  final VoidCallback onTapNavigation;
  final List<Category>? subCategories;
  final Color? color;
  final String? subtext;
}

get id {
  id;
}

get title {
  title;
}

get imageUrl {
  if(imageUrl != null) {
    imageUrl;
  } else {
    return null;
  }
}

get bubbleImageUrl {
  if(bubbleImageUrl != null) {
    bubbleImageUrl;
  } else {
    return null;
  }
}

get subCategories {
  if(subCategories != null) {
    subCategories;
  } else {
    return null;
  }
}

get color {
  if(color != null) {
    color;
  } else {
    return const Color(0xFFFFFFFF);
  }
}

get subtext {
  if(subtext != null) {
    subtext;
  } else {
    return '';
  }
}