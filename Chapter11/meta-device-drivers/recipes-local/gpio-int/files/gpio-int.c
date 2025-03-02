/* Copyright (C) 2025, Frank Vasquez (frank.vasquez@gmail.com) */

#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/epoll.h>
#include <sys/types.h>

/*
 * Demonstration of using epoll(2) to wait for an interrupt on GPIO.
 *
 * USR_BUTTON is configured as gpio 557, so to make it an input which
 * triggers on a falling edge, write
 *
 * echo 557 > /sys/class/gpio/export
 * echo falling > /sys/class/gpio/gpio557/edge
 *
 * Now, the USR_BUTTON pin is normally pulled high, so
 * /sys/class/gpio557/value reads as 1'.
 * Pushing the button takes it low, and value reads as '0'.
 *
 * This program waits for the level to fall from 1 to 0 and
 * prints out a message each time it does so.
 */

int main(int argc, char *argv[])
{
    int ep;
    int f;
    struct epoll_event ev, events;
    char value[4];
    int ret;
    int n;

    ep = epoll_create(1);

    if (ep == -1) {
        perror("Can't create epoll");
        return 1;
    }

    f = open("/sys/class/gpio/gpio557/value", O_RDONLY | O_NONBLOCK);

    if (f == -1) {
        perror("Can't open gpio557");
        return 1;
    }

    n = read(f, &value, sizeof(value));

    if (n > 0) {
        printf("Initial value value=%c\n", value[0]);
        lseek(f, 0, SEEK_SET);
    }

    ev.events = EPOLLPRI;
    ev.data.fd = f;
    ret = epoll_ctl(ep, EPOLL_CTL_ADD, f, &ev);

    if (ret == -1) {
        perror("Can't register target file descriptor with epoll");
        return 1;
    }

    while (1) {
        printf("Waiting\n");
        ret = epoll_wait(ep, &events, 1, -1);

        if (ret > 0) {
            n = read(f, &value, sizeof(value));
            printf("Button pressed: read %d bytes, value=%c\n", n, value[0]);
            lseek(f, 0, SEEK_SET);
        }
    }

    return 0;
}
