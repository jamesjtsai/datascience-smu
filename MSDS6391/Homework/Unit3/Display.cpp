//
//  Display.cpp
//

#include "GuessThatImage.h"
#include <dirent.h>

void Display::displayImage(string f) {
    ifstream fin;
    string ascii;
    fin.open(f);
    while(!fin.fail()) {
        getline(fin, ascii, '\n');
        cout << ascii << endl;
    }
}

void Display::displayRandomImage() {
    DIR *dirp;
    struct dirent *ent; 
    dirp = opendir("images");
    if (dirp != NULL) {
        while ((ent = readdir(dirp)) != NULL) {
            printf("%s\n", ent->d_name);
        }
    } else {
        printf("%s\n","Cannot open directory!");
    }
    (void)closedir(dirp);
}
