//
//  Display.h
//

#include "GuessThatImage.h"

#ifndef Display_h
#define Display_h

using namespace std;

class Display {
    string f;
public:
    void displayImage(string f);
    char * getRandomImage();
};

#endif /* Display_h */
