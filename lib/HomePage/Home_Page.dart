import 'package:devquiz/HomePage/Widgets/AppBar/app_bar.dart';
import 'package:devquiz/HomePage/Widgets/level_button/level_button_widget.dart';
import 'package:devquiz/HomePage/Widgets/quiz_card/quiz_card_widget.dart';
import 'package:devquiz/HomePage/home_controller.dart';
import 'package:devquiz/HomePage/home_state.dart';
import 'package:devquiz/challenge/Widgets/quiz/quiz_widget.dart';
import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.sucesso) {
      return Scaffold(
          appBar: AppBarWidget(
            user: controller.user!,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15), //Distancia dos Levelsboxes
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LevelButtonWidget(
                      label: "Fácil",
                    ),
                    LevelButtonWidget(
                      label: "Médio",
                    ),
                    LevelButtonWidget(
                      label: "Difícil",
                    ),
                    LevelButtonWidget(
                      label: "Perito",
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisSpacing: 16, //Largura do Box de escolha de quiz
                    mainAxisSpacing:
                        16, //Provavelmente a Altura do box,ñ vai crescer provavelmente por causa do expanded
                    crossAxisCount: 2, //Tamanho do box de escolha de Quiz
                    children: controller.quizzes!
                        .map((e) => QuizCardWidget(
                              title: e.title,
                              percent: e.questionAnswered / e.questions.length,
                              completed:
                                  "${e.questionAnswered}/${e.questions.length}",
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          ));
    } else {
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        )),
      );
    }
  }
}
