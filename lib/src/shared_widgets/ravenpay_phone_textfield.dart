// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:gap/gap.dart';

// class RoqquPhoneField extends StatefulWidget {
//   const RoqquPhoneField(
//       {Key key,
//       this.controller,
//       this.enabled = true,
//       this.autoFocus = false,
//       this.autofillHints,
//       this.inputAction,
//       this.focusNode,
//       this.maxLength,
//       this.labelText = 'Phone Number',
//       this.suffixIcon,
//       this.validator,
//       this.onTap,
//       this.inputFormatters,
//       this.onChanged,
//       this.readOnly = false,
//       this.onSaved,
//       @required this.onCountryChanged,
//       this.onReady,
//       this.allowCountryChange = true,
//       this.hintText = 'Enter phone number',
//       this.initialCountry})
//       : super(key: key);
//   final TextEditingController controller;
//   final TextInputAction inputAction;
//   final FocusNode focusNode;
//   final int maxLength;
//   final bool enabled;
//   final bool autoFocus;
//   final List<String> autofillHints;
//   final List<TextInputFormatter> inputFormatters;
//   final String labelText;
//   final String hintText;
//   final Widget suffixIcon;
//   final void Function() onTap;
//   final bool readOnly;
//   final String Function(String) validator;
//   final void Function(String) onChanged;
//   final void Function(String) onSaved;
//   final void Function(RoqquCountry) onCountryChanged;
//   final void Function(RoqquCountry) onReady;
//   final bool allowCountryChange;

//   final RoqquCountry initialCountry;

//   @override
//   _RoqquPhoneFieldState createState() => _RoqquPhoneFieldState();
// }

// class _RoqquPhoneFieldState extends State<RoqquPhoneField> {
//   RoqquCountry _selectedCountry;

//   @override
//   void initState() {
//     super.initState();
//     _selectedCountry = widget.initialCountry ??
//         RoqquCountry(
//           isSupported: true,
//           isoCode: 'NG',
//           name: 'Nigeria',
//           phoneCode: '+234',
//           emoji: '\u{1F1F3}\u{1F1EC}',
//         );
//     if (widget.onReady != null) widget.onReady(_selectedCountry);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         if (widget.labelText.isNotEmpty)
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 4),
//                 child: Text(
//                   widget.labelText,
//                   style: RoqquTextStyles.applyB2(context).copyWith(
//                       fontWeight: FontWeight.w500,
//                       // fontSize: 12,
//                       letterSpacing: .5),
//                 ),
//               ),
//             ],
//           ),
//         Gap(8),
//         TextFormField(
//           contextMenuBuilder: (context, editableTextState) {
//             final List<ContextMenuButtonItem> buttonItems =
//                 editableTextState.contextMenuButtonItems;

//             return RoqquContextMenu(
//                 anchor: editableTextState.contextMenuAnchors.primaryAnchor,
//                 children: buttonItems
//                     .map((e) => TextSelectionToolbarTextButton(
//                           padding: EdgeInsets.symmetric(horizontal: 12),
//                           onPressed: e.onPressed,
//                           child: Text(
//                             e.label ?? (toBeginningOfSentenceCase(e.type.name)),
//                             style:
//                                 RoqquTextStyles.applyH3(context, fontSize: 12),
//                           ),
//                         ))
//                     .toList());
//           },
//           validator: widget.validator,
//           cursorHeight: 18,
//           cursorColor: RoqquColors.roqquGrey50.withOpacity(.5),
//           onChanged: widget.onChanged,
//           readOnly: widget.readOnly,
//           onTap: widget.onTap,
//           minLines: 1,
//           inputFormatters: widget.inputFormatters,
//           style: RoqquTextStyles.applyB2(
//             context,
//             fontSize: 16,
//             color: ThemeUtil.isDark(context) ? kWhite : kDarkGrey,
//           ),
//           keyboardType: TextInputType.number,
//           enabled: widget.enabled,
//           maxLength: widget.maxLength,
//           maxLines: 1,
//           controller: widget.controller,
//           textInputAction: widget.inputAction,
//           decoration: InputDecoration(
//             hintStyle: RoqquTextStyles.applyB2(context).copyWith(
//               color: ThemeUtil.isDark(context)
//                   ? RoqquColors.roqquWhite.withOpacity(.4)
//                   : RoqquColors.roqquDarkGrey.withOpacity(.4),
//             ),
//             prefixIcon: InkWell(
//               onTap: () async {
//                 if (!widget.allowCountryChange) {
//                   return;
//                 }
//                 showRoqquBottomSheet(context, child: CountryCodePickerList(
//                   onSelected: ((country) {
//                     if (country != null) {
//                       setState(() {
//                         _selectedCountry = country;
//                         widget.onCountryChanged(country);
//                       });
//                     }
//                   }),
//                 ));
//               },
//               child: Center(
//                 child: Container(
//                   height: 35,
//                   decoration: BoxDecoration(
//                       border: Border(
//                           right: BorderSide(color: RoqquColors.roqquGrey50))),
//                   child: Center(child: Text(_selectedCountry.phoneCode)),
//                 ),
//               ),
//             ),
//             prefixText: '  ',
//             floatingLabelBehavior: FloatingLabelBehavior.never,
//             suffixIcon: widget.suffixIcon,
//             suffixIconConstraints: const BoxConstraints(
//               minWidth: 45,
//               minHeight: 45,
//               maxHeight: 50,
//               maxWidth: 50,
//             ),
//             prefixIconConstraints: const BoxConstraints(
//               minWidth: 40,
//               minHeight: 40,
//               maxHeight: 50,
//               maxWidth: 60,
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             labelStyle: RoqquTextStyles.getTextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 14,
//                 color: RoqquColors.roqquWhite,
//                 letterSpacing: .5),
//             hintText: widget.hintText,
//             errorStyle: RoqquTextStyles.applyB2(context,
//                 color: Colors.red, fontSize: 11.5),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(
//                   color: RoqquColors.textBorderColor(context), width: .8),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(
//                   color: RoqquColors.roqquGrey50.withOpacity(.4), width: .8),
//             ),
//             disabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(
//                   color: RoqquColors.roqquGrey50.withOpacity(.2), width: .8),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.red[300], width: .8),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.red[300], width: .8),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class RoqquCountry {
//   RoqquCountry({
//     this.emoji,
//     this.name,
//     this.isSupported,
//     this.isoCode,
//     this.phoneCode,
//   });
//   factory RoqquCountry.fromCountry(Country country) {
//     return RoqquCountry(
//       emoji: kFlagsEmoji[country.isoCode],
//       name: country.name,
//       phoneCode: country.dialCode,
//       isoCode: country.isoCode,
//       isSupported: supportedCountriesAlpha2.contains(country.isoCode),
//     );
//   }

