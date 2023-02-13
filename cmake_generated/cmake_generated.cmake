# This is converter generated file, and shall not be touched by user
#
# It is always re-generated if converter script is called multiple times
# Use CMakeLists.txt to apply user changes
cmake_minimum_required(VERSION 3.22)

# Core MCU flags, CPU, instruction set and FPU setup
set(cpu_PARAMS ${cpu_PARAMS}
    -mthumb

    # Other parameters
    # -mcpu, -mfloat, -mfloat-abi, ...
    -mcpu=cortex-m4
    -mfpu=fpv4-sp-d16
    -mfloat-abi=hard
)

# Linker script
set(linker_script_SRC ${linker_script_SRC}
    ${CMAKE_CURRENT_SOURCE_DIR}/STM32F407ZGTX_FLASH.ld
)

# Sources
set(sources_SRCS ${sources_SRCS}
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/VIDEO/Src/usbh_video_desc_parsing.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/VIDEO/Src/usbh_video.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/VIDEO/Src/usbh_video_stream_parsing.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_alloc_from_region.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_minimal.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_custom_realloc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_custom_realloc_log.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_custom_realloc_log_2.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_enlarge_1.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_enlarge_1_log.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_enlarge_2.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_enlarge_2_log.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_enlarge_3.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_enlarge_3a.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_enlarge_3a_log.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_enlarge_3b.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_enlarge_3b_log.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_enlarge_3c.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_enlarge_3c_log.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_enlarge_3d.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_enlarge_3d_log.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_enlarge_3_log.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_enlarge_full.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_enlarge_full_log.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_first_malloc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_first_malloc_log.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_new_size_smaller_fragmented.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_region.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_region_log.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_shrink.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_shrink_fragmented.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_shrink_fragmented_log.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_realloc_shrink_log.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_regions_definitions.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/docs/examples_src/example_regions_definitions_custom.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/FreeRTOS/croutine.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/FreeRTOS/event_groups.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/FreeRTOS/list.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/FreeRTOS/queue.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/FreeRTOS/stream_buffer.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/FreeRTOS/tasks.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/FreeRTOS/timers.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/FreeRTOS/CMSIS_RTOS/cmsis_os.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/FreeRTOS/CMSIS_RTOS/cpu_utils.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/FreeRTOS/CMSIS_RTOS_V2/cmsis_os2.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/FreeRTOS/portable/GCC/ARM_CM4F/port.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/FreeRTOS/portable/MemMang/heap_1.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/FreeRTOS/portable/MemMang/heap_2.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/FreeRTOS/portable/MemMang/heap_3.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/FreeRTOS/portable/MemMang/heap_4.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/FreeRTOS/portable/MemMang/heap_5.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/st/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_dma.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/st/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_exti.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/st/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_gpio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/st/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_lpuart.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/st/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_pwr.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/st/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_rcc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/st/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_usart.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/lib/st/STM32L4xx_HAL_Driver/Src/stm32l4xx_ll_utils.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/stm32/lwmem_rtos_stm32l496_discovery/src/main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/stm32/lwmem_rtos_stm32l496_discovery/src/stm32l4xx_it.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/stm32/lwmem_rtos_stm32l496_discovery/src/syscalls.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/stm32/lwmem_rtos_stm32l496_discovery/src/system_stm32l4xx.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/stm32/lwmem_stm32l496_discovery/src/main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/stm32/lwmem_stm32l496_discovery/src/stm32l4xx_it.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/stm32/lwmem_stm32l496_discovery/src/syscalls.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/stm32/lwmem_stm32l496_discovery/src/system_stm32l4xx.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/win32/lwmem_basic/main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/win32/lwmem_multi_ins_multi_region/main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/win32/lwmem_multi_region/main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/win32/lwmem_os/main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/lwmem/src/lwmem/lwmem.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/lwmem/src/lwmem/lwmem.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/lwmem/src/system/lwmem_sys_cmsis_os.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/lwmem/src/system/lwmem_sys_threadx.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/lwmem/src/system/lwmem_sys_win32.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/tests/lwmem_test.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/uart_idle_rx/uart_comm_helper.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/dma.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/fsmc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/gpio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/stm32f4xx_hal_msp.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/stm32f4xx_hal_timebase_tim.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/stm32f4xx_it.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/syscalls.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/sysmem.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/system_stm32f4xx.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/usart.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/usb_otg_fs.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/dev/main.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/stm32/lwmem_rtos_stm32l496_discovery/STM32CubeIDE/startup/startup_stm32l496xx.s
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/examples/stm32/lwmem_stm32l496_discovery/STM32CubeIDE/startup/startup_stm32l496xx.s
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Startup/startup_stm32f407zgtx.s
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_hcd.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_sram.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_fsmc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_usb.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Class/AUDIO/Src/usbh_audio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Src/usbh_cdc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Class/HID/Src/usbh_hid.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Class/HID/Src/usbh_hid_keybd.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Class/HID/Src/usbh_hid_mouse.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Class/HID/Src/usbh_hid_parser.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Class/MSC/Src/usbh_msc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Class/MSC/Src/usbh_msc_bot.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Class/MSC/Src/usbh_msc_scsi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Class/MTP/Src/usbh_mtp.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Class/MTP/Src/usbh_mtp_ptp.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_core.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_ctlreq.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_ioreq.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_pipes.c
    ${CMAKE_CURRENT_SOURCE_DIR}/USB_HOST/App/usb_host.c
    ${CMAKE_CURRENT_SOURCE_DIR}/USB_HOST/Target/usbh_conf.c
)

# Include directories
set(include_c_DIRS ${include_c_DIRS}
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/VIDEO/Inc
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Inc
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/lwmem/src/include
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/lwmem/lwmem/src/include/lwmem
    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Lib/uart_idle_rx
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Inc
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/CMSIS/Device/ST/STM32F4xx/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/CMSIS/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/usbx/common/usbx_host_classes/inc
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/usbx/common/core/inc
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/usbx/ports/generic/inc
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/usbx/common/usbx_stm32_host_controllers
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/threadx/common/inc
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/threadx/ports/cortex_m4/gnu/inc
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/threadx/utility/low_power
    ${CMAKE_CURRENT_SOURCE_DIR}/USB_HOST/App
    ${CMAKE_CURRENT_SOURCE_DIR}/USB_HOST/Target
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Core/Inc
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Class/AUDIO/Inc
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Class/HID/Inc
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Class/MSC/Inc
    ${CMAKE_CURRENT_SOURCE_DIR}/Middlewares/ST/STM32_USB_Host_Library/Class/MTP/Inc
)
set(include_cxx_DIRS ${include_cxx_DIRS}
    
)
set(include_asm_DIRS ${include_asm_DIRS}
    
)

# Symbols definition
set(symbols_c_SYMB ${symbols_c_SYMB}
    "DEBUG"
    "USE_HAL_DRIVER"
    "STM32F407xx"
)
set(symbols_cxx_SYMB ${symbols_cxx_SYMB}
    
)
set(symbols_asm_SYMB ${symbols_asm_SYMB}
    "DEBUG"
)

# Link directories
set(link_DIRS ${link_DIRS}
    
)

# Link libraries
set(link_LIBS ${link_LIBS}
    
)

# Compiler options
set(compiler_OPTS ${compiler_OPTS})

# Linker options
set(linker_OPTS ${linker_OPTS})
