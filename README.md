# Kensar Print Agent (Local)

Agente local para imprimir etiquetas SATO Easy Print sin CORS desde navegador.

## 1) Instalacion

```bash
cd /Users/kennethjaramillo/Projects/print-agent
npm install
```

## 2) Ejecutar

```bash
PORT=5177 PRINTER_URL=http://10.10.20.19:8081 npm start
```

Abre la app visual en:

```text
http://127.0.0.1:5177/ui
```

Opcional (si la impresora no responde HTTP al finalizar):

```bash
PORT=5177 PRINTER_URL=http://10.10.20.19:8081 FIRE_AND_FORGET=1 npm start
```

## 3) Endpoints principales

- `GET /health`
- `GET /config`
- `POST /config`
- `GET /printers`
- `GET /printers/discover` (escaneo LAN automatico)
- `POST /printers/select`
- `POST /print`

## 4) Flujo recomendado de configuracion

1. Entra a `http://127.0.0.1:5177/ui` y pulsa **Buscar impresoras**.

2. Elige una impresora detectada con **Usar** y luego **Guardar configuracion**.

3. Haz **Imprimir prueba**.

Tambien puedes hacerlo por API:

1. Ejecutar discovery:

```bash
curl "http://127.0.0.1:5177/printers/discover"
```

2. Elegir impresora detectada:

```bash
curl -X POST "http://127.0.0.1:5177/printers/select" \
  -H "Content-Type: application/json" \
  -d '{"url":"http://10.10.20.19:8081"}'
```

3. Imprimir desde Metrik usando:

```text
http://127.0.0.1:5177/print
```

## 5) Persistencia

El agente guarda configuracion en:

- macOS/Linux: `~/.kensar-print-agent/config.json`
- Windows: `%USERPROFILE%\\.kensar-print-agent\\config.json`

## 6) Scripts para Windows

- `scripts/windows-install.bat`: instala dependencias
- `scripts/windows-run.bat`: inicia el agente con defaults

Puedes editar `PRINTER_URL` en `scripts/windows-run.bat`.
