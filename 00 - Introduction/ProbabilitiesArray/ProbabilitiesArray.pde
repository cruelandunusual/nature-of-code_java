// Running this code will produce a 40% chance of printing the value 1,
// a 20% chance of printing 2, and a 40% chance of printing 3.

int[] stuff = new int[5];
int[] choices = new int[3];


void setup()
{
  stuff[0] = 1; // 1 is stored in the array twice, making it more likely to be picked.
  stuff[1] = 1;
  stuff[2] = 2;
  stuff[3] = 3; // ditto
  stuff[4] = 3;
  
  for (int i = 0; i < 1000; i++) // choose one hundred random numbers
  {
    int index = int(random(stuff.length));
    if (index == 0 || index == 1)
    {
      choices[0]++; // corresponds to stuff[0] and stuff[1]
    }
    else if (index == 3 || index == 4)
    {
      choices[2]++; // corresponds to stuff[3] and stuff[4]
    }
    else
    {
      choices[1]++; // corresponds to stuff[2]
    }

  }

  for (int i = 0; i < choices.length; i++)
  {
    System.out.println(i+1 + " was chosen " + choices[i] + " times.");
  }
  
}
