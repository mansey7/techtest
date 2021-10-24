import 'package:flutter/material.dart';
import 'package:tech_test/%20model/album_model.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class DetailView extends StatefulWidget {
  final Album album;
  const DetailView({Key? key, required this.album}) : super(key: key);
  @override
  _DetailView createState() =>
      // ignore: no_logic_in_create_state
      _DetailView(album);
}

class _DetailView extends State<DetailView> {
  final Album album;
  String? url;
  _DetailView(this.album);
  @override
  void initState() {
    super.initState();
    url = album.image?[2].text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.red,
        title: Text(
          album.name.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.height * 0.25,
                  child: Center(
                    child: Image(
                      image: NetworkImage(url!),
                    ),
                  )),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.5),
                        top: BorderSide(color: Colors.grey, width: 0.5))),
                child: ListTile(
                  title: const Text(
                    "Artist",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(album.artist.toString()),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.5))),
                child: ListTile(
                  title: const Text(
                    "Album",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(album.name.toString()),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.5))),
                child: ListTile(
                  title: const Text(
                    "Streamable",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(album.streamable.toString()),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.5))),
                child: ListTile(
                  title: const Text(
                    "last.fm URL",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: InkWell(
                    onTap: () => url_launcher.launch(album.url.toString()),
                    child: Text(
                      album.url.toString(),
                      style: const TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
