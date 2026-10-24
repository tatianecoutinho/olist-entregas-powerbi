[🇧🇷 Português](README.md) | 🇪🇸 Español

# Entregas en el e-commerce brasileño (Olist, 2016-2018)

Análisis de retrasos, fletes y satisfacción del cliente en pedidos del e-commerce brasileño, con SQL para la extracción y agregación de los datos y Power BI para la visualización.

(images/dashboard.png)

## Pregunta de negocio
¿Dónde se retrasan más las entregas, cuánto pesa el flete en cada región y cómo afecta el retraso a la nota que da el cliente?

## Principales hallazgos
- Los pedidos retrasados reciben una nota media de **2,57**, frente a **4,29** de los entregados a tiempo (una caída de ~40%).
- El **7,99%** de los pedidos llega con retraso. Los mayores porcentajes están en el Nordeste: AL (23,9%), MA (19,7%) y PI (16,0%), frente al 5,9% de SP.
- El flete medio va de **R$ 15,11 (SP)** a **R$ 43,09 (PB y RR)**.
- Cuando el vendedor está en el mismo estado que el cliente, el flete medio es de **R$ 13,46**, frente a **R$ 23,69** si está en otro estado (~43% menos).
- Cerca del **60% de los vendedores** está en SP (1.849 de 3.095).

## Herramientas
- **SQL (SQLite, con DB Browser)**: limpieza, unión de tablas y agregaciones
- **Power BI**: modelado, medidas DAX y dashboard

## Estructura del repositorio
- `sql/`: consultas usadas para generar las tablas agregadas
- `data/`: tablas agregadas (CSV) usadas en el dashboard
- `images/`: imagen del dashboard
- `olist_entregas.pbix`: archivo de Power BI (abrir con Power BI Desktop)

## Cómo usarlo
1. Descarga el archivo `olist_entregas.pbix`.
2. Ábrelo con Power BI Desktop (gratuito, solo Windows).


## Fuente de los datos
Dataset público "Brazilian E-Commerce Public Dataset by Olist" (Kaggle).

## Autor
[TATIANE COUTINHO DE PAULA] · [www.linkedin.com/in/tatiane-de-paula-526609412]
