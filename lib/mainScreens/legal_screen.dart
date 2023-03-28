import 'package:flutter/material.dart';

class LegalScreen extends StatelessWidget {
  const LegalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: const [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Legal",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vitae fringilla lacus. Duis commodo sem non condimentum accumsan. Aliquam ac tristique lacus, eget varius enim. Phasellus faucibus felis nec massa gravida, non blandit nisl posuere. Proin sodales justo mauris, ac bibendum leo consequat eget. Vestibulum egestas molestie lorem vitae sagittis. Phasellus vehicula maximus tempor. Nunc ac fermentum ligula. Morbi eget arcu ex. Etiam vitae lectus nec libero rhoncus hendrerit. Nulla eu magna dictum, vestibulum urna a, varius nunc. Morbi sit amet efficitur nibh. Ut at risus sed nisi congue posuere sodales quis turpis. Nunc at dignissim ligula, commodo consectetur massa. Maecenas ex metus, pulvinar a diam sed, viverra elementum velit.\n\n"
                    "Vestibulum cursus tempor augue in dictum. Morbi pulvinar velit lacus, non malesuada enim posuere ut. Morbi mollis nulla nec arcu congue, sit amet efficitur nisl feugiat. Donec at aliquam justo. Cras porta felis in metus pretium, quis accumsan sem luctus. Donec varius, lectus elementum fringilla sodales, urna nulla auctor nibh, eget pretium nisl tortor convallis turpis. Sed rutrum dui sed elit posuere iaculis. Etiam viverra non massa eget congue.\n\n"
                    "Nullam maximus ut tellus sit amet mollis. Phasellus non purus semper, blandit lacus eget, hendrerit enim. Aenean nisi justo, sollicitudin at ultrices sed, tincidunt vitae neque. Sed commodo dolor et ex tincidunt, et tincidunt justo fermentum. Vivamus a pretium ligula. Maecenas leo nisi, eleifend id lacus vitae, consequat egestas neque. Curabitur iaculis dignissim aliquet. Phasellus gravida id lectus vel eleifend. Sed scelerisque ipsum metus, ac tincidunt nisl finibus ut. Proin quis lorem enim.\n\n"
                    "Quisque posuere, neque quis pharetra gravida, diam libero fringilla orci, ac condimentum diam lectus vitae tortor. Nunc ante velit, volutpat a rhoncus sit amet, mattis vel elit. In quis ipsum odio. Duis id leo congue, molestie eros at, porta lorem. Pellentesque nec enim vel turpis condimentum pulvinar. Cras malesuada venenatis elit, vel scelerisque nisl porttitor a. Etiam posuere quam ac dui mollis malesuada. Proin vulputate, dolor ut pretium ullamcorper, turpis turpis iaculis ante, eget tincidunt lectus est sed est. Integer et mauris nec odio tempus finibus nec ac lectus. Ut in luctus nisi.\n\n"
                    "Proin sed lobortis ante. Ut eu nulla nec nisl congue fermentum. Proin interdum sollicitudin sapien. Nunc et enim ornare, efficitur libero sit amet, vehicula ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lectus odio, consectetur at auctor at, aliquam nec mauris. Integer eleifend augue orci, vitae suscipit odio fermentum quis. Curabitur vel interdum lectus. Quisque lacus ipsum, consectetur sed vestibulum a, tempus nec massa. Donec gravida tortor mauris, blandit mollis neque pellentesque sit amet. Mauris venenatis tellus dolor, id sollicitudin nibh ultricies eget. Pellentesque pharetra rhoncus venenatis. Nullam non eros faucibus, luctus sem vel, tempor tortor.\n\n"
                    "Etiam vitae leo odio. Pellentesque non viverra odio. Nulla finibus, ante ac rhoncus commodo, ligula odio euismod mi, sit amet blandit turpis ex sed purus. Integer cursus consequat purus. Pellentesque fringilla tincidunt quam id scelerisque. Nulla tempus libero sem, et bibendum risus semper dignissim. Sed consectetur lectus orci, id scelerisque sem facilisis et. Praesent ornare ut magna non volutpat. Phasellus porta porttitor lacus, et feugiat lacus porta eu. Nunc sed aliquet felis, id sollicitudin sem. Morbi eu interdum massa. Donec a leo venenatis, ornare arcu ornare, luctus nisl. Donec nec dui ac diam feugiat ornare eget ut sem.\n\n"
                    "Sed laoreet, eros eget consectetur ornare, mi tortor molestie magna, sed hendrerit magna lectus in felis. Vestibulum mollis luctus lacus, vitae pellentesque mi auctor et. Morbi pharetra tellus nec libero consequat lacinia. Donec pulvinar tempor libero, vel facilisis ligula dignissim feugiat. Integer gravida feugiat odio, ac posuere lacus posuere eget. Nam vel vulputate leo, sed rhoncus nibh. Ut ac lacus eu elit pretium dapibus. Duis nec pellentesque ante. Sed eget blandit magna, nec cursus nibh. Vivamus sit amet purus semper, accumsan est et, suscipit diam. Nullam semper, nulla et tempor venenatis, quam nisl molestie arcu, eget pharetra elit elit in dui.\n\n"
                    "Donec in hendrerit urna. Morbi vitae dui pulvinar, tincidunt mauris sit amet, elementum neque. Nulla arcu turpis, condimentum ut malesuada quis, gravida sit amet ex. Vestibulum porta justo vitae tortor mollis luctus. Ut nec placerat est. Maecenas gravida arcu pellentesque sodales porttitor. Vestibulum aliquet turpis risus, vitae mollis mi ornare vitae.",
                  style: TextStyle(
                      color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
