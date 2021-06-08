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
}


double addNumbers(double num1, double num2)
{
  return num1+num2; 
}

//Creating dart classes
class Person
{
  //class variables require to be initialized with default values
  int age = 0;
  String name = "Please name me!!!!!!";

  //var class variables dont require to be initialized.
  var ID;

  Person(String name, int age)
  {
    this.age = age;
    this.name = name;
  }
}

