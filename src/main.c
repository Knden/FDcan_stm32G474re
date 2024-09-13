#include "main.h"
#include "stdint.h"
#include "stdio.h"

/* Function prototypes */
void Error_Handler(void);

/* Define prototype for printf usage with UART */
#ifdef __GNUC__
#define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
#else
#define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
#endif

/* External declarations of UART and FDCAN handles */
extern UART_HandleTypeDef hlpuart1;
extern FDCAN_HandleTypeDef hfdcan1;
extern FDCAN_HandleTypeDef hfdcan2;

/* FDCAN1 Defines */
FDCAN_TxHeaderTypeDef fdcan1TxHeader;
FDCAN_RxHeaderTypeDef fdcan1RxHeader;
uint8_t fdcan1TxData[64];
uint8_t fdcan1RxData[64];

/* FDCAN2 Defines */
FDCAN_TxHeaderTypeDef fdcan2TxHeader;
FDCAN_RxHeaderTypeDef fdcan2RxHeader;
uint8_t fdcan2TxData[64];
uint8_t fdcan2RxData[64];

/* size of the data sent */
int32_t dataLen = 32;

// FDCAN1 Callback
void HAL_FDCAN_RxFifo0Callback(FDCAN_HandleTypeDef *hfdcan, uint32_t RxFifo0ITs)
{
    if ((RxFifo0ITs & FDCAN_IT_RX_FIFO0_NEW_MESSAGE) != RESET)
    {
        printf("fdcan1 received data: \n");
        /* Retreive Rx messages from RX FIFO0 */
        if (HAL_FDCAN_GetRxMessage(hfdcan, FDCAN_RX_FIFO0, &fdcan1RxHeader, fdcan1RxData) != HAL_OK)
        {
            /* Reception Error */
            Error_Handler();
        }

        if (HAL_FDCAN_ActivateNotification(hfdcan, FDCAN_IT_RX_FIFO0_NEW_MESSAGE, 0) != HAL_OK)
        {
            /* Notification Error */
            Error_Handler();
        }

    }
}

// FDCAN2 Callback
void HAL_FDCAN_RxFifo1Callback(FDCAN_HandleTypeDef *hfdcan, uint32_t RxFifo1ITs)
{
    if ((RxFifo1ITs & FDCAN_IT_RX_FIFO1_NEW_MESSAGE) != RESET)
    {
        /* Retreive Rx messages from RX FIFO0 */
        if (HAL_FDCAN_GetRxMessage(hfdcan, FDCAN_RX_FIFO1, &fdcan2RxHeader, fdcan2RxData) != HAL_OK)
        {
            /* Reception Error */
            Error_Handler();
        }

        if (HAL_FDCAN_ActivateNotification(hfdcan, FDCAN_IT_RX_FIFO1_NEW_MESSAGE, 0) != HAL_OK)
        {
            /* Notification Error */
            Error_Handler();
        }

        printf("\n fdcan2 received data: ");

        // Watch recevied datas
        for (int32_t i = 0; i < dataLen; i++)
        {
            printf("%d, ", fdcan2RxData[i]);
        }
    }
}

/* Main function */
int main(void)
{
    /* Initialize peripherals, Flash interface, and Systick */
    HAL_Init();

    /* Configure the system clock */
    SystemClock_Config();

    /* Initialize the Serial Monitor via LPUART */
    /* This serial monitor can be used with printf function */
    Serial_Monitor_Init();

    FDCAN1_init();
    FDCAN2_init();

    // STart FDCAN1
    if (HAL_FDCAN_Start(&hfdcan1) != HAL_OK)
    {
        printf("error start fdcan1 ");
        Error_Handler();
    }

    // STart FDCAN2
    if (HAL_FDCAN_Start(&hfdcan2) != HAL_OK)
    {
        printf("error start fdcan2 ");
        Error_Handler();
    }

    // Activate the notification for new data in FIFO0 for FDCAN1
    if (HAL_FDCAN_ActivateNotification(&hfdcan1, FDCAN_IT_RX_FIFO0_NEW_MESSAGE, 0) != HAL_OK)
    {
        printf("error start notifications fdcan1 ");
        Error_Handler();
    }

    // Activate the notification for new data in FIFO1 for FDCAN2
    if (HAL_FDCAN_ActivateNotification(&hfdcan2, FDCAN_IT_RX_FIFO1_NEW_MESSAGE, 0) != HAL_OK)
    {
        printf("error start notifications fdcan2 ");
        Error_Handler();
    }

    // Configure TX Header for FDCAN1
    fdcan1TxHeader.Identifier = 0x1;
    fdcan1TxHeader.IdType = FDCAN_STANDARD_ID;
    fdcan1TxHeader.TxFrameType = FDCAN_DATA_FRAME;
    fdcan1TxHeader.DataLength = FDCAN_DLC_BYTES_32;
    fdcan1TxHeader.ErrorStateIndicator = FDCAN_ESI_ACTIVE;
    fdcan1TxHeader.BitRateSwitch = FDCAN_BRS_ON;
    fdcan1TxHeader.FDFormat = FDCAN_FD_CAN;
    fdcan1TxHeader.TxEventFifoControl = FDCAN_NO_TX_EVENTS;
    fdcan1TxHeader.MessageMarker = 0;

    // Configure TX Header for FDCAN2
    fdcan2TxHeader.Identifier = 0x2;
    fdcan2TxHeader.IdType = FDCAN_STANDARD_ID;
    fdcan2TxHeader.TxFrameType = FDCAN_DATA_FRAME;
    fdcan2TxHeader.DataLength = FDCAN_DLC_BYTES_32;
    fdcan2TxHeader.ErrorStateIndicator = FDCAN_ESI_ACTIVE;
    fdcan2TxHeader.BitRateSwitch = FDCAN_BRS_ON;
    fdcan2TxHeader.FDFormat = FDCAN_FD_CAN;
    fdcan2TxHeader.TxEventFifoControl = FDCAN_NO_TX_EVENTS;
    fdcan2TxHeader.MessageMarker = 0;

    printf(" preparing to send datas ... \n\n");

    while (1)
    {
        // Prepare first Tx data for fdcan1
        for (int32_t i = 0; i < dataLen; i++)
        {
            fdcan1TxData[i] = fdcan1TxData[i] + 1;
            // fdcan1TxData[i] = 7;
        }

        // Put Tx data to Txfifo
        if (HAL_FDCAN_AddMessageToTxFifoQ(&hfdcan1, &fdcan1TxHeader, fdcan1TxData) != HAL_OK)
        // if (HAL_FDCAN_AddMessageToTxFifoQ(&hfdcan2, &fdcan2TxHeader, fdcan1TxData) != HAL_OK)
        {
            printf("HAL_FDCAN_AddMessageToTxFifoQ\r\n");
            printf("%i \n\n", fdcan1TxData[0]);
            Error_Handler();
        }

        HAL_Delay(1000);
    }

    return 0;
}

/* Redefinition of putchar for UART usage (necessary for printf) */
PUTCHAR_PROTOTYPE
{
    HAL_UART_Transmit(&hlpuart1, (uint8_t *)&ch, 1, 0xFFFF);
    return ch;
}

/* Error handler function */
void Error_Handler(void)
{
    __disable_irq();
    while (1)
    {
        /* Print error message and delay */
        printf("Error detected\r\n");
        HAL_Delay(1000);
    }
}
