#include "main.h"
#include "stdint.h"
#include "stdio.h"

#define MAJOR 0 // BL Major version Number
#define MINOR 1 // BL Minor version Number

/* Function prototypes */
void Error_Handler(void);
static void GPIO_init(void);

/* Define prototype for printf usage with UART */
#ifdef __GNUC__
#define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
#else
#define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
#endif

/* External declarations of UART and FDCAN handles */
extern UART_HandleTypeDef hlpuart1;

/* For displaying the version of the bootloader */
const uint8_t APP_Version[2] = { MAJOR, MINOR };

/* Main function */
int main(void)
{
    HAL_Init();

    /* Configure the system clock */
    SystemClock_Config();

    /* Initialize the Serial Monitor via LPUART */
    /* This serial monitor can be used with printf function */
    Serial_Monitor_Init();

    /* Initialize the gpio */
    GPIO_init();

    printf("Starting Application(%d.%d)\n", APP_Version[0], APP_Version[1] );

    while (1)
    {
    /* Blinking a led */
    HAL_GPIO_WritePin(RLED_GPIO_Port, RLED_Pin, GPIO_PIN_SET);
    HAL_Delay(1000);
    HAL_GPIO_WritePin(RLED_GPIO_Port, RLED_Pin, GPIO_PIN_RESET);
    HAL_Delay(1000);
    }
    return 0;
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

/* Initialize the gpio clock and mode */
static void GPIO_init(void)
{
    __HAL_RCC_GPIOC_CLK_ENABLE();

    GPIO_InitTypeDef GPIO_LED_YELLOW = {
        .Mode = GPIO_MODE_OUTPUT_PP,
        .Pull = GPIO_NOPULL,
        .Speed = GPIO_SPEED_FREQ_LOW,
        .Pin = GPIO_PIN_12,
    };

    GPIO_InitTypeDef GPIO_LED_RED = {
        .Mode = GPIO_MODE_OUTPUT_PP,
        .Pull = GPIO_NOPULL,
        .Speed = GPIO_SPEED_FREQ_LOW,
        .Pin = GPIO_PIN_10,
    };

    HAL_GPIO_Init(YLED_GPIO_Port, &GPIO_LED_YELLOW);
    HAL_GPIO_Init(RLED_GPIO_Port, &GPIO_LED_RED);
}

/* Redefinition of putchar for UART usage (necessary for printf) */
PUTCHAR_PROTOTYPE
{
    HAL_UART_Transmit(&hlpuart1, (uint8_t *)&ch, 1, 0xFFFF);
    return ch;
}