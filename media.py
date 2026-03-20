def calcular_media_temperatura(arquivo):
    try:
        with open(arquivo, "r") as f:
            temperaturas = [
                    float(linha.strip()) for linha in f.readlines() if linha.strip()
                    ]

        media_temperatura = sum(temperaturas) / len(temperaturas) if temperaturas else 0

        print(f"Média das temperaturas: {media_temperatura:.2f}°C")

    except FileNotFoundError:
        print(f"O arquivo {arquivo} não foi encontrado.")
    except Exception as e:
        print(f"Ocorreu um erro: {e}")


arquivo = "temperaturas_cpu.txt"

calcular_media_temperatura(arquivo)
