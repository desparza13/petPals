import 'package:flutter/material.dart';
import 'package:pet_pals/models/to_do.dart';
import 'package:pet_pals/providers/data_provider_todos.dart';


class ToDoHomeWidget extends StatefulWidget {
  @override
  _ToDoHomeWidgetState createState() => _ToDoHomeWidgetState();
}

class _ToDoHomeWidgetState extends State<ToDoHomeWidget> {
  String _filter =
      'All'; // Filtro para saber si mostrar todos los ToDo's, los completados o los no completados

  // Formatear la fecha para las etiquetas en la lista
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    if (date.year == now.year && date.month == now.month) {
      if (date.day == now.day) return 'Today';
      if (date.day == now.day + 1) return 'Tomorrow';
    }
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'To do',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Row(
                children: [
                  // Seleccionar valor del filtro
                  DropdownButton<String>(
                    value: _filter,
                    items: const [
                      DropdownMenuItem(value: 'All', child: Text('All')),
                      DropdownMenuItem(value: 'Done', child: Text('Done')),
                      DropdownMenuItem(
                          value: 'Not done', child: Text('Not done')),
                    ],
                    // Actualizar el valor del filtro si este cambia
                    onChanged: (String? value) {
                      if (value != null) {
                        setState(() {
                          _filter = value;
                        });
                      }
                    },
                  ),
                  Image.asset(
                    'assets/images/paw_icon.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          FutureBuilder<List<ToDo>>(
            future: fetchToDos('t5unAPjpCvZbg6nJl52Y'),
            builder:
                (BuildContext context, AsyncSnapshot<List<ToDo>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No elements found'));
              }

              List<ToDo> toDos = snapshot.data!;

              // Ordenar los elementos de más cercano a más lejano
              toDos.sort((a, b) => a.date.compareTo(b.date));

              // Variable a usar para que no se repita la fecha en todos los elementos
              DateTime? previousDate;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: toDos.expand((toDo) {
                  List<Widget> widgets = [];
                  // Filtrado
                  if (_filter == 'All' ||
                      (_filter == 'Done' && toDo.completed) ||
                      (_filter == 'Not done' && !toDo.completed)) {
                    // Revisar si hay que mostrar la fecha
                    if (previousDate == null ||
                        previousDate?.day != toDo.date.day) {
                      widgets.add(
                        Text(
                          _formatDate(toDo.date),
                          style: const TextStyle(
                            color: Color(0xFFED9BB7),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      );
                      previousDate = toDo.date;
                    }

                    widgets.add(
                      Row(
                        children: [
                          Checkbox(
                            value: toDo.completed,
                            onChanged: (bool? value) async {
                              if (value != null) {
                                await toggleToDoCompletion(context, toDo.id);
                                setState(() {
                                  toDo.completed = value;
                                });
                              }
                            },
                            shape: const CircleBorder(),
                          ),
                          // Hora formateada - Titulo de la actividad
                          Text(
                            '${toDo.time.hour}:${toDo.time.minute.toString().padLeft(2, '0')} - ${toDo.activityName}',
                            style: TextStyle(color: Colors.black),
                          ),
                          const SizedBox(width: 5),
                          // Nombre de la mascota
                          Text(
                            toDo.relatedPet.name,
                            style: const TextStyle(
                                color: Color(0xFFED9BB7),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  }
                  return widgets;
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
