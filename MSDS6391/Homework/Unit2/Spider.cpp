// MSDS6391 Visualization 2
// Assignment #2
// Spider.cpp : C++ Animated ASCII Spider (Compile with g++)
// Author: James Tsai and Wid Sogata
// Date: 01/22/2017

#include <iostream>
#include <chrono>
#include <thread>

void print_web(int y);
void print_spider1(int y);
void print_spider2(int y);

int main() {
   int y_pos = 0;
   do {
      print_web(y_pos);
      if (y_pos%2 == 0) { print_spider1(y_pos); }
      else { print_spider2(y_pos); }
      std::this_thread::sleep_for(std::chrono::milliseconds(500));
      y_pos++;
      system("clear");
      if (y_pos == 10) { y_pos = 0; }
   } while(true);
   return 0;
}

void print_web(int y)
{
   char y_pos = '\n';
   std::cout << std::string(y, y_pos) << std::endl;
   for(int i=0; i<y; i++)
   {
      for(int j=1; j<y*2; j=j*2)
      {
         std::cout << "            |" << std::endl;
      }
   }
}

void print_spider1(int y)
{
   std::cout << "            (" << std::endl;
   std::cout << "            )" << std::endl;
   std::cout << "            (" << std::endl;
   std::cout << "     /\\  .-\"\"\"-.  /\\" << std::endl;
   std::cout << "    //\\\\/  ,,,  \\//\\\\" << std::endl;
   std::cout << "    |/\\| ,;;;;;, |/\\|" << std::endl;
   std::cout << "    //\\\\\\;-\"\"\"-;///\\\\" << std::endl;
   std::cout << "   //  \\/   .   \\/  \\\\" << std::endl;
   std::cout << "  (| ,-_| \\ | / |_-, |)" << std::endl;
   std::cout << "    //`__\\.-.-./__`\\\\" << std::endl;
   std::cout << "   // /.-(() ())-.\\ \\\\" << std::endl;
   std::cout << "  (\\ |)   '---'   (| /)" << std::endl;
   std::cout << "   ` (|           |) `" << std::endl;
   std::cout << "     \\)           (/" << std::endl;
}

void print_spider2(int y)
{
   std::cout << "            (" << std::endl;
   std::cout << "            )" << std::endl;
   std::cout << "            (" << std::endl;
   std::cout << "     /\\  .-\"\"\"-.  /\\" << std::endl;
   std::cout << "    //\\\\/  ,,,  \\//\\\\" << std::endl;
   std::cout << "    |/\\| ,;;;;;, |/\\|" << std::endl;
   std::cout << "    ||\\\\\\;-\"\"\"-;///||" << std::endl;
   std::cout << "    // \\/   .   \\/ \\\\" << std::endl;
   std::cout << "   (|,-_| \\ | / |_-,|)" << std::endl;
   std::cout << "    //`__\\.-.-./__`\\\\" << std::endl;
   std::cout << "   // /.-(() ())-.\\ \\\\" << std::endl;
   std::cout << "   (\\|)   '---'   (|/)" << std::endl;
   std::cout << "  `  \\\\         //  `" << std::endl;
   std::cout << "      \\)       (/" << std::endl;
}
