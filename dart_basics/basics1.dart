// Dart code is very similar to the code you might have seen in c/c++ or Java.

//for example:
void main() //dart has a main function just like java/c/c++.
{
  for (int i = 0; i < 5; i++)//for loop syntax.
  {
    //The syntax to add variables inside strings is like bash.
    print('hello ${i + 1}'); //printing is straight forward.
  }
  //Unlike python we have semicolons here. :)

  //Using Dynamic data-type.
  print(addNumbersDynamic(10, 1)); //11
  print(addNumbersDynamic(10, 1.1)); //11.1
  print(addNumbersDynamic(10.5, 1)); //11.5

  print(multiply(3, 4)); //12
}


//The following function is fine where we are explicitly mentioning a variable type.
int addNumbers(int num1, int num2)
{
  return num1+num2; 
}

/**
 * >The following function is fine as well, where dart assumes the variable types to be "dynamic."
 * >But it is generally a good practice to mention the data type even though dart 
 *    is an optionally typed language.
 * >Notice that we also dont have a return type for the function, it is dynamic as well.
*/
addNumbersDynamic(num1, num2)
{
  return num1+num2; 
}

//Functions with only one line of code can be written as:
int multiply(int a, int b) => (a*b);