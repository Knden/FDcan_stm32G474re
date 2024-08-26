#include "stm32g4xx_hal_fdcan.h"

/**
 * @brief FDCAN Initialization
 * This function configures the hardware resources used in this example
 * @param hfdcan: FDCAN handle pointer
 * @retval None
 */
void FDCAN_init(FDCAN_HandleTypeDef *hfdcan)
{
    GPIO_InitTypeDef GPIO_InitStruct = {0};
    RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};
    if (hfdcan->Instance == FDCAN1)
    {
        PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_FDCAN;
        PeriphClkInit.FdcanClockSelection = RCC_FDCANCLKSOURCE_PCLK1;
        if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
        {
            Error_Handler();
        }

        /* Peripheral clock enable */
        __HAL_RCC_FDCAN_CLK_ENABLE();

        __HAL_RCC_GPIOA_CLK_ENABLE();

        /**FDCAN1 GPIO Configuration
        PA11     ------> FDCAN1_RX
        PA12     ------> FDCAN1_TX
        */
        GPIO_InitStruct.Pin = GPIO_PIN_11 | GPIO_PIN_12;
        GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
        GPIO_InitStruct.Pull = GPIO_NOPULL;
        GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
        GPIO_InitStruct.Alternate = GPIO_AF9_FDCAN1;
        HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

        /* FDCAN1 interrupt Init */
        HAL_NVIC_SetPriority(FDCAN1_IT0_IRQn, 0, 0);
        HAL_NVIC_EnableIRQ(FDCAN1_IT0_IRQn);
    }
}

static void MX_FDCAN1_Init(FDCAN_HandleTypeDef *hfdcan)
{

    hfdcan->Instance = FDCAN1;
    hfdcan->Init.ClockDivider = FDCAN_CLOCK_DIV1;
    hfdcan->Init.FrameFormat = FDCAN_FRAME_FD_NO_BRS;
    hfdcan->Init.Mode = FDCAN_MODE_EXTERNAL_LOOPBACK;
    hfdcan->Init.AutoRetransmission = ENABLE;
    hfdcan->Init.TransmitPause = DISABLE;
    hfdcan->Init.ProtocolException = DISABLE;
    hfdcan->Init.NominalPrescaler = 2;
    hfdcan->Init.NominalSyncJumpWidth = 22;
    hfdcan->Init.NominalTimeSeg1 = 147;
    hfdcan->Init.NominalTimeSeg2 = 22;
    hfdcan->Init.DataPrescaler = 17;
    hfdcan->Init.DataSyncJumpWidth = 5;
    hfdcan->Init.DataTimeSeg1 = 14;
    hfdcan->Init.DataTimeSeg2 = 5;
    hfdcan->Init.StdFiltersNbr = 1;
    hfdcan->Init.ExtFiltersNbr = 0;
    hfdcan->Init.TxFifoQueueMode = FDCAN_TX_FIFO_OPERATION;
    if (HAL_FDCAN_Init(hfdcan) != HAL_OK)
    {
        Error_Handler();
    }
}
