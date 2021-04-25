import 'package:devquiz/HomePage/Widgets/AppBar/Score_card/score_card_widget.dart';
import 'package:devquiz/Shared/models/user_model.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/core/app_gradients.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  AppBarWidget({required this.user})
      : super(
            preferredSize: Size.fromHeight(250),
            child: Container(
              height: 250,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(gradient: AppGradients.linear),
                    height: 161,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(TextSpan(
                            text: "Olá, ",
                            style: AppTextStyles.title,
                            children: [
                              TextSpan(
                                  text: user.name,
                                  style: AppTextStyles.titleBold)
                            ])),
                        Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(user.photoUrl)),
                              borderRadius: BorderRadius.circular(10)),
                        )
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment(0.0, 1.0),
                      child: ScoreCardWidget(
                        percent: user.score / 100,
                      ))
                ],
              ),
            ));
}
