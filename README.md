# Prueba de desarrollo wigilabs

## Antes de que empieces
Deberás crear un repositorio privado de GitHub utilizando la información que proporcionamos en este archivo README e invitar como colaboradores: @jsngonzalez
Si tienes dudas puede escribir a: jgonzalez@wigilabs.com

## La prueba
Crea una aplicación en Flutter simple para contar cosas. Deberás cumplir con las altas expectativas de calidad y funcionalidad. Debes cumplir al menos con lo siguiente:

* Agregar un contador con nombre a una lista de contadores.
* Incrementar cualquiera de los contadores.
* Disminuir cualquiera de los contadores.
* Eliminar un contador.
* Mostrar una suma de todos los valores del contador.
* Datos persistentes de vuelta al servidor.
* No debe **sentirse** como un ejercicio de aprendizaje. Piensa que estás construyendo esto para la App Store.

Notas:

* Mostrar las capacidades de maquetacion y creacion de elementos personalizados es **esencial**.
* El internet no es confiable. Manejar errores.
* Esta no es una prueba de fondo, no haga que requiera ninguna base de datos.

Puntos extra:

* No use ninguna dependencia externa.
* Controladores de vista livianos.
* Mostrando algunos conocimientos básicos de animación.

Un posible diseño de aplicación podría ser:

```
+--------------------------------+
| [Editar]    nombreApp      [+] |
+--------------------------------+
+--------------------------------+
| Cafe                   5 [-|+] |
| Mayonesa               1 [-|+] |
| ensalada              15 [-|+] |
+--------------------------------+
+--------------------------------+
|                      Total: 21 |
+--------------------------------+
```

**Recuerda**: la interfaz de usuario es muy importante. En caso de duda, use elementos UIKit nativos. No construyas nada que no se sienta bien para iOS.

## Para instalar el servidor
Primero debes instalar node (https://bit.ly/nodejswg) si ya lo tienes instalado, puedes continuar.

```
$ git clone https://github.com/jsngonzalez/prueba-esarrollo-flutter-WG.git
$ cd prueba-esarrollo-flutter-WG
$ npm install
$ npm start
```

## API endpoints / ejemplos

Los siguientes endpoints esperan un contenido `Content-Type: application/json` 

```
GET /api/v1/counters
Response:
[
]

POST /api/v1/counter
Body: { "title": "Cafe" }
Response:
[
	{ "id": "adsf", "title": "Cafe", count: 0 }
]

POST /api/v1/counter
Body: { "title": "Pan" }
Response:
[
	{ "id": "asdf", "title": "Cafe", count: 0 },
	{ "id": "qwer", "title": "Pan", count: 0 }
]

POST /api/v1/counter/inc
Body: { "id": "asdf" }
Response:
[
	{ "id": "asdf", "title": "Cafe", count: 1 },
	{ "id": "qwer", "title": "Pan", count: 0 }
]

POST /api/v1/counter/dec
Body: { "id": "qwer"}
Response:
[
	{ "id": "asdf", "title": "Cafe", count: 1 },
	{ "id": "qwer", "title": "Pan", count: -1 }
]

DELETE /api/v1/counter
Body: { "id": "qwer" }
Response:
[
	{ "id": "asdf", "title": "Cafe", count: 1 }
]

GET /api/v1/counters
Response:
[
	{ "id": "asdf", "title": "Cafe", count: 1 },
]
```

*NOTA:* Cada solicitud devuelve el estado actual de todos los contadores.

---

![](https://blueprint-api-production.s3.amazonaws.com/uploads/card/image/812164/da629eac-23be-4894-b625-3e9919bc60b3.png)

_"Buena suerte."_
