import matplotlib.pyplot as plt


def draw_tls_sequence():
    fig, ax = plt.subplots(figsize=(10, 6))

    participants = ["Cliente", "Servidor"]
    y_pos = [5, 5]

    ax.plot([1, 1], [1, 10], color="black")
    ax.plot([5, 5], [1, 10], color="black")

    ax.text(1, 10.5, "Cliente", ha="center", fontsize=12, fontweight="bold")
    ax.text(5, 10.5, "Servidor", ha="center", fontsize=12, fontweight="bold")

    def draw_arrow(y, start_x, end_x, label):
        ax.annotate(
                label,
                xy=(end_x, y),
                xytext=(start_x, y),
                arrowprops=dict(facecolor="blue", shrink=0.05),
                ha="center",
                va="bottom",
                )

    y = 9
    step = 1.2

    draw_arrow(y, 1, 5, "Client Hello (quer conexão segura)")
    y -= step
    draw_arrow(y, 5, 1, "Server Hello + Certificado (chave pública)")
    y -= step
    draw_arrow(y, 1, 5, "Cliente verifica certificado")
    y -= step
    draw_arrow(y, 1, 5, "Cliente gera chave secreta da sessão")
    y -= step
    draw_arrow(y, 1, 5, "Cliente criptografa chave secreta c/ chave pública")
    y -= step
    draw_arrow(y, 1, 5, "Envia chave secreta criptografada")
    y -= step
    draw_arrow(y, 5, 1, "Servidor descriptografa chave secreta com chave privada")
    y -= step
    draw_arrow(y, 1, 5, "Comunicação segura c/ chave secreta compartilhada")

    ax.axis("off")
    ax.set_xlim(0, 6)
    ax.set_ylim(0, 11)
    plt.title("Diagrama Simplificado da Troca TLS")
    plt.show()


if __name__ == "__main__":
    draw_tls_sequence()
