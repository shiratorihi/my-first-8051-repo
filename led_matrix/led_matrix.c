// For use with Prechin 51 Experiment Board with STC89C52
// Using on-board LED 8x8 matrix, with 74HC595 as col control
// P0 as row control, P3.6 as SRCLK, P3.5 as RCLK, P3.4 as SER

#include "STC89C5xRC.h"
#include <stdint.h>

#define SER P34
#define RCLK P35
#define SRCLK P36

void hc595_send(uint8_t sendData) {
  for (uint8_t i = 0; i < 8; i++) {
    SER = (sendData & 0x80) ? 1 : 0;
    SRCLK = 0;
    SRCLK = 1;
    sendData <<= 1;
  }
  RCLK = 0;
  RCLK = 1;
}

void main(void) {
  uint8_t colScan = 0x01;
  P0 = 0x00;
  while (1) {
    hc595_send(colScan);
    colScan <<= 1;
  }
}
