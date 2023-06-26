import 'package:flutter/material.dart';
import 'package:mobile_pos/src/helpers/const.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/shared_widgets/string_list_tile.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';

class LGASheet extends StatefulWidget {
  final String state;
  const LGASheet({super.key, required this.state});

  @override
  LGASheetState createState() => LGASheetState();
}

class LGASheetState extends State<LGASheet> {
  List<String> searchedLGA = [];
  List<String> lgaFromStore = [];
  String searchString = '';

  void searchPlace(String stateName) async {
    if (stateName.isNotEmpty) {
      searchedLGA.clear();
      for (var element in lgaFromStore) {
        if (element.toLowerCase().contains(stateName.toLowerCase())) {
          searchedLGA.add(element);
        }
      }

      setState(() {
        searchedLGA = searchedLGA;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      lgaFromStore = lgaList[widget.state]!.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .92,
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            height: double.infinity,
          ),
          Container(
              width: double.infinity,
              height: 55.0,
              color: const Color(0xFFF1F3F6),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select LGA',
                      style: headling1.copyWith(
                          fontSize: 18,
                          color: pluginTheme.primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:
                            Icon(Icons.close, color: pluginTheme.primaryColor))
                  ],
                ),
              )),
          Padding(
            padding:
                const EdgeInsets.only(top: 75, left: 16, right: 16, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFEFEFEF),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchString = value;
                      searchPlace(searchString);
                    });
                  },
                  style: subtitle.copyWith(fontSize: 16),
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Search LGA',
                      hintStyle:
                          subtitle2.copyWith(fontSize: 14, color: Colors.grey),
                      fillColor: const Color(0xFFEFEFEF),
                      filled: true,
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.only(left: 10, top: 10, bottom: 8)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: ListView.separated(
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return StringListTile(
                      title: (searchString.isNotEmpty)
                          ? searchedLGA[index]
                          : lgaFromStore[index],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 4,
                  ),
                  itemCount: (searchString.isNotEmpty)
                      ? searchedLGA.length
                      : lgaFromStore.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
