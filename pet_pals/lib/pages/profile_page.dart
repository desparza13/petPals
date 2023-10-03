import 'package:flutter/material.dart';
import 'package:pet_pals/pages/edit_profile_page.dart';
import 'package:pet_pals/widgets/menu_drawer_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:  Color(0xFF8F4152),        
        centerTitle: false,
        elevation: 2,
      ),
      drawer: Menu(),

      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
                  width: 401,
                  height: 247,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 396,
                height: 539,
                constraints: const BoxConstraints(
                  maxHeight: double.infinity,
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(35, 35, 0, 0),
                              child: Text(
                                'Jennifer Hernández ',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  36, 15, 35, 15),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const EditProfile()));
                                },
                                child: ListTile(
                                  title: const Text(
                                    'Mi Perfil',
                                    style: TextStyle(
                                      fontFamily:
                                          'Ubuntu', // Si 'Ubuntu' es tu tipo de letra personalizado
                                      color: Color(0xFF0A0909),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  subtitle: const Text(
                                    'Actualizar datos de mi perfil',
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                    ),
                                  ),
                                  trailing: const Icon(
                                    Icons.keyboard_arrow_right_sharp,
                                    color: Color(0xFFFFD8B1),
                                    size: 20,
                                  ),
                                  tileColor: const Color(0xFFFFD8B1),
                                  dense: false,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                36, 0, 35, 15),
                            child: ListTile(
                              title: const Text(
                                'Entrenamientos',
                                style: TextStyle(
                                  fontFamily:
                                      'Ubuntu', // Si 'Ubuntu' es tu tipo de letra personalizado
                                  color: Color(0xFF0A0909),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: const Text(
                                'Ver mis entrenamientos adquiridos',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_right_sharp,
                                color: Color(0xFFFFD8B1),
                                size: 20,
                              ),
                              tileColor: const Color(0xFFFFD8B1),
                              dense: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                36, 0, 35, 15),
                            child: ListTile(
                              title: const Text(
                                'Planes Alimenticios',
                                style: TextStyle(
                                  fontFamily:
                                      'Ubuntu', // Si 'Ubuntu' es tu tipo de letra personalizado
                                  color: Color(0xFF0A0909),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: const Text(
                                'Ver mis planes adquiridos',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_right_sharp,
                                color: Color(0xFFFFD8B1),
                                size: 20,
                              ),
                              tileColor: const Color(0xFFFFD8B1),
                              dense: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                36, 0, 35, 15),
                            child: ListTile(
                              title: const Text(
                                'Mi Contraseña',
                                style: TextStyle(
                                  fontFamily:
                                      'Ubuntu', // Si 'Ubuntu' es tu tipo de letra personalizado
                                  color: Color(0xFF0A0909),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: const Text(
                                'Actualizar contraseña',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_right_sharp,
                                color: Color(0xFFFFD8B1),
                                size: 20,
                              ),
                              tileColor: const Color(0xFFFFD8B1),
                              dense: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                36, 0, 35, 15),
                            child: ListTile(
                              title: const Text(
                                'Mis Formas de Pago',
                                style: TextStyle(
                                  fontFamily:
                                      'Ubuntu', // Si 'Ubuntu' es tu tipo de letra personalizado
                                  color: Color(0xFF0A0909),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: const Text(
                                'Ver, editar y agregar mis fomas de pago',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_right_sharp,
                                color: Color(0xFFFFD8B1),
                                size: 20,
                              ),
                              tileColor: const Color(0xFFFFD8B1),
                              dense: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
