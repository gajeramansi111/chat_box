import 'package:chat_box/view/serch.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utility/colors.dart';
import '../utility/icon_url.dart';
import '../utility/image_url.dart';
import '../utility/text_string.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
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
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Padding(
            padding: EdgeInsets.only(left: width * 0.04),
            child: InkWell(
              onTap: () {
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
              },
              child: Container(
                padding: const EdgeInsets.all(7),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.leadingBorder),
                ),
                child: SvgPicture.asset(IconUrl.serch_icon),
              ),
            ),
          ),
          title: const Text(TextString.contacts,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: width * 0.04),
              child: Container(
                  padding: const EdgeInsets.all(7),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.leadingBorder),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: SvgPicture.asset(IconUrl.userAadd))),
            ),
          ],
        ),
        body: Column(
          children: [
            Spacer(),
            Container(
              height: height / 1.28,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: ListTile(
                            leading: Container(
                              height: 40,
                              width: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                //borderRadius: BorderRadius.circular(6),
                                color: Colors.black54,
                              ),
                              child: Text(
                                contacts[index].givenName![0],
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: AppColors.bigText,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            title: Text(
                              contacts[index].givenName!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 18,
                                color: AppColors.bigText,
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
                          ),
                        );
                      },
                    ),
            ),
          ],
        ));
  }
}
