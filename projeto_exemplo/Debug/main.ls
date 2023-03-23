   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8.1 - 09 Jan 2023
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
  14                     	bsct
  15  0000               _counterDelay:
  16  0000 0000          	dc.w	0
  17  0002               _dataRXSPI:
  18  0002 00            	dc.b	0
  63                     ; 15 main()
  63                     ; 16 {
  65                     	switch	.text
  66  0000               _main:
  70                     ; 18 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);	
  72  0000 4f            	clr	a
  73  0001 cd0000        	call	_CLK_HSIPrescalerConfig
  75                     ; 20 	GPIO_Init(GPIOD,GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST );
  77  0004 4be0          	push	#224
  78  0006 4b01          	push	#1
  79  0008 ae500f        	ldw	x,#20495
  80  000b cd0000        	call	_GPIO_Init
  82  000e 85            	popw	x
  83                     ; 22 	TIM1_TimeBaseInit(15,TIM1_COUNTERMODE_UP,999,0);
  85  000f 4b00          	push	#0
  86  0011 ae03e7        	ldw	x,#999
  87  0014 89            	pushw	x
  88  0015 4b00          	push	#0
  89  0017 ae000f        	ldw	x,#15
  90  001a cd0000        	call	_TIM1_TimeBaseInit
  92  001d 5b04          	addw	sp,#4
  93                     ; 24 	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);
  95  001f ae0101        	ldw	x,#257
  96  0022 cd0000        	call	_TIM1_ITConfig
  98                     ; 26 	TIM1_ClearFlag(TIM1_FLAG_UPDATE);
 100  0025 ae0001        	ldw	x,#1
 101  0028 cd0000        	call	_TIM1_ClearFlag
 103                     ; 28 	TIM1_Cmd(ENABLE);
 105  002b a601          	ld	a,#1
 106  002d cd0000        	call	_TIM1_Cmd
 108                     ; 30 	enableInterrupts();
 111  0030 9a            rim
 113                     ; 44 	SPI_DeInit();
 116  0031 cd0000        	call	_SPI_DeInit
 118                     ; 46  SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_4, SPI_MODE_MASTER, SPI_CLOCKPOLARITY_LOW, SPI_CLOCKPHASE_2EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX, SPI_NSS_SOFT, 0x07);
 120  0034 4b07          	push	#7
 121  0036 4b02          	push	#2
 122  0038 4b00          	push	#0
 123  003a 4b01          	push	#1
 124  003c 4b00          	push	#0
 125  003e 4b04          	push	#4
 126  0040 ae0008        	ldw	x,#8
 127  0043 cd0000        	call	_SPI_Init
 129  0046 5b06          	addw	sp,#6
 130                     ; 47   	delay_ms(1000);
 132  0048 ae03e8        	ldw	x,#1000
 133  004b ad37          	call	_delay_ms
 135                     ; 49   SPI_Cmd(ENABLE);
 137  004d a601          	ld	a,#1
 138  004f cd0000        	call	_SPI_Cmd
 140                     ; 51 	GPIO_WriteHigh(GPIOD,GPIO_PIN_0);
 142  0052 4b01          	push	#1
 143  0054 ae500f        	ldw	x,#20495
 144  0057 cd0000        	call	_GPIO_WriteHigh
 146  005a 84            	pop	a
 147  005b               L12:
 148                     ; 56 		SPI_SendData((uint8_t)0x4D);
 150  005b a64d          	ld	a,#77
 151  005d cd0000        	call	_SPI_SendData
 154  0060               L72:
 155                     ; 58 		while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET)
 157  0060 a602          	ld	a,#2
 158  0062 cd0000        	call	_SPI_GetFlagStatus
 160  0065 4d            	tnz	a
 161  0066 27f8          	jreq	L72
 163  0068               L53:
 164                     ; 62 		while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET)
 166  0068 a601          	ld	a,#1
 167  006a cd0000        	call	_SPI_GetFlagStatus
 169  006d 4d            	tnz	a
 170  006e 27f8          	jreq	L53
 171                     ; 66 		dataRXSPI = SPI_ReceiveData();
 173  0070 cd0000        	call	_SPI_ReceiveData
 175  0073 b702          	ld	_dataRXSPI,a
 176                     ; 68 		SPI_SendData((uint8_t)dataRXSPI);
 178  0075 b602          	ld	a,_dataRXSPI
 179  0077 cd0000        	call	_SPI_SendData
 182  007a               L34:
 183                     ; 70 		while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET)
 185  007a a602          	ld	a,#2
 186  007c cd0000        	call	_SPI_GetFlagStatus
 188  007f 4d            	tnz	a
 189  0080 27f8          	jreq	L34
 191  0082 20d7          	jra	L12
 226                     ; 76 void delay_ms(unsigned int milisecond){
 227                     	switch	.text
 228  0084               _delay_ms:
 230  0084 89            	pushw	x
 231       00000000      OFST:	set	0
 234                     ; 77 	counterDelay = 0;
 236  0085 5f            	clrw	x
 237  0086 bf00          	ldw	_counterDelay,x
 239  0088               L17:
 240                     ; 78 	while(counterDelay<milisecond);
 242  0088 be00          	ldw	x,_counterDelay
 243  008a 1301          	cpw	x,(OFST+1,sp)
 244  008c 25fa          	jrult	L17
 245                     ; 79 }
 248  008e 85            	popw	x
 249  008f 81            	ret
 282                     	xdef	_main
 283                     	xdef	_delay_ms
 284                     	xdef	_dataRXSPI
 285                     	xdef	_counterDelay
 286                     	xref	_TIM1_ClearFlag
 287                     	xref	_TIM1_ITConfig
 288                     	xref	_TIM1_Cmd
 289                     	xref	_TIM1_TimeBaseInit
 290                     	xref	_SPI_GetFlagStatus
 291                     	xref	_SPI_ReceiveData
 292                     	xref	_SPI_SendData
 293                     	xref	_SPI_Cmd
 294                     	xref	_SPI_Init
 295                     	xref	_SPI_DeInit
 296                     	xref	_GPIO_WriteHigh
 297                     	xref	_GPIO_Init
 298                     	xref	_CLK_HSIPrescalerConfig
 317                     	end
