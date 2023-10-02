import 'package:flutter/material.dart';

class PetsBarWidget extends StatefulWidget {
  const PetsBarWidget({super.key});

  @override
  State<PetsBarWidget> createState() => _PetsBarWidgetState();
}

class _PetsBarWidgetState extends State<PetsBarWidget> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            ElevatedButton(
              onPressed: (){
                setState((){
                  selected = 1;
                });
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: selected==1 ? Color.fromARGB(255, 245, 190, 138): Colors.white,
                fixedSize: Size(80, 80)
              ),
              child: Image.asset('assets/images/icons/dog_icon.png')
            ),
            const Padding(
              padding: EdgeInsets.only(top:8.0),
              child: Text('Dogs', style: TextStyle(fontWeight: FontWeight.bold),),
            )
          ],
        ),
        Column(
          children: [
            ElevatedButton(
              onPressed: (){
                setState((){
                  selected = 2;
                });
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: selected==2 ? Color.fromARGB(255, 245, 190, 138): Colors.white,
                fixedSize: Size(80, 80)
              ),
              child: Image.asset('assets/images/icons/cat_icon.png')
            ),
            const Padding(
              padding: EdgeInsets.only(top:8.0),
              child: Text('Cats', style: TextStyle(fontWeight: FontWeight.bold)),
            )

          ],
        ),
        
        Column(
          children: [
            ElevatedButton(
              onPressed: (){
                setState((){
                  selected = 3;
                });
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: selected==3 ? Color.fromARGB(255, 245, 190, 138): Colors.white,
                fixedSize: Size(80, 80)
              ),
              child: Image.asset('assets/images/icons/bird_icon.png')
            ),
            const Padding(
              padding: EdgeInsets.only(top:8.0),
              child: Text('Birds', style: TextStyle(fontWeight: FontWeight.bold)),
            )
          ],
        ),
        Column(
          children: [
            ElevatedButton(
              onPressed: (){
                setState((){
                  selected = 4;
                });
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: selected==4 ? Color.fromARGB(255, 245, 190, 138): Colors.white,
                fixedSize: Size(80, 80)
              ),
              child: Text('...',style: TextStyle(color: Colors.black, fontSize: 30),)
            ),
            const Padding(
              padding: EdgeInsets.only(top:8.0),
              child: Text('All', style: TextStyle(fontWeight: FontWeight.bold)),
            )
          ],
        ),
        
      ],
    );
  }
}
