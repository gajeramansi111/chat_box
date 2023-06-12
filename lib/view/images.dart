import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';

class contacts_page extends StatefulWidget {
  const contacts_page({super.key});

  @override
  State<contacts_page> createState() => _contacts_pageState();
}

class _contacts_pageState extends State<contacts_page> {
  List<Contact> contacts = [];

  bool isLoading = true;

  @override
  void initState() {
    getContactPermission();
    super.initState();
  }

  void getContactPermission() async {
    if (await Permission.contacts.isGranted) {
      fetchContacts();
    } else {
      await Permission.contacts.request();
    }
  }

  void fetchContacts() async {
    contacts = await ContactsService.getContacts();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.black54,
                    ),
                    child: Text(
                      contacts[index].givenName![0],
                      style: const TextStyle(
                        fontSize: 23,
                        color: Colors.pink,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  title: Text(
                    contacts[index].givenName!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.cyanAccent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    contacts[index].phones![0].value!,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.brown,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  horizontalTitleGap: 12,
                );
              },
            ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:flutter_contacts/contact.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text("Contact List"),
//         ),
//         body: Container(
//           height: double.infinity,
//           child: FutureBuilder(
//             future: getContacts(),
//             builder: (context, AsyncSnapshot snapshot) {
//               if (snapshot.data == null) {
//                 return const Center(
//                   child:
//                       SizedBox(height: 50, child: CircularProgressIndicator()),
//                 );
//               }
//               return ListView.builder(
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (context, index) {
//                     Contact contact = snapshot.data[index];
//                     return Column(children: [
//                       ListTile(
//                         leading: const CircleAvatar(
//                           radius: 20,
//                           child: Icon(Icons.person),
//                         ),
//                         title: Text(contact.displayName),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(contact.phones[0].number),
//                             // Text(contact.emails[0]),
//                           ],
//                         ),
//                       ),
//                       const Divider()
//                     ]);
//                   });
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<List<Contact>> getContacts() async {
//     bool isGranted = await Permission.contacts.status.isGranted;
//     if (!isGranted) {
//       isGranted = await Permission.contacts.request().isGranted;
//     }
//     if (isGranted) {
//       return await FastContacts.allContacts;
//     }
//     return [];
//   }
// }