//   String emoji;
//   String name;
//   String phoneCode;
//   String isoCode;
//   bool isSupported;

//   @override
//   String toString() {
//     return '[$name, $isoCode, $phoneCode, $isSupported]';
//   }
// }

// class CountryCodePickerList extends StatefulWidget {
//   const CountryCodePickerList({Key key, this.onSelected}) : super(key: key);

//   final void Function(RoqquCountry) onSelected;

//   @override
//   _CountryCodePickerListState createState() => _CountryCodePickerListState();
// }

// class _CountryCodePickerListState extends State<CountryCodePickerList> {
//   TextEditingController _searchController;
//   List<RoqquCountry> _searchResults;
//   List<RoqquCountry> _allCountries;

//   @override
//   void initState() {
//     super.initState();
//     _searchController = TextEditingController();
//     fetchCountries();
//   }

//   dynamic fetchCountries() async {
//     final list = Countries.list
//         .map((e) => RoqquCountry.fromCountry(e))
//         .toList()
//         // .where((e) => kFlagsEmoji.keys.contains(e.isoCode))
//         .where((e) => kFlagsEmoji.containsKey(e.isoCode))
//         .toList()
//       ..sort(
//         (a, b) => (a.isSupported == true ? 0 : 1)
//             .compareTo(b.isSupported == true ? 0 : 1),
//       );

//     final supported = list.where((element) => element.isSupported).toList()
//       ..sort(
//         (a, b) => a.name.compareTo(b.name),
//       );

//     final others = list.where((element) => !element.isSupported).toList()
//       ..sort(
//         (a, b) => a.name.compareTo(b.name),
//       );

//     _searchResults = _allCountries = [...supported, ...others];
//     setState(() {});
//   }

//   void searchList(String value) {
//     _searchResults = _allCountries
//         .where((e) => e.name.toLowerCase().contains(value.toLowerCase()))
//         .toList();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 24) +
//           EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//       child: SizedBox(
//         height: size.height * .7,
//         child: _searchResults == null
//             ? Center(
//                 child: RoqquLoadingIndicator(
//                   size: 20,
//                   color: RoqquColors.roqquPrimaryBlue,
//                 ),
//               )
//             : Column(
//                 children: [
//                   Gap(
//                     16,
//                   ),
//                   RoqquBottomSheetCapsule(),
//                   Gap(
//                     16,
//                   ),
//                   RoqquTextField(
//                       hintText: 'const.search_country'.tr(),
//                       autoFocus: true,
//                       controller: _searchController,
//                       onChanged: searchList,
//                       inputType: TextInputType.text),
//                   Gap(
//                     20,
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: _searchResults.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         final item = _searchResults[index];
//                         return CountryItem(
//                           item: item,
//                           onSelected: widget.onSelected,
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//       ),
//     );
//   }
// }

// class CountryItem extends StatelessWidget {
//   const CountryItem({Key key, this.item, this.onSelected}) : super(key: key);
//   final RoqquCountry item;
//   final Function(RoqquCountry) onSelected;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (item.isSupported == true) {
//           if (onSelected != null) {
//             onSelected.call(item);
//             Navigator.of(context).pop();
//           }
//         }
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 12),
//         decoration: BoxDecoration(
//             border: Border(
//                 bottom: BorderSide(color: RoqquColors.borderColor(context)))),
//         margin: EdgeInsets.only(bottom: 8),
//         child: Row(
//           children: [
//             Text(
//               item.emoji,
//               style: RoqquTextStyles.getTextStyle(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 22,
//               ),
//             ),
//             Gap(6),
//             Expanded(
//               child: Text(
//                 item.name,
//                 style: RoqquTextStyles.applyB2(context, fontSize: 14),
//               ),
//             ),
//             if (item.isSupported == true)
//               const SizedBox()
//             else
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Icon(
//                       Icons.lock_outlined,
//                       size: 16,
//                       color: RoqquColors.roqquLightGrey.withOpacity(.5),
//                     )
//                   ],
//                 ),
//               )
//           ],
//         ),
//       ),
//     );
//   }
// }
