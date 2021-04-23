import 'package:devquiz/HomePage/home_repository.dart';
import 'package:devquiz/HomePage/home_state.dart';
import 'package:devquiz/Shared/models/awnser_model.dart';
import 'package:devquiz/Shared/models/question_model.dart';
import 'package:devquiz/Shared/models/quiz_model.dart';
import 'package:devquiz/Shared/models/user_model.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  //Usuário
  UserModel? user;
  //Quizzes
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.carregando;
    user = await repository.getUser();
    state = HomeState.sucesso;
  }

  void getQuizzes() async {
    state = HomeState.carregando;
    quizzes = await repository.getQuizzes();
    state = HomeState.sucesso;
  }
}
