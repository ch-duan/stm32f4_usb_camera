/* USER CODE BEGIN Header */
/**
 ******************************************************************************
 * @file           : main.c
 * @brief          : Main program body
 ******************************************************************************
 * @attention
 *
 * Copyright (c) 2023 STMicroelectronics.
 * All rights reserved.
 *
 * This software is licensed under terms that can be found in the LICENSE file
 * in the root directory of this software component.
 * If no LICENSE file comes with this software, it is provided AS-IS.
 *
 ******************************************************************************
 */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

#include "dma.h"
#include "fsmc.h"
#include "gpio.h"
#include "usart.h"
#include "usb_host.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>

#include "cmsis_gcc.h"
#include "lwmem.h"
#include "uart_comm_helper.h"
#include "usb_host.h"
#include "usbh_video.h"
#include "usbh_video_stream_parsing.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
extern DMA_HandleTypeDef hdma_usart2_rx;
extern uint8_t uvc_parsing_new_frame_ready;
extern uint8_t *uvc_ready_framebuffer_ptr;
extern uint32_t uvc_ready_frame_length;
extern uint32_t uvc_frame_cnt;

static lwmem_region_t regions[] = {
  /* Set start address and size of each region */
    {(void *) 0X68096000, 0x00060000},
    {NULL,                0         }
};
UartMessageHandler debugMessageHandler;
volatile uint8_t uvc_framebuffer0[UVC_MAX_FRAME_SIZE] __attribute__((section(".sram")));
uint32_t uvc_frame_length=0;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
void MX_USB_HOST_Process(void);

/* USER CODE BEGIN PFP */
extern void USB_HOST_fast_class_call(void);
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
#ifdef __GNUC__
#define PUTCHAR_PROTOTYPE int __io_putchar(int ch)
#else
#define PUTCHAR_PROTOTYPE int fputc(int ch, FILE *f)
#endif

PUTCHAR_PROTOTYPE {
  HAL_UART_Transmit(&huart2, (uint8_t *) &ch, 1, HAL_MAX_DELAY);
  return ch;
}

void debugPacketHandler(uint8_t *packet, uint16_t packetLen, void *arg) {
  //  printf("%.*s\r\n", packetLen, packet);
  printf("debug:\t");
  for (uint16_t i = 0; i < packetLen; ++i) {
    printf("%02x ", packet[i]);
  }
  printf("\r\n");
  if (packetLen > 3) {
    if (strstr((char *) packet, "AT+camera") != NULL) {
      return;
    }
  }
}
void HAL_UARTEx_RxEventCallback(UART_HandleTypeDef *huart, uint16_t Size) {
  if (huart->Instance == debugMessageHandler.llhandler.uart->Instance) {
    UART_IDLE_Callback(&debugMessageHandler.llhandler, huart);
  }
}

void Vector_Init_Setting(uint32_t addr)  // The interrupt vector transfer
{
  SCB->VTOR = addr;
}
/* USER CODE END 0 */

/**
 * @brief  The application entry point.
 * @retval int
 */
int main(void) {
  /* USER CODE BEGIN 1 */
  Vector_Init_Setting(FLASH_BASE);
  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_USART2_UART_Init();
  MX_FSMC_Init();
  MX_USB_HOST_Init();
  /* USER CODE BEGIN 2 */
  UartPacketHandlerInit(&debugMessageHandler, &huart2, debugPacketHandler);
  if (!lwmem_assignmem(regions)) {
    printf(
        "Cannot initialize LwMEM. Make sure your regions are not "
        "overlapping each other and are in ascending memory order\r\n");
  } else {
    printf("LwMEM initialized and ready to use\r\n");
  }
  printf("Test UVC Host\n");

  // Only one framebuffer is used
  video_stream_init_buffers((uint8_t *) uvc_framebuffer0, (uint8_t *) uvc_framebuffer0);

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1) {
    /* USER CODE END WHILE */
    MX_USB_HOST_Process();

    /* USER CODE BEGIN 3 */
    // USB_HOST_fast_class_call();

    if (uvc_parsing_new_frame_ready) {
      uvc_parsing_new_frame_ready = 0;

      if (uvc_frame_cnt == 50) {
        // IAR's debugger functions
        // int f1 = __open("D:/dump.raw", _LLIO_CREAT | _LLIO_TRUNC | _LLIO_WRONLY | _LLIO_BINARY);
        // __write(f1, (uint8_t *) (uvc_ready_framebuffer_ptr), uvc_ready_frame_length);
        // __close(f1);
        // printf("uvc frame: len is %u,%02X %02X %02X %02X\r\n",uvc_ready_frame_length, *(uvc_ready_framebuffer_ptr), *(uvc_ready_framebuffer_ptr + 1),
        //        *(uvc_ready_framebuffer_ptr + uvc_ready_frame_length - 2), *(uvc_ready_framebuffer_ptr + uvc_ready_frame_length - 1));
        // for (uint32_t i = 0; i < uvc_ready_frame_length; i++) {
        //   if (i % 1024 == 0) {
        //     printf("\r\n");
        //   }
        //   printf("%02X ", *(uvc_ready_framebuffer_ptr + i));
        // }
      }
      video_stream_ready_update();
    }
  }
  /* USER CODE END 3 */
}

/**
 * @brief System Clock Configuration
 * @retval None
 */
void SystemClock_Config(void) {
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
   */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
   * in the RCC_OscInitTypeDef structure.
   */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 4;
  RCC_OscInitStruct.PLL.PLLN = 120;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 5;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK) {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
   */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_3) != HAL_OK) {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
 * @brief  Period elapsed callback in non blocking mode
 * @note   This function is called  when TIM5 interrupt took place, inside
 * HAL_TIM_IRQHandler(). It makes a direct call to HAL_IncTick() to increment
 * a global variable "uwTick" used as application time base.
 * @param  htim : TIM handle
 * @retval None
 */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim) {
  /* USER CODE BEGIN Callback 0 */

  /* USER CODE END Callback 0 */
  if (htim->Instance == TIM5) {
    HAL_IncTick();
  }
  /* USER CODE BEGIN Callback 1 */

  /* USER CODE END Callback 1 */
}

/**
 * @brief  This function is executed in case of error occurrence.
 * @retval None
 */
void Error_Handler(void) {
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  printf("%s\r\n", __func__);
  while (1) {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef USE_FULL_ASSERT
/**
 * @brief  Reports the name of the source file and the source line number
 *         where the assert_param error has occurred.
 * @param  file: pointer to the source file name
 * @param  line: assert_param error line source number
 * @retval None
 */
void assert_failed(uint8_t *file, uint32_t line) {
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line
     number, ex: printf("Wrong parameters value: file %s on line %d\r\n", file,
     line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
