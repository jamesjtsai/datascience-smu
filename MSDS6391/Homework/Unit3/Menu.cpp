//
//  Menu.cpp
//

#include "GuessThatImage.h"

void Menu::showMenu() {
    cout << "test" << endl;
    system("clear");
    ifstream fin;
    fin.open("logo/guessthatimage.txt");
    if (fin.fail())
        cout << "GUESS THAT IMAGE" << endl;
    else {
        string logo;
        getline(fin, logo, '\n');
        cout << logo << endl;
        while(!fin.fail()) {
            getline(fin, logo, '\n');
            cout << logo << endl;
        }
    }
    cout << "Menu" << endl;
    cout << "====" << endl;
    cout << "1. Play Game" << endl;
    cout << "2. Quit" << endl;
    cout << "" << endl;
    cout << "Enter Your Choice: ";
    return;
}

void Menu::processInput(string choice, bool &continues) {
    char i = choice[0];
    if (i == '1') {
        playGame();
        return;
    }
    else if (i == '2') {
        cout << "\nHave a nice day!" << endl;
        continues = false;
        return;
    }
    return;
}
