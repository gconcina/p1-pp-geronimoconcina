# 1. Usar una imagen base de Nginx muy ligera (Alpine es ideal para el tamaño)
FROM nginx:alpine

# 2. Eliminar los archivos HTML predeterminados de Nginx y reemplazarlo por nuestro contenido.
RUN rm /usr/share/nginx/html/index.html \
    && rm -rf /usr/share/nginx/html/*

# 3. Copiar TODO el contenido de nuestra carpeta local 'assets' a la raíz donde Nginx espera servir los archivos.
COPY . /usr/share/nginx/html

# 4. Exponer el puerto estándar web (Puerto 80)
EXPOSE 80

# 5. Comando por defecto: Al iniciar el contenedor, se ejecuta el servidor de Nginx
CMD ["nginx", "-g", "daemon off;"]
