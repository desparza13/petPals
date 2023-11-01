import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:pet_pals/models/to_do.dart';
import 'package:pet_pals/models/pet.dart';
import 'package:pet_pals/providers/data_provider_pet.dart'; 
import 'package:pet_pals/providers/data_provider_todos.dart';
import '../widgets/menu_drawer_widget.dart';
import '../widgets/app_bar_widget.dart';

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
  const NewTaskPage({super.key});

  @override
  NewTaskPageState createState() => NewTaskPageState();
}

class NewTaskPageState extends State<NewTaskPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  ActivityType? selectedActivity;
  Pet? selectedPet;
  List<Pet> pets = [];
  bool isLoading = true;
  String? errorMessage;

  TextEditingController taskTitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadPets();
  }

  void _loadPets() async {
    try {
      pets = await fetchPets('ejemplo');
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
        errorMessage = "No se pudieron cargar las mascotas. Por favor, intenta nuevamente más tarde.";
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    var theme = Theme.of(context);
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: theme.colorScheme.primary,
            colorScheme: ColorScheme.light(primary: theme.colorScheme.primary),
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
    var theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: Menu(),
      appBar: AppBarWidget(scaffoldKey: _scaffoldKey),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'New Task',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(20),
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
                            color: theme.colorScheme.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          headerMargin: EdgeInsets.all(0),
                          onDayPressed: (DateTime date, List events) {
                            this.setState(() => selectedDate = date);
                          },
                          weekendTextStyle: TextStyle(
                            color: theme.colorScheme.primary,
                          ),
                          thisMonthDayBorderColor: theme.colorScheme.primary,
                          selectedDayButtonColor: theme.colorScheme.primary,
                          selectedDayTextStyle: TextStyle(color: Colors.white),
                          weekFormat: false,
                          height: 350.0,
                          selectedDateTime: selectedDate,
                          daysHaveCircularBorder: true,
                          iconColor: theme.colorScheme.primary,
                          todayBorderColor: theme.colorScheme.tertiary,
                          weekdayTextStyle: TextStyle(color: theme.colorScheme.primary),
                          todayButtonColor: Colors.white,
                          todayTextStyle: TextStyle(color: theme.colorScheme.tertiary),
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
                                const Text(
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
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: theme.colorScheme.primary,
                                  ),
                                  child: Text(
                                    "${selectedTime.format(context)}",
                                    style: theme.primaryTextTheme.labelLarge,
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
                      const SizedBox(height: 20),
                      const Text(
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
                          items: pets.map((Pet pet) {
                            return DropdownMenuItem<Pet>(
                              value: pet,
                              child: Text(pet.name),
                            );
                          }).toList(),
                        ),
                      const SizedBox(height: 20),
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
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: theme.colorScheme.onPrimary
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
