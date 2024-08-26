#include "main.h"

/**
 * @brief UART MSP Initialization
 * This function configures the hardware resources used in this example
 * @param huart: UART handle pointer
 * @retval None
 */
void HAL_UART_MspInit(UART_HandleTypeDef *huart)
{
    GPIO_InitTypeDef GPIO_InitStruct = {0};
    RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};
    if (huart->Instance == LPUART1)
    {
        /* USER CODE BEGIN LPUART1_MspInit 0 */

        /* USER CODE END LPUART1_MspInit 0 */

        /** Initializes the peripherals clocks
         */
        PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_LPUART1;
        PeriphClkInit.Lpuart1ClockSelection = RCC_LPUART1CLKSOURCE_PCLK1;
        if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
        {
            Error_Handler();
        }

        /* Peripheral clock enable */
        __HAL_RCC_LPUART1_CLK_ENABLE();

        __HAL_RCC_GPIOA_CLK_ENABLE();
        /**LPUART1 GPIO Configuration
        PA2     ------> LPUART1_TX
        PA3     ------> LPUART1_RX
        */
        GPIO_InitStruct.Pin = LPUART1_TX_Pin | LPUART1_RX_Pin;
        GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
        GPIO_InitStruct.Pull = GPIO_NOPULL;
        GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
        GPIO_InitStruct.Alternate = GPIO_AF12_LPUART1;
        HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

        /* USER CODE BEGIN LPUART1_MspInit 1 */

        /* USER CODE END LPUART1_MspInit 1 */
    }
}

/**
 * @brief UART MSP De-Initialization
 * This function freeze the hardware resources used in this example
 * @param huart: UART handle pointer
 * @retval None
 */
void HAL_UART_MspDeInit(UART_HandleTypeDef *huart)
{
    if (huart->Instance == LPUART1)
    {
        /* USER CODE BEGIN LPUART1_MspDeInit 0 */

        /* USER CODE END LPUART1_MspDeInit 0 */
        /* Peripheral clock disable */
        __HAL_RCC_LPUART1_CLK_DISABLE();

        /**LPUART1 GPIO Configuration
        PA2     ------> LPUART1_TX
        PA3     ------> LPUART1_RX
        */
        HAL_GPIO_DeInit(GPIOA, LPUART1_TX_Pin | LPUART1_RX_Pin);

        /* USER CODE BEGIN LPUART1_MspDeInit 1 */

        /* USER CODE END LPUART1_MspDeInit 1 */
    }
}
