   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8.1 - 09 Jan 2023
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
  43                     ; 48 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  43                     ; 49 {
  44                     	switch	.text
  45  0000               f_NonHandledInterrupt:
  49                     ; 53 }
  52  0000 80            	iret
  74                     ; 61 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  74                     ; 62 {
  75                     	switch	.text
  76  0001               f_TRAP_IRQHandler:
  80                     ; 66 }
  83  0001 80            	iret
 105                     ; 73 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 105                     ; 74 
 105                     ; 75 {
 106                     	switch	.text
 107  0002               f_TLI_IRQHandler:
 111                     ; 79 }
 114  0002 80            	iret
 136                     ; 86 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 136                     ; 87 {
 137                     	switch	.text
 138  0003               f_AWU_IRQHandler:
 142                     ; 91 }
 145  0003 80            	iret
 167                     ; 98 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 167                     ; 99 {
 168                     	switch	.text
 169  0004               f_CLK_IRQHandler:
 173                     ; 103 }
 176  0004 80            	iret
 199                     ; 110 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 199                     ; 111 {
 200                     	switch	.text
 201  0005               f_EXTI_PORTA_IRQHandler:
 205                     ; 115 }
 208  0005 80            	iret
 231                     ; 122 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 231                     ; 123 {
 232                     	switch	.text
 233  0006               f_EXTI_PORTB_IRQHandler:
 237                     ; 127 }
 240  0006 80            	iret
 263                     ; 134 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 263                     ; 135 {
 264                     	switch	.text
 265  0007               f_EXTI_PORTC_IRQHandler:
 269                     ; 139 }
 272  0007 80            	iret
 295                     ; 146 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 295                     ; 147 {
 296                     	switch	.text
 297  0008               f_EXTI_PORTD_IRQHandler:
 301                     ; 151 }
 304  0008 80            	iret
 327                     ; 158 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 327                     ; 159 {
 328                     	switch	.text
 329  0009               f_EXTI_PORTE_IRQHandler:
 333                     ; 163 }
 336  0009 80            	iret
 358                     ; 210 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 358                     ; 211 {
 359                     	switch	.text
 360  000a               f_SPI_IRQHandler:
 364                     ; 215 }
 367  000a 80            	iret
 392                     ; 222 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 392                     ; 223 {
 393                     	switch	.text
 394  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 396  000b 8a            	push	cc
 397  000c 84            	pop	a
 398  000d a4bf          	and	a,#191
 399  000f 88            	push	a
 400  0010 86            	pop	cc
 401  0011 3b0002        	push	c_x+2
 402  0014 be00          	ldw	x,c_x
 403  0016 89            	pushw	x
 404  0017 3b0002        	push	c_y+2
 405  001a be00          	ldw	x,c_y
 406  001c 89            	pushw	x
 409                     ; 226 	TIM1_ClearFlag(TIM1_FLAG_UPDATE);
 411  001d ae0001        	ldw	x,#1
 412  0020 cd0000        	call	_TIM1_ClearFlag
 414                     ; 227 	++counterDelay;
 416  0023 be00          	ldw	x,_counterDelay
 417  0025 1c0001        	addw	x,#1
 418  0028 bf00          	ldw	_counterDelay,x
 419                     ; 230 }
 422  002a 85            	popw	x
 423  002b bf00          	ldw	c_y,x
 424  002d 320002        	pop	c_y+2
 425  0030 85            	popw	x
 426  0031 bf00          	ldw	c_x,x
 427  0033 320002        	pop	c_x+2
 428  0036 80            	iret
 451                     ; 237 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 451                     ; 238 {
 452                     	switch	.text
 453  0037               f_TIM1_CAP_COM_IRQHandler:
 457                     ; 242 }
 460  0037 80            	iret
 483                     ; 275  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 483                     ; 276  {
 484                     	switch	.text
 485  0038               f_TIM2_UPD_OVF_BRK_IRQHandler:
 489                     ; 280  }
 492  0038 80            	iret
 515                     ; 287  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 515                     ; 288  {
 516                     	switch	.text
 517  0039               f_TIM2_CAP_COM_IRQHandler:
 521                     ; 292  }
 524  0039 80            	iret
 547                     ; 329  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 547                     ; 330  {
 548                     	switch	.text
 549  003a               f_UART1_TX_IRQHandler:
 553                     ; 334  }
 556  003a 80            	iret
 579                     ; 341  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 579                     ; 342  {
 580                     	switch	.text
 581  003b               f_UART1_RX_IRQHandler:
 585                     ; 346  }
 588  003b 80            	iret
 610                     ; 354 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 610                     ; 355 {
 611                     	switch	.text
 612  003c               f_I2C_IRQHandler:
 616                     ; 359 }
 619  003c 80            	iret
 641                     ; 433  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 641                     ; 434  {
 642                     	switch	.text
 643  003d               f_ADC1_IRQHandler:
 647                     ; 438  }
 650  003d 80            	iret
 673                     ; 459  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 673                     ; 460  {
 674                     	switch	.text
 675  003e               f_TIM4_UPD_OVF_IRQHandler:
 679                     ; 464  }
 682  003e 80            	iret
 705                     ; 472 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 705                     ; 473 {
 706                     	switch	.text
 707  003f               f_EEPROM_EEC_IRQHandler:
 711                     ; 477 }
 714  003f 80            	iret
 726                     	xref.b	_counterDelay
 727                     	xdef	f_EEPROM_EEC_IRQHandler
 728                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 729                     	xdef	f_ADC1_IRQHandler
 730                     	xdef	f_I2C_IRQHandler
 731                     	xdef	f_UART1_RX_IRQHandler
 732                     	xdef	f_UART1_TX_IRQHandler
 733                     	xdef	f_TIM2_CAP_COM_IRQHandler
 734                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 735                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 736                     	xdef	f_TIM1_CAP_COM_IRQHandler
 737                     	xdef	f_SPI_IRQHandler
 738                     	xdef	f_EXTI_PORTE_IRQHandler
 739                     	xdef	f_EXTI_PORTD_IRQHandler
 740                     	xdef	f_EXTI_PORTC_IRQHandler
 741                     	xdef	f_EXTI_PORTB_IRQHandler
 742                     	xdef	f_EXTI_PORTA_IRQHandler
 743                     	xdef	f_CLK_IRQHandler
 744                     	xdef	f_AWU_IRQHandler
 745                     	xdef	f_TLI_IRQHandler
 746                     	xdef	f_TRAP_IRQHandler
 747                     	xdef	f_NonHandledInterrupt
 748                     	xref	_TIM1_ClearFlag
 749                     	xref.b	c_x
 750                     	xref.b	c_y
 769                     	end
