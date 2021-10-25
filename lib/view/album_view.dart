import 'package:flutter/material.dart';
import 'package:tech_test/%20model/album_model.dart';
import 'package:tech_test/view/detail_view.dart';
import 'package:tech_test/viewmodel/album_vm.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  bool searching = false;
  bool loading = false;
  String lastSearch = "";
  List<Album> searchResults = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Ryan McManus Tech Test',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 60,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: Colors.black))),
              child: Center(
                child: TextFormField(
                  autofocus: true,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    fillColor: Colors.black,
                    filled: false,
                    border: InputBorder.none,
                    hintText: 'e.g The Low End Theory',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  onChanged: (val) async {
                    if(val != lastSearch) {
                    setState(() {
                      loading = true;
                    });
                    searchResults = [];
                    searching = true;

                      searchResults = await AlbumViewModel().fetchAlbums(val);

                    setState(() {
                      loading = false;
                    });} else {
                      setState(() {
                        searching = false;
                      searchResults = [];
                      });
                    }


                  },
                ),
              ),
            ),
            Expanded(
                child: loading
                    ? const Center(child: CircularProgressIndicator())
                    : searchResults.isNotEmpty
                        ? Scrollbar(
                            child: ListView.builder(
                                physics: const ScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: searchResults.length,
                                itemBuilder: (BuildContext ctxt, int index) {
                                  String? url =
                                      searchResults[index].image!.first.text;
                                  return Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey, width: 0))),
                                    child: ListTile(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailView(
                                                album: searchResults[index])),
                                      ),
                                      leading: CircleAvatar(
                                        radius: 17,
                                        child: url != "" ?ClipOval(
                                          child:  Image(
                                            image: NetworkImage(url!),
                                            fit: BoxFit.fill,
                                          ),
                                        ): const Icon(Icons.music_note_sharp),
                                      ),
                                      trailing:
                                          const Icon(Icons.arrow_forward_ios),
                                      title: Text(
                                          searchResults[index].name.toString()),
                                      subtitle: Text(
                                        searchResults[index].artist.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                child: Icon(
                                  searching? Icons.my_library_music_rounded :  Icons.search,
                                  color: Colors.grey[700],
                                  size: 50,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                               Text(
                                searching? "No results found ": "Search an album..",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey),
                              )
                            ],
                          ))
          ],
        ),
      ),
    );
  }
}
