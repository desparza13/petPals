import 'package:flutter/material.dart';

class QuestionDetail extends StatefulWidget {
  QuestionDetail({Key? key}) : super(key: key);

  @override
  State<QuestionDetail> createState() => _QuestionDetailState();
}

class _QuestionDetailState extends State<QuestionDetail> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF8F4152)
      ),
      backgroundColor: const Color(0xFFF1F4F8),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1611590027211-b954fd027b51?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDd8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Alexandria Smith',
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF101213),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '1m ago',
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF57636C),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print('IconButton pressed ...');
                      },
                      borderRadius: BorderRadius.circular(30),
                      splashColor: Colors.transparent,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: IconButton(
                            icon: const Icon(
                              Icons.keyboard_control_rounded,
                              color: Color(0xFF57636C),
                              size: 20,
                            ),
                            onPressed: () {
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              QuestionAndAnswersWidget(),

              // Botón para escribir un comentario
              WriteCommentButton(
                onPressed: () {
                  // Acción al presionar el botón
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionAndAnswersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFD8F3DC),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '¿Ut enim ad minim veniam?',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    color: Color(0xFF101213),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    color: Color(0xFF57636C),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.favorite_border,
                  color: Color(0xFF57636C),
                  size: 24,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                  child: Text(
                    '3',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Color(0xFF101213),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                  child: Text(
                    'likes',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Color(0xFF101213),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                  child: Icon(
                    Icons.mode_comment_outlined,
                    color: Color(0xFF57636C),
                    size: 24,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                  child: Text(
                    '8',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Color(0xFF101213),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                  child: Text(
                    'Comments',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Color(0xFF101213),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Ejemplo de respuesta
          AnswerWidget(
            author: 'Randy Alcorn',
            content:
                'I\'m not really sure about this section here aI think you should do something cool!',
            timeAgo: '\na min ago',
          ),
          AnswerWidget(
            author: 'Randy Alcorn',
            content:
                'I\'m not really sure about this section here aI think you should do soemthing cool!',
            timeAgo: '\na min ago',
          ),
        ],
      ),
    );
  }
}

class AnswerWidget extends StatelessWidget {
  final String author;
  final String content;
  final String timeAgo;

  AnswerWidget({
    required this.author,
    required this.content,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar del autor
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),

          // Contenido de la respuesta
          Expanded(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F4F8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      author,
                      style: const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Color(0xFF101213),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      content,
                      style: const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Color(0xFF57636C),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Tiempo desde la publicación
          Text(
            timeAgo,
            style: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              color: Color(0xFF57636C),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class WriteCommentButton extends StatelessWidget {
  final VoidCallback onPressed;

  WriteCommentButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
        color: Color(0xFFF1F4F8),
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: const Icon(
            Icons.edit_outlined,
            size: 15,
          ),
          label: const Text(
            'Write a Comment',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF4B39EF),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
