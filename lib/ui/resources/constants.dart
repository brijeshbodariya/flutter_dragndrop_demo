import 'package:flutter_dragndrop_demo/core/model/card_item.dart';
import 'package:flutter_dragndrop_demo/ui/resources/colors.dart';
import 'package:flutter_dragndrop_demo/ui/resources/strings.dart';

class Constants {
  static String splashScreen = 'SPLASH_SCREEN';
  static String homeScreen = 'HOME_SCREEN';

  static List<CardItem> initializeList(List<CardItem> itemList) {
    itemList = [
      CardItem(content: java, cardColor: brownColor),
      CardItem(content: php, cardColor: redColor),
      CardItem(content: kotlin, cardColor: orangeColor),
      CardItem(content: flutter, cardColor: blueColor),
      CardItem(content: nodeJS, cardColor: greenColor),
    ];

    return itemList;
  }
}
