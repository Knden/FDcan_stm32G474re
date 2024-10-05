This branch is inspired by a zephyr [sample](https://github.com/zephyrproject-rtos/zephyr/tree/main/samples/drivers/can/counter) which uses CAN to control a led and inrement a counter. But in this case I used the two fdcan on the stm32 to communicate with each other (the schematic connection is the same as the one presents in the main branch) :

- FDCAN1 send an incremental counter to FDCAN2
- FDCAN2 send the LED state to FDCAN1 (the leed is togled)

The code is mainly the same as the one in zephyr sample, the only difference is that I added the FDCAN2 in the operation.

You need a stm32G474 board (a nucleo g474re for example). Follow this [step](https://github.com/Knden/FDcan_stm32G474re/tree/main?tab=readme-ov-file#use-command-line-and-python) to understand how to flash the code in a stm32G4.

More detail to come after.