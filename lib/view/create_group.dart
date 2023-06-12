import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../componets/button.dart';
import '../componets/small_text.dart';
import '../utility/colors.dart';
import '../utility/image_url.dart';
import '../utility/text_string.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List invited = [
    ImageUrl.invite1,
    ImageUrl.invite2,
    ImageUrl.invite3,
    ImageUrl.invite4,
    ImageUrl.invite5,
    ImageUrl.invite5,
    ImageUrl.invite6,
  ];
  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_rounded)),
        title: Text(TextString.createGroup,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            const SmallText(
              text: TextString.groupescription,
              fontSize: 16,
              fontweight: FontWeight.w500,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const Text(
              TextString.makeGroup,
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.w500, height: 1.3),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Row(
              children: [
                Container(
                  height: height * 0.052,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff20A090).withOpacity(0.2)),
                  child: const Center(
                    child: Text(TextString.groupWork,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400)),
                  ),
                ),
                SizedBox(
                  width: width * 0.04,
                ),
                Container(
                  height: height * 0.052,
                  width: width * 0.42,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff20A090).withOpacity(0.2)),
                  child: const Center(
                    child: Text(TextString.teamRelation,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.035,
            ),
            const SmallText(
              text: TextString.groupAdmin,
              fontSize: 16,
              fontweight: FontWeight.w500,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            ListTile(
              leading: Container(
                height: height * 0.12,
                width: width * 0.12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange,
                  image: DecorationImage(
                    image: AssetImage(ImageUrl.groupAdmin),
                  ),
                ),
              ),
              title: const boldText(
                  text: TextString.rashidKhan,
                  fontSize: 16,
                  fontweight: FontWeight.w500),
              subtitle: const SmallText(
                  text: TextString.groupAdmin,
                  fontSize: 12,
                  fontweight: FontWeight.w400),
            ),
            SizedBox(
              height: height * 0.034,
            ),
            const SmallText(
              text: TextString.invitedMember,
              fontSize: 16,
              fontweight: FontWeight.w500,
            ),
            SizedBox(
              height: height * 0.023,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    // /   crossAxisSpacing: 3,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 70
                    // childAspectRatio: 1 / 1.5,
                    ),
                itemCount: 7,
                itemBuilder: (context, index) {
                  return index == 6
                      ? DottedBorder(
                          borderType: BorderType.Circle,
                          color: AppColors.dottedCon,
                          dashPattern: const [9, 5],
                          child: const Center(
                              child:
                                  Icon(Icons.add, color: AppColors.dottedCon)),
                        )
                      : Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.brown,
                                image: DecorationImage(
                                  image: AssetImage(
                                    invited[index],
                                  ),
                                ),
                              ),
                            ),
                            index == 0
                                ? SizedBox.shrink()
                                : Padding(
                                    padding: EdgeInsets.only(
                                        left: width * 0.16, top: height * 0.05),
                                    child: Container(
                                      height: height * 0.05,
                                      width: width * 0.05,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 2.5),
                                          // color: AppColors.smallCon,
                                          shape: BoxShape.circle),
                                      child: Container(
                                          height: height * 0.04,
                                          width: width * 0.04,
                                          decoration: const BoxDecoration(
                                              color: AppColors.smallCon,
                                              shape: BoxShape.circle),
                                          child: const Icon(Icons.add,
                                              size: 16,
                                              color: AppColors.bigText)),
                                    ),
                                  )
                          ],
                        );
                },
              ),
            ),
            Button(
              text: TextString.create,
              textColor: Colors.white,
              color: AppColors.send,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
