import 'package:blood_finder/app/constants/constants.dart';
import 'package:blood_finder/app/constants/theme_data.dart';
import 'package:blood_finder/app/utils/size_config.dart';
import 'package:blood_finder/app/widgets/app_drawer.dart';
import 'package:blood_finder/app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_NAME),
      ),
      drawer: AppDrawer(),
      endDrawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => controller.reset(),
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(Constants.defaultPadding),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(() {
                            return controller.ispostfetched.isFalse
                                ? CustomTextButton(
                                    label: "Fetch Posts",
                                    onPressed: () => controller.getAllPosts(),
                                  )
                                : CustomTextButton(
                                    label: "Add post",
                                    onPressed: () => controller.addPost(),
                                  );
                          }),
                        ],
                      ),
                      Obx(() {
                        return controller.isPostsLoading.isTrue
                            ? CircularProgressIndicator()
                            : controller.posts.isEmpty
                                ? Container()
                                : ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemCount: controller.posts?.length ?? 0,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: Themes.GREY,
                                          foregroundColor: Themes.WHITE,
                                          child: Text(
                                              "${controller.posts[index].id}"),
                                        ),
                                        title: Text(
                                            "${controller.posts[index].title}"),
                                      );
                                    },
                                  );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
