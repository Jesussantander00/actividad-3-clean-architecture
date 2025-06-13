# Actividad 3 - Clean Architecture y Pruebas Unitarias

Este proyecto implementa un CRUD básico con Clean Architecture usando Java y Maven.  
Se incluyen pruebas unitarias con JUnit 4 para validar cada operación.

## ✨ Funcionalidades

- Crear un item
- Leer un item por ID
- Leer todos los items
- Actualizar un item
- Eliminar un item

## 🧱 Arquitectura

El proyecto sigue el patrón de **Arquitectura Limpia**, con las siguientes capas:

- `domain`: Contiene las entidades del negocio (`Item`)
- `usecase`: Contiene la lógica de negocio (`ItemService`)
- `test`: Pruebas unitarias con JUnit (`ItemServiceTest`)

## ⚙️ Tecnologías

- Java 17
- Maven
- JUnit 4

## 🧪 Ejecutar Pruebas

```bash
mvn test
