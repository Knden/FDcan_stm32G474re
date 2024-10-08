#include "main.h"
#include "stdint.h"
#include "stdio.h"

#define MAJOR 0 // BL Major version Number
#define MINOR 1 // BL Minor version Number

/* Function prototypes */
void Error_Handler(void);
static void GPIO_init(void);
static void goto_application(void);

/* Define prototype for printf usage with UART */
#ifdef __GNUC__
#define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
#else
#define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
#endif

/* External declarations of UART and FDCAN handles */
extern UART_HandleTypeDef hlpuart1;

/* For displaying the version of the bootloader */
static const uint8_t BL_Version[2] = {MAJOR, MINOR};

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

    /* Turn ON the yellow LED */
    HAL_GPIO_WritePin(YLED_GPIO_Port, YLED_Pin, GPIO_PIN_SET);

    printf("Starting Bootloader(%d.%d)\n", BL_Version[0], BL_Version[1] );
    HAL_Delay(2000);   //2sec delay for nothing

    // Jump to application
    goto_application();

    while (1)
    {
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

static void goto_application(void)
{
    printf("Gonna Jump to Application\n");

    void (*app_reset_handler)(void) = (void *)(*((volatile uint32_t *)(0x08000800 + 4U)));

    // Turn OFF the Green Led to tell the user that Bootloader is not running
    HAL_GPIO_WritePin(YLED_GPIO_Port, YLED_Pin, GPIO_PIN_RESET); // Green LED OFF

    /* Reset the Clock */
    HAL_RCC_DeInit();
    HAL_DeInit();
    __set_MSP(*(volatile uint32_t *)0x08000800);

    SysTick->CTRL = 0;
    SysTick->LOAD = 0;
    SysTick->VAL = 0;

    /* Jump to application */
    app_reset_handler(); // call the app reset handler
}

/* Redefinition of putchar for UART usage (necessary for printf) */
PUTCHAR_PROTOTYPE
{
    HAL_UART_Transmit(&hlpuart1, (uint8_t *)&ch, 1, 0xFFFF);
    return ch;
}