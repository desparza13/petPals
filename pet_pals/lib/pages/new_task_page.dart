import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:pet_pals/widgets/app_bar_widget.dart';
import 'package:pet_pals/models/to_do.dart';
import 'package:pet_pals/models/pet.dart';
import 'package:pet_pals/dummy_data/dummy_pets.dart';
import '../widgets/menu_drawer_widget.dart';

final activityIcons = {
  ActivityType.bath: 'assets/images/icons/bath_icon.png',
  ActivityType.eat: 'assets/images/icons/eat_icon.png',
  ActivityType.medicine: 'assets/images/icons/medicine_icon.png',
  ActivityType.play: 'assets/images/icons/play_icon.png',
  ActivityType.vaccine: 'assets/images/icons/vaccine_icon.png',
  ActivityType.vet: 'assets/images/icons/vet_icon.png',
  ActivityType.walk: 'assets/images/icons/walk_icon.png',
};

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  ActivityType? selectedActivity;
  Pet? selectedPet;
  TextEditingController taskTitleController = TextEditingController();

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
                      const Text(
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
                          headerTextStyle: TextStyle(
                            color: Color(0xFF8F4152),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Time Section
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Time',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
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
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          // Type Section
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Type',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                DropdownButton<ActivityType>(
                                  value: selectedActivity,
                                  onChanged: (ActivityType? newValue) {
                                    setState(() {
                                      selectedActivity = newValue;
                                    });
                                  },
                                  items: ActivityType.values.map((ActivityType type) {
                                    return DropdownMenuItem<ActivityType>(
                                      value: type,
                                      child: Row(
                                        children: [
                                          Image.asset(activityIcons[type]!, height: 30, width: 30),
                                          SizedBox(width: 10),
                                          Text(type.toString().split('.').last),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Pet',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      DropdownButton<Pet>(
                        value: selectedPet,
                        onChanged: (Pet? newValue) {
                          setState(() {
                            selectedPet = newValue;
                          });
                        },
                        items: dummyPets.map((Pet pet) {
                          return DropdownMenuItem<Pet>(
                            value: pet,
                            child: Text(pet.name),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Title',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: taskTitleController,
                        decoration: InputDecoration(
                          hintText: "Write the task's name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (selectedActivity != null && selectedPet != null) {
                              // Add new ToDo item to dummyToDos
                              final newTodo = ToDo(
                                id: DateTime.now().millisecondsSinceEpoch,
                                date: selectedDate,
                                time: selectedTime,
                                activityName: taskTitleController.text,
                                relatedPet: selectedPet!,
                                activityType: selectedActivity!,
                              );
                              // Here you can append newTodo to dummyToDos.
                              // Since dummyToDos is outside this file, you might want to
                              // handle this addition in a different manner or ensure
                              // proper imports and state management.
                            }
                          },
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
