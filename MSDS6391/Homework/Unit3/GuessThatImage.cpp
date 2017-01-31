#include "GuessThatImage.h"
#include "Menu.h"
#include "Display.h"
#include "Check.h"

void processInput(string _choice, bool& _continues);

int main() {
    Menu menu;
    string userInput;
    bool userContinues = true;
    do {
        menu.showMenu();
        while(isspace(cin.peek()))
            cin.ignore();
        getline(cin, userInput);
        menu.processInput(userInput, userContinues);
    } while(userContinues);
    return 0;
}


void playGame() {
    Display display;
    Check check;
    int lives, misses;
    lives = 3;
    misses = MAX_MISS;
    string userGuess;
    while (lives > 0) {
        system("clear");
        //display.displayImage("images/apple.txt");
        display.displayRandomImage();
        cout << "You have " << misses << " more tries." << endl;
        cout << "What is that image? " << endl;
        getline(cin, userGuess);
        if (check.isCorrect(userGuess)) {
            cout << "\nCongratulations!" << endl;
            std::this_thread::sleep_for(std::chrono::milliseconds(1000));
            return;
        }
        else {
            misses--;
        }
        if (misses == 0) {
            cout << "\nBetter luck next time!" << endl;
            std::this_thread::sleep_for(std::chrono::milliseconds(1000));
            return;
        }
    }
}
