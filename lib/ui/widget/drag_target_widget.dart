import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dragndrop_demo/core/model/card_item.dart';
import 'package:flutter_dragndrop_demo/core/viewmodel/data.dart';
import 'package:flutter_dragndrop_demo/ui/resources/colors.dart';
import 'package:flutter_dragndrop_demo/ui/resources/strings.dart';
import 'package:provider/provider.dart';

class DragTargetWidget extends StatelessWidget {
  const DragTargetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget(onWillAccept: (data) {
      return true;
    }, onAccept: (CardItem data) {
      if (Provider.of<Data>(context).itemsList!.isNotEmpty) {
        Provider.of<Data>(context).removeLastItem();
        Provider.of<Data>(context).changeSuccessDrop(true);
        Provider.of<Data>(context).changeAcceptedData(data);
      }
    }, builder: (context, List<CardItem?> cd, rd) {
      if (Provider.of<Data>(context).isSuccessDrop!) {
        return Padding(
          padding: const EdgeInsets.all(25.0),
          child: Stack(
            children:
                buildTargetList(Provider.of<Data>(context).getAcceptedData!),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(25.0),
          child: DottedBorder(
            color: Colors.black,
            padding: const EdgeInsets.all(3),
            strokeWidth: 1,
            child: Container(
                height: 200.0,
                width: 200.0,
                color: Colors.grey[400],
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Colors.grey[400],
                  child: const Center(
                    child: Text(
                      dropItemHere,
                      style: TextStyle(color: Colors.black, fontSize: 22.0),
                    ),
                  ),
                )),
          ),
        );
      }
    });
  }

  List<Widget> buildTargetList(CardItem cardItem) {
    List<Widget> targetList = [];
    targetList.add(
      DottedBorder(
        padding: const EdgeInsets.all(3),
        strokeWidth: 1,
        color: Colors.black,
        child: SizedBox(
          height: 200.0,
          width: 200.0,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: cardItem.cardColor,
            child: Center(
                child: Text(
              '${cardItem.content}',
              style: const TextStyle(fontSize: 25.0, color: whiteColor),
            )),
          ),
        ),
      ),
    );
    return targetList;
  }
}
