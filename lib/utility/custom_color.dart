int customColor(String colorCode){
  String colors= "0xff"+ colorCode ;
  colors=colors.replaceAll("#", "");
  return int.parse(colors);

}