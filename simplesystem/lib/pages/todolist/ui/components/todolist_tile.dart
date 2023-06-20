import 'package:flutter/gestures.dart';
import 'package:simplesystem/pages/todolist/bloc/todolist_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:simplesystem/pages/home/models/activities_model.dart';

class TodolistTile extends StatelessWidget {
  final ActivityModel activityModel;
  final TodolistBloc todolistBloc;

  const TodolistTile({super.key, required this.activityModel, required this.todolistBloc});

  _launchURL() async {
    Uri _url = Uri.parse(activityModel.link);
      if (await launchUrl(_url)) {
        await launchUrl(_url);
      } else {
        throw 'Could not launch $_url';
      }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Activity: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                TextSpan(
                  text: activityModel.activity,
                ),
              ]
            )
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Activity Type: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                TextSpan(
                  text: activityModel.type,
                ),
              ]
            )
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Link: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                TextSpan(
                  text: activityModel.link,
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = _launchURL,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: (){
                      // todolistBloc.add(ItemFavoriteButtonClickedEvent(
                      //   activityModel: activityModel
                      // ));
                    }, 
                    icon: Icon(Icons.star_border_outlined)
                  ),
                  IconButton(
                    onPressed: (){
                      todolistBloc.add(RemoveFromTodolistEvent(
                        itemkey: activityModel.key
                      ));
                    }, 
                    icon: Icon(Icons.remove_circle_outline)
                  ),
                ],
              ),
            ],
          ),
        ]
      ),
    );
  }
}