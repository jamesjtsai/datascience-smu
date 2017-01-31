//
//  Check.cpp
//

#include "GuessThatImage.h"

bool Check::isCorrect(string& guess, char * answer) {
    if (guess == answer)
        return true;
    return false;
}
