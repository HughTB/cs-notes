#include <string.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
        printf("Please, enter your password below\n");
        char password[64];
        gets(password);

        if(password) {
                if(strcmp(password, "Sup3r!C0mpl!c4t3dPassword")==0) {
                        printf("Correct\n");
                        printf("FLAG:UOP_Welldone\n");
                        printf("This is a new bash shell. type exit to return to the previous shell\n");
                        system("/bin/sh -l");
                } else {
                        printf("WRONG PASSWORD!\n");
                }
        } else {
                printf("Usage: ./PasswordCheck 'password'\n");
        }
        return 0;
}
