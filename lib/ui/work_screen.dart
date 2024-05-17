// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

double defaultRadius = 8.0;
const double _cardWidth = 115;

class CardBasicRoute extends StatefulWidget {
  const CardBasicRoute({Key? key}) : super(key: key);

  @override
  CardBasicRouteState createState() => CardBasicRouteState();
}

class CardBasicRouteState extends State<CardBasicRoute> {
  @override
  Widget build(BuildContext context) {
    return gradientCardSample();
  }

  Widget gradientCardSample() {
  return Container(
    height: 100, // Reduced height of the card container
    width: 100, // Reduced width of the card container
    padding: const EdgeInsets.all(32),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF846AFF),
          Color(0xFF755EE8),
          Colors.purpleAccent,
          Colors.amber,
        ],
      ),
      borderRadius: BorderRadius.circular(16), // Modified radius here
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'ID CARD DIGITAL',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: Colors.white,
              fontFamily: "monospace",
              fontSize: 40, // Adjusted font size
            ),
          ),
          SizedBox(height: 20), // Adjust the spacing between text and photo box
          Container(
            height: 100, // Adjust the height of the photo box
            width: 100, // Adjust the width of the photo box
            color: Colors.white, // You can change the color or use decoration for image
            child: Center(
              child: Image.asset(
                'assets/image.png', // Replace 'assets/images/photo.png' with your image path
                width: 100, // Adjust the width of the image
                height: 100, // Adjust the height of the image
                fit: BoxFit.cover, // Adjust how the image should be fitted within the box
              ),
            ),
          ),
          SizedBox(height: 20), // Adjust the spacing between photo box and text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama : Putri Priyanti',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.white,
                  fontFamily: "monospace",
                  fontSize: 20, // Adjusted font size
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Jabatan : Mahasiswa',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.white,
                  fontFamily: "monospace",
                  fontSize: 20, // Adjusted font size
                ),
              ),
              SizedBox(height: 10),
              Text(
                'No Telp : 6287848793',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.white,
                  fontFamily: "monospace",
                  fontSize: 18, // Adjusted font size
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Email : Putripriyanti6@gmail.com',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.white,
                  fontFamily: "monospace",
                  fontSize: 18, // Adjusted font size
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}



}
