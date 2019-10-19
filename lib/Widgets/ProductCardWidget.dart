import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:hotel_booking_app/hotelBooking/hotelAppTheme.dart';

class ProductCardWidget extends StatelessWidget {
  final itemData;
  const ProductCardWidget({Key key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child:
          Stack(children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset(
                  itemData.imagePath,
                  fit: BoxFit.cover,
                ),
                Container(margin: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      showTitle(),
                      showSubTitle(),
                      showRating(),
                    ],
                  ),
                )
              ],
            ),
          showFavoriteIcon()
        ],),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
    );
  }

  Widget showTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: Row(
        children: <Widget>[
          Expanded(child: 
            Text(
              itemData.titleTxt,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
          ),
          Text(
            "\$${itemData.perNight}",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          )
        ],
      ),
    );
  }

  Widget showSubTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: Row(
        children: <Widget>[
          Text(
            itemData.subTxt,
            style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
          ),
          SizedBox(
            width: 4,
          ),
          Icon(
            FontAwesomeIcons.mapMarkerAlt,
            size: 12,
            color: HotelAppTheme.buildLightTheme().primaryColor,
          ),
          Expanded(
            child: Text(
              "${itemData.dist.toStringAsFixed(1)} km to city",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
            ),
          ),
          Text(
            "/per night",
            style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }

  Widget showRating() {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: Row(
        children: <Widget>[
          SmoothStarRating(
            allowHalfRating: true,
            starCount: 5,
            rating: itemData.rating,
            size: 20,
            color: HotelAppTheme.buildLightTheme().primaryColor,
            borderColor: HotelAppTheme.buildLightTheme().primaryColor,
          ),
          Text(
            " ${itemData.reviews} Reviews",
            style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }

  Widget showFavoriteIcon() {
    return Positioned(
      top: 8,
      right: 8,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite_border,
              color: HotelAppTheme.buildLightTheme().primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}