import 'package:flutter/material.dart';

class CastAndCrewWidget extends StatelessWidget {
  final List casts ;
  CastAndCrewWidget({super.key, required this.casts});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const EdgeInsets.only(top:10, bottom:5 , right:5,left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const  Text(
            "Cast",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20
            ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            height: 160,
            child: ListView.builder(
              shrinkWrap:true,
              scrollDirection:Axis.horizontal,
              itemCount:casts.length,
                itemBuilder: (context,index){
                return castCard(casts[index]);
                }
            ),
          )

        ],
      ),
    );
  }
  Widget castCard(final Map cast){
    return Container(
      margin: const EdgeInsets.only(right:20 ),
      width: 80,
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                  image: AssetImage(cast["image"]),
                fit: BoxFit.cover
              )
            ),
          ),
          const SizedBox(height: 5,),
          Text(cast['name'],
            maxLines: 2,
            textAlign: TextAlign.left,
            style: const TextStyle(
             color: Colors.white70,
              fontWeight: FontWeight.w500
            ),
          )
        ],
      ),
    );
  }
}
