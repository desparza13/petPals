import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_pals/widgets/app_bar_widget.dart';
import 'package:pet_pals/providers/data_provider_todos.dart';
import 'package:pet_pals/models/to_do.dart';
import '../widgets/menu_drawer_widget.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});
  @override
  ToDoPageState createState() => ToDoPageState();
}

class ToDoPageState extends State<ToDoPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime? previousDate;
  List<ToDo> todos = [];
  bool isLoading = true;
  bool confettiActive = false; // Agregamos un indicador de confeti activo

  final activityIcons = {
    ActivityType.bath: 'assets/images/icons/bath_icon.png',
    ActivityType.eat: 'assets/images/icons/eat_icon.png',
    ActivityType.medicine: 'assets/images/icons/medicine_icon.png',
    ActivityType.play: 'assets/images/icons/play_icon.png',
    ActivityType.vaccine: 'assets/images/icons/vaccine_icon.png',
    ActivityType.vet: 'assets/images/icons/vet_icon.png',
    ActivityType.walk: 'assets/images/icons/walk_icon.png',
  };

  Future<void> initToDos() async {
    List<ToDo> fetchedToDos = await fetchToDos();
    setState(() {
      todos = fetchedToDos;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController();
    initToDos();
  }

  late ConfettiController _confettiController;

  String timeFilter = 'All';
  String completionFilter = 'All';

  List<ToDo> filteredTodos() {
    DateTime now = DateTime.now();

    List<ToDo> timeFiltered = todos;

    if (timeFilter == 'Today') {
      timeFiltered = todos
          .where((todo) =>
              todo.date.year == now.year &&
              todo.date.month == now.month &&
              todo.date.day == now.day)
          .toList();
    } else if (timeFilter == 'This week') {
      DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
      DateTime endOfWeek = startOfWeek.add(Duration(days: 6));
      timeFiltered = todos
          .where((todo) =>
              todo.date.isAfter(startOfWeek) && todo.date.isBefore(endOfWeek))
          .toList();
    } else if (timeFilter == 'This month') {
      DateTime startOfMonth = DateTime(now.year, now.month, 1);
      DateTime endOfMonth = DateTime(now.year, now.month + 1, 0);
      timeFiltered = todos
          .where((todo) =>
              todo.date.isAfter(startOfMonth) && todo.date.isBefore(endOfMonth))
          .toList();
    }

    timeFiltered.sort((a, b) => a.date.compareTo(b.date));

    if (completionFilter == 'Not done') {
      final notDoneList =
          timeFiltered.where((todo) => !todo.completed).toList();
      if (notDoneList.isEmpty && !confettiActive) {
        _showConfetti();
        confettiActive = true; // Activamos el confeti
      } else if (notDoneList.isNotEmpty && confettiActive) {
        _stopConfetti();
        confettiActive = false; // Desactivamos el confeti
      }
      return notDoneList;
    } else if (completionFilter == 'Done') {
      if (confettiActive) {
        _stopConfetti();
        confettiActive = false; // Desactivamos el confeti
      }
      return timeFiltered.where((todo) => todo.completed).toList();
    } else {
      if (confettiActive) {
        _stopConfetti();
        confettiActive = false; // Desactivamos el confeti
      }
      return timeFiltered;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    if (date.year == now.year && date.month == now.month) {
      if (date.day == now.day) return 'Today';
      if (date.day == now.day + 1) return 'Tomorrow';
    }
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showConfetti() {
    _confettiController.play();
  }

  void _stopConfetti() {
    _confettiController.stop();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Menu(),
      appBar: AppBarWidget(scaffoldKey: _scaffoldKey),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'My To-Do list',
                    style: TextStyle(
                      color: theme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropdownButton<String>(
                        value: timeFilter,
                        items: ['Today', 'This week', 'This month', 'All']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            timeFilter = value!;
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      DropdownButton<String>(
                        value: completionFilter,
                        items: ['Not done', 'Done', 'All'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            completionFilter = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: filteredTodos().isEmpty
                        ? ConfettiWidget(
                            confettiController: _confettiController,
                            colors: [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.secondary, Theme.of(context).colorScheme.secondaryContainer, Theme.of(context).colorScheme.primaryContainer, Theme.of(context).colorScheme.tertiary, Theme.of(context).colorScheme.tertiaryContainer],
                            blastDirectionality: BlastDirectionality
                                .explosive,
                            shouldLoop: false, 
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Lottie.asset(
                                    'assets/lottie/sleepy.json', 
                                    width: 150,
                                    height: 150,
                                  ),
                                  Text(
                                    "You did it!",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: theme.primary,
                                    ),
                                  ),
                                ],
                              ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(10.0),
                            itemCount: filteredTodos().length,
                            itemBuilder: (ctx, index) {
                              final toDo = filteredTodos()[index];
                              List<Widget> widgets = [];

                              if (previousDate == null ||
                                  previousDate?.day != toDo.date.day) {
                                widgets.add(
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text(
                                        _formatDate(toDo.date),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: theme.tertiary,
                                        ),
                                      ),
                                    ),
                                  ),
                                );

                                previousDate = toDo.date;
                              }

                              widgets.add(
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        activityIcons[toDo.activityType]!,
                                        width: 40,
                                        height: 40,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        toDo.time.format(context),
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(width: 10),
                                      Flexible(
                                        child:
                                          Text(
                                            toDo.activityName,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        toDo.relatedPet.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: theme.tertiary,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );

                              return Column(
                                children: widgets,
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
    );
  }
}
