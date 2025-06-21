# Função para calcular a média das temperaturas
def calcular_media_temperatura(arquivo):
    try:
        # Abre o arquivo para leitura
        with open(arquivo, 'r') as f:
            # Lê todas as linhas e converte cada linha em float
            temperaturas = [float(linha.strip()) for linha in f.readlines() if linha.strip()]
        
        # Calcula a média das temperaturas
        media_temperatura = sum(temperaturas) / len(temperaturas) if temperaturas else 0
        
        # Exibe o resultado
        print(f'Média das temperaturas: {media_temperatura:.2f}°C')
        
    except FileNotFoundError:
        print(f'O arquivo {arquivo} não foi encontrado.')
    except Exception as e:
        print(f'Ocorreu um erro: {e}')

# Nome do arquivo com as temperaturas
arquivo = 'temperaturas_cpu.txt'

# Chama a função para calcular e exibir a média
calcular_media_temperatura(arquivo)

