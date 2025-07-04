# 🧪 Actividad 3 - Clean Architecture y Pruebas Unitarias

Este proyecto implementa un CRUD básico aplicando el patrón de **Arquitectura Limpia** con Java y Maven. Se incluyen pruebas unitarias con **JUnit 4** utilizando la metodología **AAA (Arrange – Act – Assert)**.

---

## ✨ Funcionalidades Implementadas (1.1)

- ✅ Crear un ítem  
- ✅ Consultar ítem por ID  
- ✅ Consultar todos los ítems  
- ✅ Actualizar ítem  
- ✅ Eliminar ítem  

> Todas las operaciones están organizadas siguiendo principios **SOLID** y diseño limpio: **bajo acoplamiento**, **alta cohesión** y **separación de responsabilidades**.

---

## 🧱 Arquitectura del Proyecto

El proyecto sigue la estructura de **Clean Architecture**, dividida en capas:

- `domain`: contiene la lógica de negocio y las entidades.
- `usecase`: contiene los servicios y lógica de aplicación.
- `infrastructure` (en este caso `mi-app`): contiene la clase `App.java`, que actúa como punto de entrada.

---

## 🧪 Pruebas Unitarias (1.2)

Se implementaron pruebas en `ItemServiceTest.java` usando **JUnit 4**, aplicando el enfoque AAA:

- `testCreateAndReadItem()`
- `testUpdateItem()`
- `testDeleteItem()`
- `testReadAllItems()`

> ✅ Todas las pruebas pasaron correctamente usando `mvn test`.

---

## 💻 Instrucciones para ejecutar

📅 *Actualizado el 4 de julio de 2025*

1. Clona el repositorio:
   ```bash
   git clone https://github.com/Jesussantander00/actividad-3-clean-architecture.git
   cd actividad-3-clean-architecture/mi-app
