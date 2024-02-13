// ignore_for_file: unnecessary_brace_in_string_interps, sort_child_properties_last, avoid_unnecessary_containers, avoid_print

import 'dart:js_util';
import 'package:task1/screens/sign.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String _selectedLang = "Select the Language";
  String _selectedCode = "Select the code";

  void _onChangeLang(String? newLang) {
    setState(() {
      _selectedLang = newLang!;
    });
  }

  void _onChangeCode(String? newCode) {
    setState(() {
      _selectedCode = newCode!;
    });
  }

  Widget langDropdown(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(200, 30, 300, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Language:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    const Spacer(),
                    const Text("Gmail display language: ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                    Container(
                      width: 200,
                      height: 35,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 205, 203, 203),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Center(
                        child: DropdownButton<String>(
                          value: _selectedLang,
                          onChanged: _onChangeLang,
                          items: <String>[
                            'Select the Language',
                            'English',
                            'Spanish',
                            'French',
                            'German',
                            'Italian',
                            'Chinese',
                            'Japanese',
                            'Russian',
                            'Portuguese',
                            'Arabic',
                            'Korean',
                          ].map<DropdownMenuItem<String>>((String val) {
                            return DropdownMenuItem<String>(
                              child: Text(val),
                              value: val,
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Text("Phone Number:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    const Spacer(),
                    const Spacer(),
                    const Text("Default country code:",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                    Container(
                      width: 200,
                      height: 35,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 205, 203, 203),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Center(
                        child: DropdownButton<String>(
                          value: _selectedCode,
                          onChanged: _onChangeCode,
                          items: <String>[
                            'Select the code',
                            'Afghanista +93',
                            'Albania +355',
                            'AmericanSamoa +1-684',
                            'Argentina +54',
                            'Australia	+61',
                            'China	+86',
                            'Egypt	+20',
                            'Germany	+49',
                            'India	+91',
                            'Japan	+81',
                            'Mexico	+52',
                            'Morocco	+212',
                            'Nepal	+977',
                            'Portugal	+351',
                          ].map<DropdownMenuItem<String>>((String val) {
                            return DropdownMenuItem<String>(
                              child: Text(val),
                              value: val,
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _setsty = 'Choose your style';

  void _onchangestyle(String? newsty) {
    setState(() {
      if (newsty != null) {
        _setsty = newsty;
      }
    });
  }

  String _setsize = 'Medium';

  void _onchangesize(String? newsize) {
    setState(() {
      if (newsize != null) {
        _setsize = newsize;
      }
    });
  }

  Color _selectedColor = Colors.black;

  void _onColorSelected(Color? color) {
    setState(() {
      _selectedColor = color!;
    });
  }

  Widget colorPickerDropdown(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Color>(
          value: _selectedColor,
          onChanged: _onColorSelected,
          items: <Color>[
            Colors.red,
            Colors.green,
            Colors.blue,
            Colors.yellow,
            Colors.orange,
            Colors.purple,
            Colors.pink,
            Colors.teal,
            Colors.brown,
            Colors.grey,
            Colors.black,
            Colors.white,
            Colors.amber,
            Colors.deepPurple,
            Colors.lightGreen,
            Colors.cyan,
            Colors.lime,
          ].map<DropdownMenuItem<Color>>((Color color) {
            return DropdownMenuItem<Color>(
              value: color,
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    color: color,
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  List<Widget> inUseStars = [];
  List<Widget> notInUseStars = [];

  @override
  void initState() {
    super.initState();
    notInUseStars.clear();
    for (int i = 0; i < 4; i++) {
      notInUseStars.add(buildStar(i));
    }
  }

  Widget _buildStarWidget() {
    return const Icon(Icons.star, color: Colors.yellow, size: 30);
  }

  Widget buildStar(int index) {
    return Draggable(
      data: index,
      child: _buildStarWidget(),
      feedback: _buildStarWidget(),
      childWhenDragging: const SizedBox.shrink(),
    );
  }

  Widget textStyleWidget(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(200, 0, 300, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Row(
                    children: [
                      const Text("Default text style:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3))
                            ]),
                        child: Row(
                          children: [
                            DropdownButton(
                              onChanged: _onchangestyle,
                              value: _setsty,
                              items: <String>[
                                'sans-serif',
                                'Verdana',
                                'poppins',
                                'nunito',
                                'roboto',
                                'Choose your style'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList(),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            DropdownButton<String>(
                              onChanged: _onchangesize,
                              value: _setsize,
                              items: <String>['Large', 'Medium', 'Small']
                                  .map<DropdownMenuItem<String>>((String val) {
                                return DropdownMenuItem<String>(
                                  child: Text(val),
                                  value: val,
                                );
                              }).toList(),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            colorPickerDropdown(context),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.text_format)),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  String style = "sans-serif";

  void _onchangesty(String? newsty) {
    setState(() {
      style = newsty!;
    });
  }

  Widget sign() {
    return Container(
      child: DropdownButton<String>(
          value: style,
          onChanged: _onchangesty,
          items: ['sans-serif', 'Verdana', 'Choose your style']
              .map<DropdownMenuItem<String>>((String val) {
            return DropdownMenuItem(
              child: Text(val),
              value: val,
            );
          }).toList()),
    );
  }

  String signaturee = "No Signature";

  Widget wid() {
    return Row(
      children: [
        Column(
          children: [
            const Text("Signature defaults"),
            const Text("FOR NEW EMAILS USE"),
            DropdownButton<String>(
              items: ['No Signature', 'Gokulan'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  signaturee = newValue!;
                });
              },
              value: signaturee,
            ),
          ],
        )
      ],
    );
  }

  Widget wid1() {
    return Row(
      children: [
        Column(
          children: [
            const Text("ON REPLY/FORWARD USE"),
            DropdownButton<String>(
              items: ['No Signature', 'Gokulan', 'Sign1', 'Sign2']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  signaturee = newValue!;
                });
              },
              value: signaturee,
            ),
          ],
        )
      ],
    );
  }

  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('All Settings'),
          backgroundColor: const Color.fromARGB(255, 239, 244, 245),
        ),
        backgroundColor: const Color.fromARGB(255, 224, 224, 224),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              langDropdown(context),
              const Divider(),
              const SizedBox(
                width: 20,
              ),
              textStyleWidget(context),
              const SizedBox(height: 10),
              const Divider(),
              const Padding(
                padding: EdgeInsets.fromLTRB(200, 40, 0, 0),
                child: Text("Stars:",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 420),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text("In Use :",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                        ...inUseStars
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 300),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text("Not in Use:",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                          ...notInUseStars
                              .map((star) => Draggable(
                                    data: notInUseStars.indexOf(star),
                                    child: star,
                                    feedback: star,
                                    childWhenDragging: const SizedBox.shrink(),
                                  ))
                              .toList()
                        ]),
                  )
                ],
              ),
              DragTarget<int>(
                onAccept: (int starindex) {
                  print('onAccept triggered with starindex: $starindex');
                  setState(() {
                    notInUseStars.removeAt(starindex);
                    inUseStars.add(buildStar(starindex));
                    print("star added successfully ${starindex}");
                  });
                },
                builder: (context, candidatedata, rejecteddata) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: inUseStars.map((star) {
                        return Draggable<int>(
                          data: inUseStars.indexOf(star),
                          child: star,
                          feedback: star,
                          childWhenDragging: Container(),
                        );
                      }).toList());
                },
              ),
              const Divider(),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                width: 30,
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 300,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 200),
                          child: Text("Signature:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 380),
                          child: signature(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 1, right: 270, top: 30),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(children: [
                            sign(),
                            const Text('|'),
                            const SizedBox(
                              width: 7,
                            ),
                            DropdownButton<String>(
                              onChanged: _onchangesize,
                              value: _setsize,
                              items: <String>['Large', 'Medium', 'Small']
                                  .map<DropdownMenuItem<String>>((String val) {
                                return DropdownMenuItem<String>(
                                  child: Text(val),
                                  value: val,
                                );
                              }).toList(),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.format_bold)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.format_italic)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.format_underline)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.text_format)),
                                  const Text('|'),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.link)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.image)),
                                  const Text('|'),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 500),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          wid(),
                          const SizedBox(
                            width: 150,
                          ),
                          wid1(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 600),
                        child: Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value ?? false;
                            });
                          },
                        ),
                      ),
                      const Text(
                        'Only send a response to people in my Contacts',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider()
            ],
          ),
        ));
  }
}
