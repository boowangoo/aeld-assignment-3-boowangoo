#include <syslog.h>
#include <libgen.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <errno.h>

int main(int argc, char **argv)
{
    char *writefile = NULL;
    char *writestr = NULL;
    // Exits with value 1 error and print statements if any of the arguments
    //above were not specified
    if (argc >= 3) {
        writefile = argv[1];
        writestr = argv[2];
    }
    openlog("writer", LOG_PID, LOG_USER);
    if (writefile == NULL || writestr == NULL) {
        syslog(LOG_ERR, "writefile or writestr not specified\n");
        return 1;
    }

    FILE *fp = fopen(writefile, "w");
    if (fp == NULL) {
        syslog(LOG_ERR, "failed to open file %s\n", writefile);
        return 1;
    }
    fprintf(fp, "%s", writestr);
    fclose(fp);

    return 0;
}
