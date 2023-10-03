import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({Key? key}) : super(key: key);

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              expandedHeight: 200,
              pinned: false,
              floating: false,
              backgroundColor: const Color(0xFFE49FAC),
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30, // Tamaño del icono
                  color: Colors.white, // Color del icono
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // Esto hará que la pantalla vuelva atrás
                },
              ),
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF39D2C0),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/pets_buy_page.jpg',
                      ),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              centerTitle: false,
              elevation: 0,
            )
          ],
          body: DefaultTextStyle(
            style: const TextStyle(
              fontFamily: 'Ubuntu',
            ),
            child: Builder(
              builder: (context) {
                return SafeArea(
                  top: false,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 35, 0, 25),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 15, 20, 0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          'assets/images/trainin_buy_page.png',
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 10),
                                      child: Text(
                                        'Training',
                                        style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          fontSize: 16, // Tamaño del texto
                                          color:
                                              Colors.black, // Color del texto
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 15, 20, 0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          'assets/images/food_buy_page.png',
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.contain,
                                          alignment:
                                              const Alignment(0.00, 0.00),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 10),
                                      child: Text(
                                        'Food Plan',
                                        style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          fontSize: 16, // Tamaño del texto
                                          color:
                                              Colors.black, // Color del texto
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 0, 20, 0),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: const Color(0xFFFCD8E3),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFF3A4B3),
                                        Color(0xFFF8DDE3)
                                      ],
                                      stops: [0, 1],
                                      begin: AlignmentDirectional(1, -1),
                                      end: AlignmentDirectional(-1, 1),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                             const Row(
                                               children: [
                                                 Text(
                                                  'Discover Our Products',
                                                  style: TextStyle(
                                                    fontFamily: 'Ubuntu',
                                                    fontSize:
                                                        16, // Tamaño del texto
                                                    color: Color(
                                                        0xFF5D5D5D), // Color del texto
                                                  ),
                                            ),
                                               ],
                                             ),
                                            const Row(
                                              children: [
                                                Text(
                                                  'Travel Training',
                                                  style: TextStyle(
                                                      fontFamily: 'Ubuntu',
                                                      fontSize:
                                                          20, // Tamaño del texto
                                                      color: Colors.white,
                                                      fontWeight: FontWeight
                                                          .w600 // Color del texto
                                                      ),
                                                ),
                                              ],
                                            ),
                                            const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 10),
                                              child: Text(
                                                'Learn together with your best\nfriend appropriate behavior\nduring the trip and before the trip to\ntake care of your four-legged friend',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontFamily: 'Ubuntu',
                                                  fontSize:
                                                      15, // Tamaño del texto
                                                  color: Color(
                                                      0xFF232121), // Color del texto
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8), // Esquinas redondeadas
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets
                                                            .all(8.0),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        // Acción del botón
                                                      },
                                                      child: const Text(
                                                        'Start Learning',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Ubuntu',
                                                          color: Colors
                                                              .black, // Texto negro
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),// Espacio entre el botón y el icono de candado
                                                const Icon(
                                                  Icons.lock,
                                                  color: Colors.white,
                                                  size: 24,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: LayoutBuilder(builder: (context, constraints) {
                            double screenWidth = constraints.maxWidth;
                            bool applySeparation = screenWidth > 600;

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(-1.00, 0.00),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 140,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF39D2C0),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.asset(
                                                    'assets/images/plan_1_buy_page.png',
                                                  ).image,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        12, 12, 12, 12),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.00, 0.00),
                                                      child: Container(
                                                        width: 26,
                                                        height: 26,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0x98FFFFFF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: const Icon(
                                                          Icons.lock,
                                                          color: Colors.white,
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ),
                                                    const Text(
                                                      'Plan to avoid allergies',
                                                      style: TextStyle(
                                                        fontFamily: 'Ubuntu',
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                  if (applySeparation) const SizedBox(width: 0),
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(-1.00, 0.00),
                                    child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 15, 12, 12),
                                        child: Container(
                                          width: 200,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              const BoxShadow(
                                                blurRadius: 4,
                                                color: Color(0x34090F13),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 140,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFF39D2C0),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: Image.asset(
                                                      'assets/images/plan_2_buy_page.png',
                                                    ).image,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          12, 12, 12, 12),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                1.00, 0.00),
                                                        child: Container(
                                                          width: 26,
                                                          height: 26,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0x98FFFFFF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: const Icon(
                                                            Icons.lock,
                                                            color: Colors.white,
                                                            size: 15,
                                                          ),
                                                        ),
                                                      ),
                                                      const Text(
                                                        'Plan for your adult pet',
                                                        style: TextStyle(
                                                          fontFamily: 'Ubuntu',
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
