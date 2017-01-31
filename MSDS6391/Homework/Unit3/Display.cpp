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

char * Display::getRandomImage() {
    unsigned char isFile = 0x8;
    DIR *dirp;
    struct dirent *ent; 
    dirp = opendir("images");
    char * thearray[20];
    int k = 0;
    if (dirp != NULL) {
        while ((ent = readdir(dirp)) != NULL) {
            if(ent->d_type==isFile) {
                thearray[k] = ent->d_name;
                k++;
            }
        }
    } else {
        printf("%s\n","Cannot open directory!");
    }
    (void)closedir(dirp);
    int r = rand()%k;
    return thearray[r];
}
