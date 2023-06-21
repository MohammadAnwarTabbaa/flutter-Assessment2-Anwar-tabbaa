import 'package:flutter/widgets.dart';

class InfoRow extends StatelessWidget{
  const InfoRow({super.key , required this.label , required this.value});

  final label ; 
  final value;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "$label: ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    ),
  );
  }

}



