
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  Widget _size(double size) {
    return SizedBox(height: size);
  }

  Widget _text(int i, String name) {
    return Text("${i}) $name");
  }

  Widget textwidget(String name ){
    return Text("    $name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Widget"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
        
              Text("A) Types of imagee",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),

              textwidget("1) Assets Image"),
              textwidget("2) Network Image"),
              textwidget("3) File Image"),
              textwidget("4) memory Image"),
SizedBox(height: 10,),
              Text("Image Properties",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              _text(1, "width: 100 height:100 "),
              Image.network(width: 100,height:100,"https://media.istockphoto.com/id/1550071750/photo/green-tea-tree-leaves-camellia-sinensis-in-organic-farm-sunlight-fresh-young-tender-bud.jpg?s=612x612&w=0&k=20&c=RC_xD5DY5qPH_hpqeOY1g1pM6bJgGJSssWYjVIvvoLw=",),
        
              _text(2, "scale :scale factor applies to the width and the height"),
              Image.network(scale: 2.3,"https://media.istockphoto.com/id/1550071750/photo/green-tea-tree-leaves-camellia-sinensis-in-organic-farm-sunlight-fresh-young-tender-bud.jpg?s=612x612&w=0&k=20&c=RC_xD5DY5qPH_hpqeOY1g1pM6bJgGJSssWYjVIvvoLw=",),


              _text(3, "alignment : "),
              SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(scale: 4.3,alignment: Alignment.bottomRight,"https://media.istockphoto.com/id/1550071750/photo/green-tea-tree-leaves-camellia-sinensis-in-organic-farm-sunlight-fresh-young-tender-bud.jpg?s=612x612&w=0&k=20&c=RC_xD5DY5qPH_hpqeOY1g1pM6bJgGJSssWYjVIvvoLw=",)),

              _text(4, "Fit : BoxFit.cover,fill,Contain,FitHeight,FitWidth used to specify how an <img> or <video> should be resized to fit its container "),
              Image.network(scale: 4.3,fit: BoxFit.contain,semanticLabel: "Nature image","https://media.istockphoto.com/id/1550071750/photo/green-tea-tree-leaves-camellia-sinensis-in-organic-farm-sunlight-fresh-young-tender-bud.jpg?s=612x612&w=0&k=20&c=RC_xD5DY5qPH_hpqeOY1g1pM6bJgGJSssWYjVIvvoLw=",),


              _text(5, "Opacity :AlwaysStoppedAnimation(.5)"),
              Image.network(opacity: AlwaysStoppedAnimation(.5),scale: 2.3,"https://media.istockphoto.com/id/1550071750/photo/green-tea-tree-leaves-camellia-sinensis-in-organic-farm-sunlight-fresh-young-tender-bud.jpg?s=612x612&w=0&k=20&c=RC_xD5DY5qPH_hpqeOY1g1pM6bJgGJSssWYjVIvvoLw=",),

              Wrap(
                spacing: 30,
                children: [
                  _text(6, "colorBlendMode :BlendMode.lighten  Used to combine color with this image"),
                  Image.network(color: Colors.red,scale: 4.5,"https://media.istockphoto.com/id/1550071750/photo/green-tea-tree-leaves-camellia-sinensis-in-organic-farm-sunlight-fresh-young-tender-bud.jpg?s=612x612&w=0&k=20&c=RC_xD5DY5qPH_hpqeOY1g1pM6bJgGJSssWYjVIvvoLw=",),

                  // _text(6, "colorBlendMode :BlendMode.lighten  Used to combine color with this image"),
                  Image.network(color: Colors.red,colorBlendMode:BlendMode.darken,scale: 4.5,"https://media.istockphoto.com/id/1550071750/photo/green-tea-tree-leaves-camellia-sinensis-in-organic-farm-sunlight-fresh-young-tender-bud.jpg?s=612x612&w=0&k=20&c=RC_xD5DY5qPH_hpqeOY1g1pM6bJgGJSssWYjVIvvoLw=",),

                ],
              ),

              _text(7, "errorBuilder : A builder function that is called if an error occurs during image loading."),
              Container(
                height: 100,
                width: 100,
                child: Image.network(errorBuilder:(context,obj,s){
                  return Icon(Icons.error);
                },scale: 4.5,"htts://media.istockphoto.com/id/1550071750/photo/green-tea-tree-leaves-camellia-sinensis-in-organic-farm-sunlight-fresh-young-tender-bud.jpg?s=612x612&w=0&k=20&c=RC_xD5DY5qPH_hpqeOY1g1pM6bJgGJSssWYjVIvvoLw=",),
              ),


              _text(8, "loadingBuilder : A builder that specifies the widget to display to the user while an image is still loading"),
              Container(
                height: 100,
                width: 100,
                child: Image.network(

                  loadingBuilder:(BuildContext context, Widget child, ImageChunkEvent? loadingProgress){

                    //  Future.delayed(Duration(seconds: 2),(){
                    //   CircularProgressIndicator();
                    // });
                    if(loadingProgress==null){
                      return child;
                    }

                    return CircularProgressIndicator();
                  },
                  scale: 4.5,"https://media.istockphoto.com/id/1550071750/photo/green-tea-tree-leaves-camellia-sinensis-in-organic-farm-sunlight-fresh-young-tender-bud.jpg?s=612x612&w=0&k=20&c=RC_xD5DY5qPH_hpqeOY1g1pM6bJgGJSssWYjVIvvoLw=",),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
