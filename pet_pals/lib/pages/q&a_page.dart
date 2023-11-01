import 'package:flutter/material.dart';
import 'package:pet_pals/pages/add_question_page.dart';
import 'package:pet_pals/pages/question_detail_page.dart';
import 'package:pet_pals/widgets/app_bar_widget.dart';
import 'package:pet_pals/widgets/menu_drawer_widget.dart';

class QAPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  QAPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarWidget(scaffoldKey: _scaffoldKey),
      drawer: Menu(),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity, // Ocupa todo el ancho de la pantalla
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Question',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddQuestionPage()),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF5E17EB),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: const Color(0xFF5E17EB), width: 1),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: Colors
                              .white, // Cambia el color del icono según tus necesidades
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
             Align(
              alignment: AlignmentDirectional(-1.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
                child: Text(
                  'Most Voted',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestionDetail()),
                      );
                    },
                    child: Align(
                      alignment: const AlignmentDirectional(-1.00, 0.00),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16, 15, 12, 12),
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x34090F13),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment:
                                    const AlignmentDirectional(1.00, -1.00),
                                child: Container(
                                  width: double.infinity,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFC0F6FF),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 12, 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Question Title',
                                              style: TextStyle(
                                                fontFamily: 'Ubuntu',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.00, 0.00),
                                              child: Icon(
                                                Icons.favorite,
                                                color: Color(0xFFD51A1A),
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
                                          style: TextStyle(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF232121),
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
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
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 15, 12, 12),
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x34090F13),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QuestionDetail()),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 140,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF82E47A),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 12, 12, 12),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Question Title',
                                            style: TextStyle(
                                              fontFamily: 'Readex Pro',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                1.00, 0.00),
                                            child: Icon(
                                              Icons.favorite,
                                              color: Color(0xFFD51A1A),
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF232121),
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
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
                  Align(
                    alignment: const AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 15, 12, 12),
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x34090F13),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 140,
                              decoration: BoxDecoration(
                                color: const Color(0xFF9865FF),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Question Title',
                                          style: TextStyle(
                                            fontFamily: 'Readex Pro',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.00, 0.00),
                                          child: Icon(
                                            Icons.favorite,
                                            color: Color(0xFFD51A1A),
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFF232121),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
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
            const Align(
              alignment: AlignmentDirectional(-1.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                child: Text(
                  'Most Recent',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    color: Color(0xFFF5A688),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 15, 12, 12),
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x34090F13),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 140,
                              decoration: BoxDecoration(
                                color: const Color(0xFFA0C4FF),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Question Title',
                                          style: TextStyle(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 16, // Tamaño del texto
                                            color: Color(
                                                0xFF232121), // Color del texto
                                            fontWeight: FontWeight
                                                .w600, // Peso de la fuente
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.00, 0.00),
                                          child: Icon(
                                            Icons.favorite,
                                            color: Color(0xFFD51A1A),
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 15, // Tamaño del texto
                                        color: Color(
                                            0xFF232121), // Color del texto
                                        fontWeight: FontWeight
                                            .normal, // Peso de la fuente
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 15, 12, 12),
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x34090F13),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 140,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFCBF49),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Question Title',
                                          style: TextStyle(
                                            fontFamily: 'Readex Pro',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.00, 0.00),
                                          child: Icon(
                                            Icons.favorite,
                                            color: Color(0xFFD51A1A),
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFF232121),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 15, 12, 12),
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x34090F13),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 140,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFB6F92),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Question Title',
                                          style: TextStyle(
                                            fontFamily: 'Readex Pro',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.00, 0.00),
                                          child: Icon(
                                            Icons.favorite,
                                            color: Color(0xFFD51A1A),
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFF232121),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
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
          ],
        ),
      ),
    );
  }
}
