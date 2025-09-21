class LocationItem {
  final String name;
  final String baseUrl;
  final String imgLogoBuilding;
  final String imgBackground;

  LocationItem(
      {required this.name,
      required this.baseUrl,
      required this.imgLogoBuilding,
      required this.imgBackground});
}

class LocationData {
  static List<LocationItem> locations = [
    LocationItem(
        name: "GCA 1",
        baseUrl: "http://14.102.152.106:8084/api",
        imgLogoBuilding: 'images/gca1Logo.png',
        imgBackground: 'images/GCA1.jpg'),
    LocationItem(
        name: "GCA 2",
        baseUrl: "http://14.102.152.106:8082/api",
        imgLogoBuilding: 'images/gca2Logo.png',
        imgBackground: 'images/GCA2.jpg'),
    LocationItem(
        name: "GCA 3",
        baseUrl: "http://14.102.152.106:8083/api",
        imgLogoBuilding: 'images/gca3Logo.png',
        imgBackground: 'images/GCA2.jpg'),
    LocationItem(
        name: "Hegarmanah",
        baseUrl: "http://14.102.152.106:8081/api",
        imgLogoBuilding: 'images/hgrLogo2.png',
        imgBackground: 'images/HGR.jpg'),
  ];
}

class StaticDatabuild {
  static const String building1 = 'GCA 1';
  static const String building2 = 'GCA 2';
  static const String building3 = 'GCA 3';
  static const String building4 = 'Hegarmanah';
}
