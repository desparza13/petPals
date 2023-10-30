import 'package:flutter/material.dart';
import 'package:pet_pals/models/to_do.dart';
import 'package:pet_pals/dummy_data/dummy_to_do.dart';

class ToDoHomeWidget extends StatefulWidget {
  @override
  _ToDoHomeWidgetState createState() => _ToDoHomeWidgetState();
}

class _ToDoHomeWidgetState extends State<ToDoHomeWidget> {
  String _filter = 'All'; //Filtro para saber si mostrar todos los ToDo's, los completados o los no completados

  //Formatear la fecha para las etiquetas en la lista
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
    var theme = Theme.of(context).colorScheme;

    //Ordenar los elementos de más cercano a más lejano
    List<ToDo> sortedToDos = List.from(dummyToDos)..sort((a, b) => a.date.compareTo(b.date));

    //Variable a usar para que no se repita la fecha en todos los elementos
    DateTime? previousDate;

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: theme.surface,
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
                  //Seleccionar valor del filtro
                  DropdownButton<String>(
                    value: _filter,
                    items: const [
                      DropdownMenuItem(value: 'All',child: Text('All')),
                      DropdownMenuItem(value: 'Done', child: Text('Done')),
                      DropdownMenuItem(value: 'Not done', child: Text('Not done')),
                    ],
                    //Actualizar el valor del filtro si este cambia
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
          ...sortedToDos.expand((toDo) {
            List<Widget> widgets = [];
            //Filtrado
            if (_filter == 'All' || (_filter == 'Done' && toDo.completed) || (_filter == 'Not done' && !toDo.completed)) {
              //Revisar si hay que mostrar la fecha
              if (previousDate == null || previousDate?.day != toDo.date.day) {
                widgets.add(
                  Text(
                    _formatDate(toDo.date),
                    style: TextStyle(
                      color: theme.tertiary,
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
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            toDo.completed = value;
                          });
                        }
                      },
                      //Checkbox circular
                      shape: const CircleBorder(),
                    ),
                    //Hora formateada - Titulo de la actividad
                    Text('${toDo.time.format(context)} - ${toDo.activityName}'),
                    const SizedBox(width: 5),
                    //Nombre de la mascotita
                    Text(toDo.relatedPet.name, style: TextStyle(color: theme.tertiary, fontWeight: FontWeight.bold))
                  ],
                ),
              );
            }
            return widgets;
          }).toList(),
        ],
      ),
    );
  }
}
