import 'package:flutter/material.dart';
import '../../../../core/models/app/file_model.dart';
import '../../../../core/models/response/transaction_model.dart';
import '../../../theme/theme.dart';
import '../../../utils/color.dart';
import '../../../utils/icon_extension_file.dart';
import 'package:path/path.dart' as p;

class DocumentItemPreview extends StatelessWidget {
  const DocumentItemPreview({
    Key? key,
    required this.listFile,
    required this.tran,
    required this.onCallback,
  }) : super(key: key);
  final TransactionModel tran;
  final List<FileModel> listFile;
  final ValueChanged<FileModel> onCallback;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      primary: false,
      itemCount: listFile.length,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) {
        return const Divider(height: .0);
      },
      itemBuilder: (BuildContext context, int index) {
        final file = listFile[index];
        // ignore: unnecessary_null_comparison
        if (file.name == null) return Container();
        final extension = p.extension(file.name).trim();
        return InkWell(
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 26,
                      height: 26,
                      child: ExtensionTypeIcon.extensionTypeIcon(extension),
                    ),
                    SizedBox(height: 4),
                    Text(
                      file.size,
                      style: mainTheme.textTheme.bodySmall!
                          .copyWith(fontSize: 11.5),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(right: 8)),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      file.name,
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: HexColor("#0D75D6")),
                      textAlign: TextAlign.start,
                    ),
                  ],
                )),
                IconButton(
                  iconSize: 20.0,
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.blue,
                  ),
                  onPressed: extension != null ? () => onCallback(file) : null,
                ),
              ],
            ),
          ),
          onTap: () => onCallback(file),
        );
      },
      padding: const EdgeInsets.only(bottom: 10, top: 10),
    );
  }
}
