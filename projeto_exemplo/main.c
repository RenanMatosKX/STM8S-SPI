/* MAIN.C file
 * @author Renan Araujo de Matos <renan.matos@karimex.com.br>
 * @version 1.0
 * Example - Using SPI to send "M"
 */

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
/* Private variables ---------------------------------------------------------*/
volatile unsigned int counterDelay = 0;
uint8_t dataRXSPI = 0;
/* Private function prototypes -----------------------------------------------*/
void delay_ms(unsigned int milisecond);

main()
{
	//Configura o clock em 16 MHz
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);	
	//Inicializa o Pino D0 como saida open-drain
	GPIO_Init(GPIOD,GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST );
	//Configura o timer 1 para a cada 1ms
	TIM1_TimeBaseInit(15,TIM1_COUNTERMODE_UP,999,0);
	//Configura o overflow do timer
	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);
	//Limpa a flag de overflow
	TIM1_ClearFlag(TIM1_FLAG_UPDATE);
	//Habilita timer
	TIM1_Cmd(ENABLE);
	//Habilita todas as interrupções
	enableInterrupts();
	
  /* SPI Configuração */
	 /* SPI configured as follow:
          - FirstBit = SPI_FIRSTBIT_MSB (MSB bit will be transmitted first)
          - BaudRatePrescaler = SPI_BAUDRATEPRESCALER_4 (SPI frequency = frequency(CPU)/4 )
          - Mode = SPI_MODE_MASTER (SPI Master configuration)
          - ClockPolarity =  SPI_CLOCKPOLARITY_HIGH ( Clock to 1 when idle)
          - ClockPhase = SPI_CLOCKPHASE_2EDGE (The first clock transition is the first data capture edge)
          - Data_Direction = SPI_DATADIRECTION_2LINES_FULLDUPLEX (2-line uni-directional data mode enable )
          - Slave_Management = SPI_NSS_SOFT (Software slave management disabled)
          - CRCPolynomial = 0x07 (CRC-8 grau 8 do algoritmo de detecção de erros)
   */
	
	SPI_DeInit();
	/* Inicializa SPI no modo Master */
 SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_4, SPI_MODE_MASTER, SPI_CLOCKPOLARITY_LOW, SPI_CLOCKPHASE_2EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX, SPI_NSS_SOFT, 0x07);
  	delay_ms(1000);
	/* Habilita o SPI*/
  SPI_Cmd(ENABLE);
	/* Desliga LED D0*/
	GPIO_WriteHigh(GPIOD,GPIO_PIN_0);
	
	while (1){
		
		/* Envia o dado "M" via SPI*/
		SPI_SendData((uint8_t)0x4D);
		/*Aguarda terminar o envio*/
		while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET)
		{
		}
		/*Aguarda o recebimento do dado*/
		while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET)
		{
		}
		/*Realizada a leitura do dado*/
		dataRXSPI = SPI_ReceiveData();
		/* Envia o dado recebido via SPI*/
		SPI_SendData((uint8_t)dataRXSPI);
		/*Aguarda terminar o envio*/
		while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET)
		{
		}
	}
}

void delay_ms(unsigned int milisecond){
	counterDelay = 0;
	while(counterDelay<milisecond);
}


