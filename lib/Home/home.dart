import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  final systemColor =
      const SystemUiOverlayStyle(statusBarColor: Color(0xFFf7f7f7));
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(systemColor);
    return Scaffold(
      backgroundColor: const Color(0xFFf7f7f7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50.0),
            const Center(
              child: Text("BMI - Calculator",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 22)),
            ),
            const SizedBox(height: 10.0),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[300]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your BMI",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[700]),
                      ),
                       Visibility(
                         visible: _textResult.isNotEmpty,
                         child: Text(
                          _textResult,
                          style:const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500,color: Colors.black),
                      ),
                       ),
                    ],
                  ),
                  Text(
                    _bmiResult.toStringAsFixed(2),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900],
                        fontSize: 30),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 350,
              margin: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    margin: const EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                    ),
                    child: Image.asset("assets/fio.png",fit: BoxFit.contain,),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width *.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300]),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _heightController,
                      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 50),
                      textAlign: TextAlign.center,
                      decoration:const InputDecoration(
                        hintText: "H",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintStyle: TextStyle(
                            fontSize: 50.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width * .5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300]),
                    child:  TextField(
                      controller: _weightController,
                      textAlign: TextAlign.center,
                      style:const TextStyle(fontWeight: FontWeight.w700, fontSize: 50),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "W",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintStyle: TextStyle(
                            fontSize: 50.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 70,
              margin: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300]),
              child: TextButton(
                onPressed: () {
                  double h = double.parse(_heightController.text) / 100;
                  double w = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = w / (h * h);
                    if (_bmiResult > 25 ) {
                      _textResult = "You 'are under weight";
                    } else if (_bmiResult >= 18 && _bmiResult <= 25){
                      _textResult = "You have normal Weight ";
                    } else {
                      _textResult = "You'are under weight";
                    }
                  });
                },
                child: Text(
                  "Calculate",
                  style: TextStyle(fontSize: 20, color: Colors.grey[900]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget leftLine() {
    return  Container(
      height: 40,
      width: 100,
      decoration:const BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30)
          ),
          color: Colors.amberAccent
      ),
    );
  }

}
