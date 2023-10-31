import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:pet_pals/models/to_do.dart';
import 'package:pet_pals/models/pet.dart';
import 'package:pet_pals/providers/data_provider.dart'; // Asegúrate de cambiar esta línea por la ruta correcta a tu archivo
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
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0xFF8F4152),
            colorScheme: const ColorScheme.light(primary: Color(0xFF8F4152)),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
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
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'New Task',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8F4152),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF3DAE3),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Task Title',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: taskTitleController,
                        decoration: const InputDecoration(
                          hintText: 'Enter task title',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Date',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CalendarCarousel(
                        selectedDateTime: selectedDate,
                        onDayPressed: (DateTime date, List<Event> events) {
                          setState(() {
                            selectedDate = date;
                          });
                        },
                        weekendTextStyle: const TextStyle(
                          color: Colors.red,
                        ),
                        thisMonthDayBorderColor: Colors.grey,
                        height: 420.0,
                        selectedDayBorderColor: const Color(0xFF8F4152),
                        selectedDayButtonColor: const Color(0xFFF3DAE3),
                        selectedDayTextStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        todayBorderColor: const Color(0xFF8F4152),
                        todayButtonColor: const Color(0xFF8F4152),
                        todayTextStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        weekdayTextStyle: const TextStyle(
                          color: Color(0xFF8F4152),
                        ),
                        headerTextStyle: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFF8F4152),
                        ),
                        iconColor: const Color(0xFF8F4152),
                        daysTextStyle: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Time',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () => _selectTime(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            DateFormat.jm().format(
                              DateTime(
                                selectedDate.year,
                                selectedDate.month,
                                selectedDate.day,
                                selectedTime.hour,
                                selectedTime.minute,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Activity',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Wrap(
                        spacing: 10,
                        children: ActivityType.values.map((activity) {
                          return ChoiceChip(
                            label: Text(activity.toString().split('.').last),
                            avatar: CircleAvatar(
                              backgroundImage: AssetImage(activityIcons[activity]!),
                            ),
                            selected: selectedActivity == activity,
                            onSelected: (selected) {
                              setState(() {
                                selectedActivity = activity;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Pet',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (isLoading)
                        const Center(child: CircularProgressIndicator())
                      else if (errorMessage != null)
                        Text(errorMessage!, style: const TextStyle(color: Colors.red))
                      else
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
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Verificar si alguno de los campos requeridos está vacío
                            if (taskTitleController.text.isEmpty || selectedActivity == null || selectedPet == null) {
                              // Mostrar un mensaje de error
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Falta completar algunos campos'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            } else {
                              ToDo task = ToDo(
                                id: selectedDate.toString(),
                                activityName: taskTitleController.text,
                                date: selectedDate,
                                time: selectedTime,
                                activityType: selectedActivity ?? ActivityType.walk,
                                relatedPet: selectedPet!,
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(const Color(0xFF8F4152)),
                          ),
                          child: const Text('Save Task'),
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
