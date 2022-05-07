import 'package:social_app/modules/new_post/new_post_screen.dart';
import 'package:social_app/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/cubit/cuibt.dart';
import 'package:social_app/shared/cubit/states.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if (state is SocialNewPostState) {
          navigateTo(
            context,
            NewPostScreen(),
          );
        }
      },
      builder: (context, state)
      {
        var cubit = SocialCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  IconBroken.Notification,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  IconBroken.Search,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNav(index);
            },
            items: const [
               BottomNavigationBarItem(
                icon:  Icon(
                  IconBroken.Home,
                ),
                label: 'Home',
              ),
               BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Chat,
                ),
                label: 'Chats',
              ),
               BottomNavigationBarItem(
                icon:  Icon(
                  IconBroken.Paper_Upload,
                ),
                label: 'Post',
              ),
               BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Location,
                ),
                label: 'Users',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Setting,
                ),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
///////////////////////////////verify////////////////////////////
//   Scaffold(
//   appBar: AppBar(
//     title: const Text(
//       'News Feed',
//     ),
//   ),
//   body: ConditionalBuilder(
//     condition: SocialCubit.get(context).model != null,
//     builder: (context) {
//       var model = FirebaseAuth.instance.currentUser!.emailVerified;
//       print(model);
//
//       return Column(
//         children: [
//           if (!model)
//             Container(
//               color: Colors.amber.withOpacity(.6),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 20.0,
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(
//                       Icons.info_outline,
//                     ),
//                     const SizedBox(
//                       width: 15.0,
//                     ),
//                     const Expanded(
//                       child: Text(
//                         'please verify your email',
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 15.0,
//                     ),
//                     defaultTextButton(
//                       function: ()
//                       {
//                         FirebaseAuth.instance.currentUser!
//                             .sendEmailVerification()
//                             .then((value)
//                         {
//                           showToast(
//                             text: 'check your mail',
//                             state: ToastStates.SUCCESS,
//                           );
//                         }).catchError((error) {});
//                       },
//                       text: 'send',
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//         ],
//       );
//     },
//     fallback: (context) => const Center(child: CircularProgressIndicator()),
//   ),
// );
