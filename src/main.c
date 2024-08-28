#include "main.h"

#include "stdint.h"
#include "stdio.h"

void Error_Handler();

#ifdef __GNUC__
#define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
#else
#define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
#endif

extern UART_HandleTypeDef hlpuart1;
extern FDCAN_HandleTypeDef hfdcan1;

int main()
{
    /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
    HAL_Init();

    /* Configure the system clock */
    SystemClock_Config();

    /* Initialisation du LPUART */
    Serial_Monitor_Init();

    // char message[] = "Hello from LPUART1!\r\n";
    char message[] = "hello world ! nous sommes venom !\n";

    // Transmettez les données via LPUART1
    HAL_UART_Transmit(&hlpuart1, (uint8_t *)message, sizeof(message), 0xFFFF);

    float display_float = 777.777;
    printf("Le chiffre de la chance et du hasard : %f\n", display_float);

    return 0;
}

PUTCHAR_PROTOTYPE
{
    HAL_UART_Transmit(&hlpuart1, (uint8_t *)&ch, 1, 0xFFFF);
    return ch;
}

/**
 * @brief  This function is executed in case of error occurrence.
 * @retval None
 */
void Error_Handler(void)
{
    __disable_irq();
    while (1)
    {
        printf("Error detected\r\n");
        HAL_Delay(1000);
    }
}
