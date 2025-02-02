# UNAM-Tesis-TodoEnUno

Ejemplo del formato final creado en [este enlace](https://github.com/santi-rios/UNAM-Tesis-TodoEnUno/blob/main/unam-quarto/template.pdf)

Más de mi en [este enlace](https://santi-rios.github.io/). Conoce mis cursos en de estadística en R en [este enlace](https://orcaasesina.com/).

## ¿Qué es esta plantilla?

Esta plantilla es una solución "todo en uno"para la escritura de tesis de licenciatura, maestría o doctorado en la Facultad de Ciencias de la UNAM. La plantilla utiliza docker para instalar y configurar todos los paquetes necesarios para compilar la tesis SIN necesidad de instalar nada en tu computadora (más allá de docker). La plantilla incluye un ejemplo de tesis de posgrado en la Facultad de Ciencias de la UNAM.

## ¿Que contiene la plantilla?

La plantilla instala y configurar los siguientes programas:
- Quarto. Este es el motor de la plantilla. Quarto es un sistema de escritura de documentos científicos que permite la escritura de documentos en formato markdown y la generación de documentos en formato PDF, HTML y EPUB.
- latex (tinytex). Este es un motor de LaTeX que permite la generación de documentos en formato PDF con el formato de tesis de la Facultad de Ciencias de la UNAM. En general, NO es necesario escribir nada en latex, ya que la plantilla utiliza Quarto para generar el documento en formato LaTeX. Sin embargo, si se desea, se puede escribir en LaTeX directamente.
- `r`. Lenguajes de programación que se utiliza para realizar análisis de datos y gráficos. La plantilla incluye ejemplos de cómo utilizar este lenguaje para realizar análisis de datos y gráficos. Además, contiene paquetes esenciales para la realización de análisis de datos y gráficos, como `ggplot2`, `dplyr`, `tidyr`, `readr`, `knitr`, `rmarkdown`. recuerda que NO es necesario saber programar en `r` para utilizar la plantilla.

## Ventaajas de la plantilla

- No es necesario instalar nada en tu computadora (más allá de docker).
- La plantilla incluye un ejemplo de tesis de posgrado en la Facultad de Ciencias de la UNAM.
- La plantilla incluye ejemplos de cómo utilizar `r` para realizar análisis de datos y gráficos.
- La plantilla incluye ejemplos de cómo utilizar `Quarto` para escribir documentos científicos.
- La plantilla incluye ejemplos de cómo utilizar `LaTeX` para escribir documentos científicos.
- La plantilla incluye ejemplos de cómo utilizar `Markdown` para escribir documentos científicos.
- La plantilla crea un archivo PDF con el formato de tesis de la Facultad de Ciencias de la UNAM y un archivo en formato docx (word) en caso de que se requiera.

## ¿Cómo utilizar la plantilla?

No necesitas instalar nada en tu computadora, ya que todo se ejecutará dentro de un contenedor de Docker. Solo sigue los pasos a continuación.

### **1. Requisitos Previos**

Antes de comenzar, asegúrate de tener instalado lo siguiente en tu computadora con Windows:
1. **Docker Desktop**:
   - Descárgalo desde [aquí](https://www.docker.com/products/docker-desktop/).
   - Instálalo siguiendo las instrucciones en pantalla.
   - Una vez instalado, abre Docker Desktop y déjalo corriendo en segundo plano.
2. **Visual Studio Code (VS Code)**:
   - Descárgalo desde [aquí](https://code.visualstudio.com/).
   - Instálalo siguiendo las instrucciones en pantalla.
3. **Extensión de VS Code para Docker**:
   - Abre VS Code.
   - Ve a la pestaña "Extensiones" (icono de cuadros en el menú izquierdo).
   - Busca e instala la extensión llamada **Remote - Containers**.

### **2. Descargar la Plantilla de Tesis**

1. Abre tu navegador y ve al repositorio de GitHub donde está alojada la plantilla.
2. Haz clic en el botón verde "Code" y selecciona "Download ZIP" para descargar la plantilla.
3. Extrae el archivo ZIP en una carpeta de tu computadora (por ejemplo, en `Documentos/Tesis`).


### **3. Abrir la Plantilla en VS Code**
1. Abre VS Code.
2. Haz clic en `File > Open Folder...` y selecciona la carpeta donde extrajiste la plantilla (por ejemplo, `Documentos/Tesis`).
3. Una vez abierta la carpeta, VS Code detectará automáticamente la configuración de Docker y te preguntará si deseas abrir el proyecto en un contenedor. Haz clic en **"Reopen in Container"**.

> **Nota**: La primera vez que hagas esto, Docker descargará e instalará todas las dependencias necesarias. Esto puede tardar unos minutos.

### **4. Estructura de la Plantilla**
Dentro de VS Code, verás una estructura de carpetas similar a esta:

```
tesis/
├── references.bib       # Archivo de referencias bibliográficas
├── template.qmd           # Archivo principal de la tesis
├── presentacion.qmd           # Archivo principal de la presentación
```


### **5. Editar la Tesis**

1. **Editar el contenido**:
   - Abre el archivo `template.qmd` para editar el contenido principal de la tesis.
2. **Agregar referencias**:
   - Las referencias bibliográficas se gestionan en el archivo `references.bib`. Puedes agregar nuevas referencias en formato BibTeX.
3. **Personalizar la configuración**:
   - El archivo contiene en el inicio la configuración de la tesis (formato, metadatos, opciones de PDF/HTML, etc.). Modifícalo según las especificaciones de tu universidad, tu nombre, tus tutores, etc. Cuando termines, guarda los cambios (`Ctrl + S`). Esto actualizará automáticamente los datos de tu tesis.

### **6. Compilar la Tesis**
Una vez que hayas editado el contenido, puedes compilar la tesis en formato PDF y docx (Word) siguiendo estos pasos:

1. En VScode, presiona `F1` para abrir el menú de comandos mientras estás en el archivo `template.qmd`.
2. Escribe `Quarto: Render Document` y selecciona la opción `Quarto Render All declared Formats` para compilar la tesis en PDF y docx. En este menú también puedes seleccionar solo PDF o docx si lo prefieres.


### **7. Ver el Resultado**
1. Haz clic derecho sobre el archivo generado (`template.pdf` o `template.docx`) y selecciona **"Reveal in File Explorer"** para abrir la carpeta en el Explorador de Windows.
3. Abre el archivo para ver el resultado final.

### **8. Apagar el Contenedor**
Cuando termines de trabajar:
1. Cierra VS Code.
2. Abre Docker Desktop y detén el contenedor desde la interfaz gráfica (o usa el comando `docker stop <nombre_del_contenedor>` en la terminal).

## **Preguntas Frecuentes**
1. **¿Qué hago si Docker no se inicia?**
   - Asegúrate de que Docker Desktop esté instalado y corriendo. Reinicia tu computadora si es necesario.
2. **¿Cómo actualizo la plantilla?**
   - Si hay una nueva versión de la plantilla en GitHub, descárgala y reemplaza los archivos en tu carpeta local.
3. **¿Puedo usar esta plantilla sin Docker?**
   - Sí, pero necesitarás instalar Quarto, R y LaTeX manualmente en tu computadora. Docker simplifica este proceso.


## **Soporte**
Si tienes problemas o preguntas, no dudes en contactarme o abrir una discusión/reporte en github.

## Licencia

Este proyecto está bajo la licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles. Si usas o modificas esta plantilla, por favor incluye una atribución a Santiago García-Ríos y un enlace a este repositorio.

## Plantillas de revistas científicas

Pueden usar las plantillas oficiales de quarto escribiendo en la terminal el formato deseado:

```bash
quarto use template quarto-journals/acm
quarto use template quarto-journals/plos
quarto use template quarto-journals/elsevier
quarto use template quarto-journals/acs
quarto use template quarto-journals/jss
```
