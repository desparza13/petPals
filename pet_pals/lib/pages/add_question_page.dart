import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Asegúrate de haber importado el paquete de Lottie
import 'package:pet_pals/providers/data_provider_questions.dart';
import 'package:pet_pals/models/question.dart';

class AddQuestionPage extends StatefulWidget {
  @override
  _AddQuestionPageState createState() => _AddQuestionPageState();
}

class _AddQuestionPageState extends State<AddQuestionPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _questionController = TextEditingController();
  final _dataProvider = QuestionsDataProvider();

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  void _submitQuestion() async {
    if (_formKey.currentState!.validate()) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Add a Question'),
      ),
      body: SingleChildScrollView( // Permite el desplazamiento cuando el contenido excede el área visible de la pantalla
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                          Lottie.asset('assets/lottie/question.json', width: 200, height: 200),
                SizedBox(height: 20), 
                TextFormField(
                  controller: _questionController,
                  decoration: InputDecoration(
                    labelText: 'Your Question',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5, // Permite hasta 5 líneas en el campo de texto
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a question';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20), // Añade un espacio antes del botón
                ElevatedButton(
                  onPressed: _submitQuestion,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
