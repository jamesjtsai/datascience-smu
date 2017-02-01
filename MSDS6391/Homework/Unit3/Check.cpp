//
//  Check.cpp
//

#include "GuessThatImage.h"

// check guess against the answer
bool Check::isCorrect(string& guess, char * answer) {
    if (guess == answer)
        return true;
    return false;
}
