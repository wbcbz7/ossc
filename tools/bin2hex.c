#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

int main(int argc, char **argv)
{
    unsigned char block[256];
    unsigned int csum;

    int bc;
    FILE *fd_o;
	FILE *fd_i;
    struct stat fileinfo;

    unsigned int i, j;

    if (argc != 4) {
        printf("usage: %s width binfile hexfile\n", argv[0]);
        return -1;
    }

    bc = atoi(argv[1]);
    if ((bc < 1) || (bc > 255)) {
        printf("byte count per line must be 1-255");
        return -1;
    }

    if ((fd_i = fopen(argv[2], "rb")) == NULL || fstat(fileno(fd_i), &fileinfo) == -1) {
        printf("Couldn't open file\n");
        return -1;
    }

    printf("size: %u bytes\n", fileinfo.st_size);

    if ((fd_o = fopen(argv[3], "w")) == NULL) {
        printf("invalid outfile\n");
        return -1;
    }

    for (i=0; i<fileinfo.st_size; i+=bc) {
        fread((void*)block, 1, bc, fd_i);
        csum = bc+((i/bc)>>8)+((i/bc)&0xff);
        for (j=0; j<bc; j++)
            csum += block[j];
        csum &= 0xff;
        csum = (~csum+1)&0xff;
        fprintf(fd_o, ":%.2X%.4X00", bc, i/bc);
        for (j=0; j<bc; j++)
            fprintf(fd_o, "%.2X", block[bc-1-j]);
        fprintf(fd_o, "%.2X\n", csum);
    }

    fprintf(fd_o, ":00000001FF\n");

    fclose(fd_o);
    fclose(fd_i);

    return 0;
}
