import 'package:flutter/material.dart';
import '../models/model.dart';
import '../utlis/utlis.dart';
import '../ui/details.dart';
GestureDetector buildContainer(AsyncSnapshot<HelperModel> snapshot, int index,context) {
  return GestureDetector(
    onTap: (){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DetailScreen(index)));
    },
    child: Container(
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: hotpink),
      constraints: BoxConstraints(maxHeight: 300),
      child: Stack(
        children: [
          Image.network(
            snapshot.data!.articles![index].urlToImage
                .toString(),
            fit: BoxFit.cover,
            height: 180,
            width: 400,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                snapshot.data!.articles![index].title
                    .toString(),
                style: ktextstyle.copyWith(   fontWeight: FontWeight.w900,
                  fontSize: 20,),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                snapshot.data!.articles![index].description
                    .toString(),
                style: ktextstyle.copyWith( fontWeight: FontWeight.w700,
                  fontSize: 16,),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          )
        ],
      ),
    ),
  );
}