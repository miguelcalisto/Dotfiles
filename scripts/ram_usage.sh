#!/bin/bash

# Obtém o uso da memória RAM em KB
mem_used=$(free -k | grep Mem | awk '{print $3}')

# Converte a memória usada para GB
mem_used_gb=$(echo "scale=2; $mem_used / 1024 / 1024" | bc)

# Exibe apenas o uso da memória em GB em negrito
echo  " <b>RAM: ${mem_used_gb}GB</b> "

#outra forma
#!/bin/bash

# Obtém o uso da memória RAM em KB
#mem_used=$(free -kh | grep Mem | awk '{print $3}')

# Converte a memória usada para GB
#mem_used_gb=$(echo "scale=2; $mem_used 1024 / 1024" | bc)

#mem_used_gb=$(echo $mem_used )

# Exibe apenas o uso da memória em GB em negrito
#echo  " <b>RAM: ${mem_used_gb}</b> "
