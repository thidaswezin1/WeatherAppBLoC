class MyHelper{
  static String weatherCondition(String input){
    var name;
    switch(input){
      case "hc":
        name ="heavycloud";
        break;
      case "c":
        name ="clear";
        break;
      case "c":
        name ="cloudy";
        break;
      case "lr":
        name ="lightrain";
        break;
      case"s":
        name ="snow";
        break;
      case "hr":
        name ="rainy";
        break;
      case "t":
        name ="thunderstorm";
        break;
      default:
        name ="clear";

    }
    return name;
  }
}