
/**
 * Classes, constructors, named arguments, var, 
 * Nullable and Non-nullable data types, type inference.
 * 
 */

void main()
{
  //Using var
  //Dart has a feature called type-inference.
  //Over here since dart knows that addNumbers returns double, it will infer the variable's type as double.
  //It is a good practice to use var and use the type inference feature of dart.
  var firstResult = addNumbers(10, 20);
  print(firstResult);

  //You can also use the specific data type
  double secondResult = addNumbers(15, 20);
  print(secondResult);

  print("");
  //Creating dart objects
  var p1 = Person("Yash",21);
  print(p1);
  print("Name = " + p1.name);
  print("Age = ${p1.age}");

  //Calling a duplicate constructor
  var p2 = Person.consturcter1(name: "Tim", age: 20);
  print(p1);
  print("Name = " + p1.name);
  print("Age = ${p1.age}");
}


double addNumbers(double num1, double num2)
{
  return num1+num2; 
}

//Creating dart classes
class Person
{
  //class variables require to be initialized with default values
  //Non-nullable data types
  int age = 0;
  String name = "No name";

  /*In dart there is a feature called "Null safety", hence almost all the default varibale types like
    int, string, float cannot be null. Hence above we had to initialize the variables.
  */

  //Dart also has nullable data types and you can declare them like this:
  String? address;
  int? phoneNumber;
  //Read this: https://stackoverflow.com/questions/60068435/what-is-null-safety-in-dart
  

  //var class variables dont require to be initialized.
  var ID;

  //This is what a typical "defualt" constructor looks like
  Person(String name, int age)
  {
    this.age = age;
    this.name = name;
  }

  /* 
   * Defining a duplicate constructor in dart: ClassName.<constructor name>(){}
   * You can also see that this constructor uses named arguments, which are optional.
   * The named arguments must be initialized since they can be null, or else you use "?"
   *  to specify that the parameter is nullable, but be sure to check for that before you code 
   *  uses a null value.
  */
  Person.consturcter1({String? name, int age = 0})
  {
    if(name == null)
    {
      //check if name is null, i.e, it was optionally not assigned anything.
    }
    //You dont need to check the value for age, since its default value is defined.
  }

  /* A shortcut to defining a typical constructor:
   * This will assign the class variables name and age with the passed arguments.
   * You will have to assign defualt values over here, beasue there is no way you can handle null values.
   */
  Person.consturcter2({this.name = "No name", this.age = 0});

  /*
  Using the @required annotation: This is a feature unique to flutter and NOT built in dart.
  This tells the compiler to tell the programmer that this is a required argument.
  Person.constructor3({@required String? name})
  { 
    //Your code here 
  }

  */

}

