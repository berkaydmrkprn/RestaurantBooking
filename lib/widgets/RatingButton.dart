import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restoran_app/model/user.dart';

class RatingButton extends StatefulWidget {
  const RatingButton({Key? key}) : super(key: key);

  @override
  _RatingButtonState createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  double? _ratingValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 125, 78, 35),
          title: const Text('Kardeşler Pide Kebap'),
          
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Yemeklerimizi ve Ortamımızı Beğendiniz mi ?',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 25),
                // implement the rating bar
                RatingBar(
                    initialRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                        full: const Icon(Icons.star, color: Colors.orange),
                        half: const Icon(
                          Icons.star_half,
                          color: Colors.orange,
                        ),
                        empty: const Icon(
                          Icons.star_outline,
                          color: Colors.orange,
                        )),
                    onRatingUpdate: (value) {
                      setState(() {
                        _ratingValue = value;
                      });
                    }),
                const SizedBox(height: 25),
                // Display the rate in number
                Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 125, 78, 35), shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: Text(
                    _ratingValue != null ? _ratingValue.toString() : 'Oyla!',
                    style: const TextStyle(color: Colors.white, fontSize: 30),

                      

                  ),

                  
                ),
                Divider(),
                ElevatedButton(
                   style: ElevatedButton.styleFrom(
              maximumSize: Size(200, 40),
              minimumSize: Size(200, 40),
              backgroundColor: Color.fromARGB(255, 125, 78, 35),
            ),
                  
                  
                  onPressed:() async{

                  var rate =RateModel(rate:_ratingValue.toString());

                    await FirebaseFirestore.instance

                    .collection("Oy").add(rate.toJson());
                  
                }, child: Text("oy ver")),
              ],
            ),
          ),
        ));
  }
}