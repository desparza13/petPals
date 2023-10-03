import 'package:flutter/material.dart';

class AddQuestionPage extends StatefulWidget {
  AddQuestionPage({Key? key}) : super(key: key);

  @override
  State<AddQuestionPage> createState() => _AddQuestionPageState();
}

class _AddQuestionPageState extends State<AddQuestionPage> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          padding: const EdgeInsets.all(
              0), // Puedes ajustar el relleno según tus necesidades
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF15161E),
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 450,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD8F3DC),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              'Submit a Question',
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                color: Color(0xFF15161E),
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 16, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 15, 0),
                                  child: TextFormField(
                                    controller: null,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Question Title',
                                      labelStyle: const TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF606A85),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF606A85),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFF6F61EF),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 12, 16, 12),
                                    ),
                                    style: const TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Color(0xFF15161E),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    cursorColor: const Color(0xFF6F61EF),
                                    validator: null,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 15, 0),
                                  child: TextFormField(
                                    controller: null,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: const TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF606A85),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      hintText: 'Question',
                                      hintStyle: const TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF606A85),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFF6F61EF),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFFF5963),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 24, 16, 12),
                                    ),
                                    style: const TextStyle(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0xFF15161E),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 16,
                                    minLines: 6,
                                    cursorColor: Colors.black,
                                    validator: null,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15, 24, 15, 12),
                                  child: Container(
                                    width: double.infinity,
                                    constraints: const BoxConstraints(
                                      maxWidth: 500,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 8, 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.add_a_photo_rounded,
                                            color: Color(0xFF6F61EF),
                                            size: 32,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 0, 0, 0),
                                            child: Text(
                                              'Upload Picture',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Ubuntu',
                                                color: Color(0xFF363744),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15, 24, 15, 12),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xFF6F61EF),
                                      textStyle: const TextStyle(
                                        fontFamily: 'Ubuntu',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(60),
                                      ),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.receipt_long,
                                          size: 15,
                                        ),
                                        SizedBox(
                                            width:
                                                8), // Espacio entre el icono y el texto
                                        Text('Submit Question'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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
        ),
      ),
    );
  }
}
