import 'package:booking_app/src/app/core/components/buttons/main_button.dart';
import 'package:booking_app/src/app/core/utils/mediaquery_managment.dart';
import 'package:booking_app/src/app/core/utils/text_styles_manager.dart';
import 'package:booking_app/src/features/explore_hotels/data/models/hotel_data.dart';
import 'package:flutter/material.dart';

class HotelBoxDetails extends StatelessWidget {
  final HotelData hotelData;
  const HotelBoxDetails({Key? key, required this.hotelData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        padding: EdgeInsets.all(10),
        width: MediaQueryManager.screenWidth,
        margin: EdgeInsets.fromLTRB(50,50,50,10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black26,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      hotelData.name!,
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    Container(
                      height: 20,
                      child: Row(
                        children: [
                          Text(
                            hotelData.address!.split(",")[1],
                            style: TextStyle(fontSize: 10),
                          ),
                          Icon(
                            Icons.location_on,
                            color: Colors.blue,
                            size: 20,
                          ),
                          Text(
                            "5.0km to city",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    Row(children: [
                      ...List.generate(
                          5,
                          (index) => Icon(
                                Icons.star,
                                color: index != 4 ? Colors.blue : Colors.grey,
                                size: 15,
                              )),
                      Text(
                        "${double.parse(hotelData.rate!) * 10} Reviews",
                        style: TextStyle(fontSize: 12),
                      ),
                    ])
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "\$" + hotelData.price!,
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      "/per night",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )
              ],
            ),
            Spacer(),
            MainButton(
              txt: "Book now",
              isExpanded: true,
              onPressed: () {},
              color: Colors.blue,
            ),

          ],
        ));
  }
}
