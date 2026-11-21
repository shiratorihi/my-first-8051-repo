#ifndef SDCC_SHIM_H
#define SDCC_SHIM_H

#ifdef __clang__
#define __sfr volatile unsigned char
#define __sbit volatile unsigned char
#define __bit unsigned char
#define bool __bit
#define __at(x)
#define __interrupt(n)
#define __using(n)
#define __critical
#define __reentrant
#define __naked
#endif

#endif
