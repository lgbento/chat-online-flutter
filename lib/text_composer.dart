import 'package:flutter/material.dart';

class TextComposer extends StatefulWidget {

  TextComposer(this.sendMessage);

  Function(String) sendMessage;

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {

  final TextEditingController _controller = TextEditingController();

  bool _isComposing = false;

  void _reset(){
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: (){

              }
              ),
          Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration.collapsed(hintText: 'Enviar uma mensagem'),
                onChanged: (text){
                  setState(() {
                    _isComposing = text.isNotEmpty;
                  });
                },
                onSubmitted: (text){
                  widget.sendMessage(text);
                  _controller.clear();
                _reset();
                },
              ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _isComposing ? (){
              widget.sendMessage(_controller.text);
              _controller.clear();
             _reset();
            } : null,
          )
        ],
      ),
    );
  }
}
