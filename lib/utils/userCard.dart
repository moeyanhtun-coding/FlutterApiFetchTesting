import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_fetch/model/userModel.dart';

class Usercard extends StatelessWidget {
  late User user;

  Usercard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40, // Adjust the radius as needed
              backgroundImage: NetworkImage(
                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${user.userName}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  user.userEmail,
                ),
                Text(
                  user.userAge.toString(),
                  style: TextStyle(),
                ),
              ],
            )
          ],
        ),
      ),
      // child: Padding(
      //   padding: EdgeInsets.all(8.0),
      //   child: GestureDetector(
      //     onTap: () {},
      //     child: Column(
      //       // this is the coloumn
      //       children: [
      //         AspectRatio(
      //           aspectRatio: 1, // this is the ratio
      //           child: CachedNetworkImage(
      //             // this is to fetch the image
      //             imageUrl:
      //                 "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //         ListTile(
      //           title: Text(user.userName),
      //           subtitle: Text(
      //               user.userEmail), // this is fetch the price from the api
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
