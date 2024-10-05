This branch implement a zephyr [samples](https://github.com/zephyrproject-rtos/zephyr/tree/main/samples/drivers/can/counter) which uses can to control a led and inrement a counter.

You need a stm32G474 board (a nucleo g474re for example). Follow this [step](https://github.com/Knden/FDcan_stm32G474re/tree/main?tab=readme-ov-file#use-command-line-and-python) to understand how to flash the code in a stm32G4.

Nothing much to say here, all the informations are on zephyr website describing the samples, and you can flash it simply with platformIO.

However, we can only use fdcan1 with this samples, i'll try to implement an example to use fdcan 2 too. When it's done this branch will be deleted.