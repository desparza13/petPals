import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:pet_pals/widgets/app_bar_widget.dart';
import '../widgets/menu_drawer_widget.dart';

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color(0xFF8F4152),
            colorScheme: ColorScheme.light(primary: Color(0xFF8F4152)),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Menu(),
      appBar: AppBarWidget(scaffoldKey: _scaffoldKey),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Task',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8F4152),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF3DAE3),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: CalendarCarousel(
                          dayPadding: 4,
                          headerTextStyle: TextStyle(color: Color(0xFF8F4152), fontSize: 18, fontWeight: FontWeight.bold),
                          headerMargin: EdgeInsets.all(0),
                          onDayPressed: (DateTime date, List events) {
                            this.setState(() => selectedDate = date);
                          },
                          weekendTextStyle: TextStyle(
                            color: Color(0xFF8F4152),
                          ),
                          thisMonthDayBorderColor: Color(0xFF8F4152),
                          selectedDayButtonColor: Color(0xFF8F4152),
                          selectedDayTextStyle: TextStyle(color: Colors.white),
                          weekFormat: false,
                          height: 350.0,
                          selectedDateTime: selectedDate,
                          daysHaveCircularBorder: true,
                          iconColor: Color(0xFF8F4152),
                          todayBorderColor: Color(0xFFED9BB7),
                          weekdayTextStyle: TextStyle(color: Color(0xFF8F4152)),
                          todayButtonColor: Colors.white,
                          todayTextStyle: TextStyle(color: Color(0xFFED9BB7)),
                          daysTextStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Time',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8F4152),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          _selectTime(context);
                        },
                        child: Text(
                          "${selectedTime.format(context)}",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF8F4152),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Save'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pink[300],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
