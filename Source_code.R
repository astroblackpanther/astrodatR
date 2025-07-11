#Acá instalé los paquetes que necesito para construir el algoritmo, con su datasets y los gráficos

install.packages("ggplot2") 
install.packages("caret")
install.packages("lattice") 
install.packages("astrodatR", dependencies = TRUE)

# Ahora cargo las librerías que instalé
library(ggplot2) # Preparo ggplot2 para usarlo
library(caret) # Cargo caret para algunas operaciones con mi dataset
library(astrodatR) # Cargo el paquete de astrodatR para acceder a los datos de abundacias estelares y planetas (Stellar abundances and planets)

# Traigo el conjunto de datos 'censor_Be' del paquete astrodatR
data("censor_Be")

# Limpio los datos para asegurarme de que estén en buena forma
clean_data <- na.omit(censor_Be) # Elimino cualquier fila con valores faltantes

# Selecciono solo las columnas que contienen números para mi análisis porque mi algoritmo es de regresión
numeric_data <- clean_data[, sapply(clean_data, is.numeric)]

# Aqui básicamente calculo la correlación entre las variables con la ayuda de la matriz de correlación de Pearson
correlation_matrix <- cor(numeric_data)

# Busco columnas con varianza cero, que podrían causar problemas en el momento del análisis
zero_variance_cols <- sapply(numeric_data, function(x) var(x) == 0)

# Elimino las columnas con varianza cero para mantener solo las relevantes
numeric_data_filtered <- numeric_data[, !zero_variance_cols]

# Luego recalculo la matriz de correlación con los datos ya filtrados
correlation_matrix <- cor(numeric_data_filtered)

# Imprimo la matriz de correlación para observar las relaciones entre mis variables
print(correlation_matrix)

# Ya aquí hago la regresión lineal simple para entender mejor una relación entre dos variables
simple_lm <- lm(clean_data[,3] ~ clean_data[,6]) # En este caso decidí usar la tercera columna como variable dependiente y la sexta como independiente

# Creo un gráfico con ggplot para visualizar la regresión lineal simple
ggplot(clean_data, aes(x = clean_data[,6], y = clean_data[,3])) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Simple Linear Regression", x = "Independent Variable", y = "Dependent Variable")

# Ya luego hago la regresión lineal múltiple para considerar más variables en mi modelo
multiple_lm <- lm(clean_data[,3] ~ clean_data[,6] + clean_data[,8])

# Y ya por último hago la gráfica de la regresión lineal múltiple usando el comando plot
plot(multiple_lm)

