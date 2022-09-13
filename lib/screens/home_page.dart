import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/screens/info_page.dart';
import 'package:pokemon/services/get_pokemon_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan,
        resizeToAvoidBottomInset: false,
        body: FutureBuilder(
          future: GetPokemonModel.getData(),
          builder: (context, AsyncSnapshot<PokemonModel> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator.adaptive(backgroundColor: Colors.white,));
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error'),
              );
            } else {
              return Padding(
                padding: EdgeInsets.only(left: 25, right: 0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/pokemon.png'))),
                          width: width * .6,
                          height: height * .1,
                          margin: EdgeInsets.only(top: height * .06),
                        ),
                        SizedBox(height: height * .039),
                        Padding(
                          padding: EdgeInsets.only(left: width * .15, right: width * .15),
                          child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: width * .2),
                                hintText: 'Buscar Pokemon',
                                constraints: BoxConstraints(maxHeight: height * .05),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                        height: 567,
                        child: GridView.builder(
                            itemCount: snapshot.data!.pokemon!.length,
                            physics: BouncingScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(color: Color(0xFFfa62fd), borderRadius: BorderRadius.circular(20)),
                                      width: 165,
                                      height: 115,
                                      margin: EdgeInsets.only(top: 70),
                                    ),
                                    Positioned(
                                        left: 25, bottom: 50, child: CachedNetworkImage(imageUrl: snapshot.data!.pokemon![index].img.toString())),
                                    Padding(
                                      padding: EdgeInsets.only(top: 140, left: 15),
                                      child: Container(
                                        decoration: BoxDecoration(color: Color(0xFF676767), borderRadius: BorderRadius.circular(20)),
                                        width: 135,
                                        height: 30,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(width: 0),
                                            Text(
                                              '#' + snapshot.data!.pokemon![index].num.toString(),
                                              style: TextStyle(fontSize: 14, color: Color(0xFFfa62fd), fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              snapshot.data!.pokemon![index].name.toString(),
                                              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(width: 5)
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {
                                  list.add(snapshot.data!.pokemon![index].img.toString());
                                  list.add(snapshot.data!.pokemon![index].name.toString());
                                  list.add(snapshot.data!.pokemon![index].num.toString());
                                  list.add(snapshot.data!.pokemon![index].height.toString());
                                  list.add(snapshot.data!.pokemon![index].candy.toString());
                                  list.add(snapshot.data!.pokemon![index].weight.toString());
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage()));
                                },
                              );
                            }))
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

List list = [];