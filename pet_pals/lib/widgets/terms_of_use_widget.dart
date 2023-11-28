import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/services.dart';

class TermsOfUseWidget extends StatelessWidget {
  const TermsOfUseWidget({super.key});

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Terms & Conditions',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 12.0),
                Expanded(
                    child: FutureBuilder(
                        future: Future.delayed(Duration(milliseconds: 150))
                            .then((value) {
                          return rootBundle
                              .loadString('assets/terms_and_conditions.md');
                        }),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final markdownData = snapshot.data;
                            if (markdownData != null) {
                              return Markdown(
                                data: markdownData,
                              );
                            }
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        })),
                SizedBox(height: 24.0),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pop(); // Cierra el cuadro de diálogo
                    },
                    child: Text('CLOSE'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('By creating an account, you are agreeing to our'),
          GestureDetector(
            child: Text(
              'Terms & Conditions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => _showDialog(context),
          ),
        ],
      ),
    );
  }
}
