//
//  Menu.h
//

#ifndef Menu_h
#define Menu_h

using namespace std;

void playGame();

class Menu {
    
  public:
    void showMenu();
    void processInput(string choice, bool &continues);
};

#endif /* Menu_h */
