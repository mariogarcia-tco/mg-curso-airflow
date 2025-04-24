## **Ejemplo 1: Secuencia lineal (el más básico)**

### Concepto:
Una tarea se ejecuta después de la otra. Ideal para mostrar el orden de ejecución básico.

### Código:
```python
from airflow import DAG
from airflow.operators.empty import EmptyOperator
from datetime import datetime

with DAG(
    dag_id='ejemplo_1_lineal',
    start_date=datetime(2024, 1, 1),
    schedule_interval=None,
    catchup=False
) as dag:
    t1 = EmptyOperator(task_id='inicio')
    t2 = EmptyOperator(task_id='paso_1')
    t3 = EmptyOperator(task_id='fin')

    t1 >> t2 >> t3
```

### Diagrama:
```
[inicio] ---> [paso_1] ---> [fin]
```

---

## **Ejemplo 2: Paralelismo simple**

### Concepto:
Una tarea se bifurca en múltiples tareas que corren en paralelo, luego se puede unir.

### Código:
```python
from airflow import DAG
from airflow.operators.empty import EmptyOperator
from datetime import datetime

with DAG(
    dag_id='ejemplo_2_paralelo',
    start_date=datetime(2024, 1, 1),
    schedule_interval=None,
    catchup=False
) as dag:
    inicio = EmptyOperator(task_id='inicio')
    tarea_1 = EmptyOperator(task_id='tarea_1')
    tarea_2 = EmptyOperator(task_id='tarea_2')
    fin = EmptyOperator(task_id='fin')

    inicio >> [tarea_1, tarea_2] >> fin
```

### Diagrama:
```
             --> [tarea_1] -->
[inicio] ---|                  |--> [fin]
             --> [tarea_2] -->
```

---

## **Ejemplo 3: Árbol de decisiones**

### Concepto:
Un nodo raíz se divide en ramas, y cada rama tiene sus propias hojas.

### Código:
```python
from airflow import DAG
from airflow.operators.empty import EmptyOperator
from datetime import datetime

with DAG(
    dag_id='ejemplo_3_arbol',
    start_date=datetime(2024, 1, 1),
    schedule_interval=None,
    catchup=False
) as dag:
    raiz = EmptyOperator(task_id='raiz')
    rama_izq = EmptyOperator(task_id='rama_izquierda')
    rama_der = EmptyOperator(task_id='rama_derecha')
    hoja_1 = EmptyOperator(task_id='hoja_1')
    hoja_2 = EmptyOperator(task_id='hoja_2')
    hoja_3 = EmptyOperator(task_id='hoja_3')

    raiz >> [rama_izq, rama_der]
    rama_izq >> [hoja_1, hoja_2]
    rama_der >> hoja_3
```

### Diagrama:
```
                    [raiz]
                   /     \
        [rama_izquierda] [rama_derecha]
           /     \             \
     [hoja_1]  [hoja_2]      [hoja_3]
```

---

## **Ejemplo 4: Control de etapas (etapas en paralelo con join final)**

### Concepto:
Cada etapa del proceso se ejecuta en paralelo, luego todas deben terminar para continuar.

### Código:
```python
from airflow import DAG
from airflow.operators.empty import EmptyOperator
from datetime import datetime

with DAG(
    dag_id='ejemplo_4_etapas',
    start_date=datetime(2024, 1, 1),
    schedule_interval=None,
    catchup=False
) as dag:
    inicio = EmptyOperator(task_id='inicio')
    etapa_1 = EmptyOperator(task_id='etapa_1')
    etapa_2 = EmptyOperator(task_id='etapa_2')
    etapa_3 = EmptyOperator(task_id='etapa_3')
    union = EmptyOperator(task_id='union')
    fin = EmptyOperator(task_id='fin')

    inicio >> [etapa_1, etapa_2, etapa_3] >> union >> fin
```

### Diagrama:
```
                  --> [etapa_1] -->
[inicio] --------|--> [etapa_2] --> [union] --> [fin]
                  --> [etapa_3] -->
```

---

## **Ejemplo 5: Pipeline complejo con etapas, bifurcaciones y recolección**

### Concepto:
Simula un proceso tipo ETL: extracción, transformación en paralelo, combinación y carga final.

### Código:
```python
from airflow import DAG
from airflow.operators.empty import EmptyOperator
from datetime import datetime

with DAG(
    dag_id='ejemplo_5_pipeline_complejo',
    start_date=datetime(2024, 1, 1),
    schedule_interval=None,
    catchup=False
) as dag:
    inicio = EmptyOperator(task_id='inicio')
    extraccion = EmptyOperator(task_id='extraccion')

    transformacion_1 = EmptyOperator(task_id='transformacion_1')
    transformacion_2 = EmptyOperator(task_id='transformacion_2')
    transformacion_3 = EmptyOperator(task_id='transformacion_3')

    union_transformaciones = EmptyOperator(task_id='union_transformaciones')
    carga = EmptyOperator(task_id='carga')
    fin = EmptyOperator(task_id='fin')

    inicio >> extraccion
    extraccion >> [transformacion_1, transformacion_2, transformacion_3]
    [transformacion_1, transformacion_2, transformacion_3] >> union_transformaciones
    union_transformaciones >> carga >> fin
```

### Diagrama:
```
[inicio] --> [extraccion]
                 |
         ------------------------
         |          |          |
 [transform_1] [transform_2] [transform_3]
         \          |          /
         ---------[union]---------
                   |
                [carga]
                   |
                 [fin]
```

 