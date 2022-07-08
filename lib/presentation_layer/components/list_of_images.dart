import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:technicaltask/model_layer/model.dart';
import 'package:technicaltask/shared/style/style.dart';

class ListOfImages extends StatelessWidget {
  final Exhibit exhibit;

  const ListOfImages({required this.exhibit, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: appPadding,
        right: appPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            exhibit.title!,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: size.height * 0.2,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: exhibit.images!.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 100.0,
                  //height: 200.0,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                  child: CachedNetworkImage(
                    imageUrl: exhibit.images![index],
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => const SizedBox(
                      width: 10.0,
                      height: 15,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    // errorWidget: (context, url, error) =>
                    // Icon(Icons.error),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 10.0),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
