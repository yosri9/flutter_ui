

import 'package:flutterui/chat/chat1/conversion.dart';
import 'package:flutterui/chat/chat1/message.dart';
import 'package:flutterui/chat/chat1/user.dart';

class MessageProvider{

  static Conversion getConversation(){
    User user1 = User(
        name: 'Yosri',
        avatar: 'assets/shared/yosri.jpg',
        phone: '+216 55 498 251'
    );
    User user2 = User(
        name: 'Elise Remi',
        avatar: 'assets/shared/yosri.jpg',
        phone: '+216 55 498 251'
    );
    return       Conversion(
        users: [
          user1,
          user2

        ],
        messages: [
          Message(
              sender: user1,
              receiver: user2,
              body: "hi how are you",
              dateTime: '11.95'
          ),
          Message(
              sender: user2,
              receiver: user1,
              body: "hi how are you",
              dateTime: '11.95'
          ),
          Message(
              sender: user1,
              receiver: user2,
              body: "hi how are you",
              dateTime: '11.95'
          ),
          Message(
              sender: user2,
              receiver: user1,
              body: "hi how are you",
              dateTime: '11.95'
          ),
          Message(
              sender: user1,
              receiver: user2,
              body: "hi how are you",
              dateTime: '11.95'
          ),

        ]
    );

  }
  static List<Conversion> getConversations(){
    User user1 = User(
        name: 'Yosri',
        avatar: 'assets/shared/yosri.jpg',
        phone: '+216 55 498 251'
    );
    User user2 = User(
        name: 'Elise Remi',
        avatar: 'assets/sahred/yosri.jpg',
        phone: '+216 55 498 251'
    );
    return [
      Conversion(
       users: [
         user1,
         user2

       ],
        messages: [
          Message(
            sender: user1,
            receiver: user2,
            body: "hi how are you",
            dateTime: '11.95'
          ),
          Message(
              sender: user1,
              receiver: user2,
              body: "hi how are you",
              dateTime: '11.95'
          ),
          Message(
              sender: user1,
              receiver: user2,
              body: "hi how are you",
              dateTime: '11.95'
          ),
          Message(
              sender: user1,
              receiver: user2,
              body: "hi how are you",
              dateTime: '11.95'
          ),
          Message(
              sender: user1,
              receiver: user2,
              body: "hi how are you",
              dateTime: '11.95'
          ),

        ]
      ),
      Conversion(
          users: [
            user1,
            user2

          ],
          messages: [
            Message(
                sender: user2,
                receiver: user1,
                body: "hi how are you",
                dateTime: '11.95'
            ),
            Message(
                sender: user1,
                receiver: user2,
                body: "hi how are you",
                dateTime: '11.95'
            ),
            Message(
                sender: user1,
                receiver: user2,
                body: "hi how are you",
                dateTime: '11.95'
            ),
            Message(
                sender: user1,
                receiver: user2,
                body: "hi how are you",
                dateTime: '11.95'
            ),
            Message(
                sender: user1,
                receiver: user2,
                body: "hi how are you",
                dateTime: '11.95'
            ),

          ]
      ),
      Conversion(
          users: [
            user1,
            user2

          ],
          messages: [
            Message(
                sender: user1,
                receiver: user2,
                body: "hi how are you",
                dateTime: '11.95'
            ),
            Message(
                sender: user1,
                receiver: user2,
                body: "hi how are you",
                dateTime: '11.95'
            ),
            Message(
                sender: user1,
                receiver: user2,
                body: "hi how are you",
                dateTime: '11.95'
            ),
            Message(
                sender: user1,
                receiver: user2,
                body: "hi how are you",
                dateTime: '11.95'
            ),
            Message(
                sender: user1,
                receiver: user2,
                body: "hi how are you",
                dateTime: '11.95'
            ),

          ]
      ),
      Conversion(
          users: [
            user1,
            user2

          ],
          messages: [
            Message(
                sender: user1,
                receiver: user2,
                body: "hi how are you",
                dateTime: '11.95'
            ),
            Message(
                sender: user1,
                receiver: user2,
                body: "hi how are you",
                dateTime: '11.95'
            ),
            Message(
                sender: user1,
                receiver: user2,
                body: "hi how are you",
                dateTime: '11.95'
            ),
            Message(
                sender: user1,
                receiver: user2,
                body: "hi how are you",
                dateTime: '11.95'
            ),
            Message(
                sender: user1,
                receiver: user2,
                body: "hi how are you",
                dateTime: '11.95'
            ),

          ]
      ),
      Conversion(
          users: [
            user1,
            user2

          ],
          messages: [
            Message(
                sender: user1,
                receiver: user2,
                body: "hi how are you",
                dateTime: '11.95'
            ),
            Message(
                sender: user1,
                receiver: user2,
                body: "hi how are you",
                dateTime: '11.95'
            ),
            Message(
                sender: user1,
                receiver: user2,
                body: "hi how are you",
                dateTime: '11.95'
            ),
            Message(
                sender: user1,
                receiver: user2,
                body: "hi how are you",
                dateTime: '11.95'
            ),
            Message(
                sender: user1,
                receiver: user2,
                body: "hi how are you",
                dateTime: '11.95'
            ),

          ]
      ),


    ];
  }

}