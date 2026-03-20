import matplotlib.pyplot as plt

arquivo = "temperaturas_cpu.txt"

faixas = {
        "MENOR QUE 50": lambda t: t <= 50,
        "50 - 55": lambda t: 50 < t <= 55,
        "55 - 60": lambda t: 55 < t <= 60,
        "60 - 65": lambda t: 60 < t <= 65,
        "65 - 70": lambda t: 65 < t <= 70,
        "70 - 75": lambda t: 70 < t <= 75,
        "75 - 80": lambda t: 75 < t <= 80,
        "80 - 85": lambda t: 80 < t <= 85,
        "85 - 90": lambda t: 85 < t <= 90,
        "90 - 100": lambda t: 90 < t <= 100,
        }

contagem = {faixa: 0 for faixa in faixas}

try:
    with open(arquivo, "r") as f:
        temperaturas = [float(l.strip()) for l in f if l.strip()]

    for temp in temperaturas:
        for faixa, condicao in faixas.items():
            if condicao(temp):
                contagem[faixa] += 1
                break

    total = len(temperaturas)

    contagem = {k: v for k, v in contagem.items() if v > 0}

    labels = [f"{k} ({v} - {v / total * 100:.1f}%)" for k, v in contagem.items()]
    valores = list(contagem.values())

    plt.figure(figsize=(8, 8))
    plt.pie(valores, labels=labels, autopct="%1.1f%%", startangle=140)
    plt.title("Distribuição das Temperaturas Médias da CPU")
    plt.axis("equal")
    plt.tight_layout()
    plt.show()

except FileNotFoundError:
    print(f"Arquivo '{arquivo}' não encontrado.")
except Exception as e:
    print(f"Ocorreu um erro: {e}")
