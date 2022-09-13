import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokemon/screens/home_page.dart';
import 'package:pokemon/services/get_pokemon_service.dart';
import 'package:pokemon/utils/svg.dart';
import '../models/pokemon_model.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextEditingController controller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan,
          resizeToAvoidBottomInset: false,
          body: FutureBuilder(
            future: GetPokemonModel.getData(),
            builder: (context, AsyncSnapshot<PokemonModel> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator.adaptive(backgroundColor: Colors.white,),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error'),
                );
              } else {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/pokemon.png'))),
                      width: width * .6,
                      height: height * .1,
                      margin: EdgeInsets.only(top: height * .06),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: 350,
                      height: 50,
                      child: Row(children: [
                        InkWell(
                          child: SizedBox(width: 20, height: 20, child: SvgPicture.asset(MySvg.svg2)),
                          onTap: () {
                            list.clear();
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(width: 50),
                        SizedBox(
                            height: 45,
                            width: 220,
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                hintText: 'Buscar Pakemon',
                                contentPadding: EdgeInsets.only(left: width * .12),
                              ),
                            )),
                        SizedBox(width: 35),
                        SvgPicture.asset(MySvg.svg1)
                      ]),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 230,
                      width: 420,
                      child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: ((context, index) {
                            return SizedBox(
                              width: 380,
                              height: 220,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 30, top: 20),
                                    child: Text(
                                      '#' + list[2],
                                      style: TextStyle(color: Color(0xFFFFfb64fe), fontSize: 22, fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 300, top: 20),
                                    child: Text(
                                      list[1],
                                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(color: Color(0xFFfb64fe), borderRadius: BorderRadius.circular(20)),
                                    width: 350,
                                    height: 160,
                                    margin: EdgeInsets.only(left: 30, top: 60),
                                  ),
                                  Container(
                                    decoration:
                                        BoxDecoration(image: DecorationImage(image: CachedNetworkImageProvider(list[0]), fit: BoxFit.contain)),
                                    width: 270,
                                    height: 200,
                                    margin: EdgeInsets.only(left: 70),
                                  )
                                ],
                              ),
                            );
                          })),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 30),
                        SizedBox(
                          width: 150,
                          height: 40,
                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFfba806))),
                            child: Text(
                              'Fuego',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 50),
                        SizedBox(
                          width: 150,
                          height: 40,
                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFF78b4ec))),
                            child: Text(
                              'Volador',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFfb64fe), borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))),
                      width: 415,
                      height: 260,
                      child: Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Altura', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
                              Text('Categoria', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
                              Text('Debilidad', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white))
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(list[3], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromARGB(155, 255, 255, 255))),
                              Text(list[4], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromARGB(172, 255, 255, 255))),
                              Row(
                                children: [
                                  Container(decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle), width: 20, height: 20),
                                  SizedBox(width: 7),
                                  Text('Agua',
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromARGB(179, 255, 255, 255))),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 265),
                              Container(decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle), width: 20, height: 20),
                              SizedBox(width: 7),
                              Text('Electricid',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromARGB(179, 255, 255, 255))),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Peso', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
                              Text('Sexo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
                              Row(
                                children: [
                                  Container(decoration: BoxDecoration(color: Colors.amber, shape: BoxShape.circle), width: 20, height: 20),
                                  SizedBox(width: 7),
                                  Text('Roca',
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromARGB(179, 255, 255, 255))),
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(list[5], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromARGB(155, 255, 255, 255))),
                              Row(
                                children: [SvgPicture.asset(MySvg.female), SvgPicture.asset(MySvg.male)],
                              ),
                              Text('                      ')
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Habilidades', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
                                  SizedBox(height: 5),
                                  Text(
                                    'Mar Llmas',
                                    style: TextStyle(color: Color.fromARGB(183, 255, 255, 255), fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              SizedBox(width: 30),
                              Container(
                                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/photo.png'))),
                                width: 225,
                                height: 93,
                              )
                            ],
                          ),
                        ]),
                      ),
                    )
                  ],
                );
              }
            },
          )),
    );
  }
}

List searched = [];
