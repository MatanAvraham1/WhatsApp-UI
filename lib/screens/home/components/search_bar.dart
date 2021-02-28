import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:whatsapp/constants.dart';
import 'package:whatsapp/screens/home/components/media_type_tile.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  SearchBar({
    Key key,
    @required this.onCancelSearch,
    @required this.onSearchQueryChanged,
  }) : super(key: key);

  final VoidCallback onCancelSearch;
  final Function(String) onSearchQueryChanged;

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>
    with SingleTickerProviderStateMixin {
  String searchQuery = '';
  TextEditingController _searchFieldController = TextEditingController();

  clearSearchQuery() {
    _searchFieldController.clear();
    widget.onSearchQueryChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black45),
                  onPressed: widget.onCancelSearch,
                ),
                Expanded(
                  child: TextField(
                    controller: _searchFieldController,
                    cursorColor: kTealGreenLighterColor,
                    style: TextStyle(color: Colors.black54),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search...",
                      hintStyle: TextStyle(color: Colors.black45),
                      suffixIcon: InkWell(
                        child: Icon(Icons.close, color: Colors.black45),
                        onTap: clearSearchQuery,
                      ),
                    ),
                    onChanged: widget.onSearchQueryChanged,
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    children: [
                      MediaTypeTile(
                        title: "Photos",
                        icon: Icons.photo,
                      ),
                      MediaTypeTile(
                        title: "Video",
                        icon: Icons.videocam,
                      ),
                      MediaTypeTile(
                        title: "Photos",
                        icon: Icons.photo,
                      )
                    ],
                  ),
                  Row(
                    children: [],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
