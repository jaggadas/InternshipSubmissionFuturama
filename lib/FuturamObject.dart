class Character{
  String name;
  String image;
  String gender;
  String species;

  String occupation;
  String age;
  List<dynamic> sayings;
  Character({required this.name,required this.image,required this.gender,required this.species,required this.occupation,required this.age,required this.sayings});
  @override
  String toString() {

    return "{CharacterObject name:"+name+" image:"+image+" gender:"+gender+" species:"+species+" occupation:"+occupation+" age:"+age+" sayings:"+sayings.toString()+"}";
  }
}