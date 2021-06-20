import 'package:flutter_base_project/app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatelessWidget {
  final Function(PickedFile) onImageSelected;
  final BuildContext context;
  final String? label;

  CustomImagePicker({
    required this.onImageSelected,
    required this.context,
    this.label,
  });

  _imgFromCamera() async {
    PickedFile? image = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) onImageSelected(image);
  }

  _imgFromGallery() async {
    PickedFile? image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);
    if (image != null) onImageSelected(image);
  }

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
        label: "Image Picker", onPressed: () => showbottomModal());
    // return label != null
    //     ? ElevatedButton.icon(
    //         onPressed: showbottomModal,
    //         icon: Icon(Icons.ac_unit),
    //         label: Text(""),
    //       )
    //     : ElevatedButton.icon(
    //         onPressed: showbottomModal,
    //         icon: Icon(Icons.ac_unit),
    //         label: Text(""),
    //       );
  }

  showbottomModal() {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.pop(context);
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
