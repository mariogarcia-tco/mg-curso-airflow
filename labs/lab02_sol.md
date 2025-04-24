##  **Solución Ejercicio 1: Flujo con tareas paralelas y cierre común**

```python
from airflow import DAG
from airflow.operators.empty import EmptyOperator
from datetime import datetime

with DAG(
    dag_id='solucion_ejercicio_1_paralelismo',
    start_date=datetime(2024, 1, 1),
    schedule_interval=None,
    catchup=False
) as dag:
    inicio = EmptyOperator(task_id='inicio')
    
    verificacion_a = EmptyOperator(task_id='verificacion_a')
    verificacion_b = EmptyOperator(task_id='verificacion_b')
    verificacion_c = EmptyOperator(task_id='verificacion_c')
    
    conclusion = EmptyOperator(task_id='conclusion')

    inicio >> [verificacion_a, verificacion_b, verificacion_c] >> conclusion
```

---

##  **Solución Ejercicio 2: Árbol de decisiones con múltiples niveles**

```python
from airflow import DAG
from airflow.operators.empty import EmptyOperator
from datetime import datetime

with DAG(
    dag_id='solucion_ejercicio_2_arbol',
    start_date=datetime(2024, 1, 1),
    schedule_interval=None,
    catchup=False
) as dag:
    entrada = EmptyOperator(task_id='entrada')
    
    ruta_a = EmptyOperator(task_id='ruta_a')
    ruta_b = EmptyOperator(task_id='ruta_b')

    sub_a1 = EmptyOperator(task_id='sub_a1')
    sub_a2 = EmptyOperator(task_id='sub_a2')
    
    sub_b1 = EmptyOperator(task_id='sub_b1')
    sub_b2 = EmptyOperator(task_id='sub_b2')
    sub_b3 = EmptyOperator(task_id='sub_b3')

    entrada >> [ruta_a, ruta_b]
    
    ruta_a >> [sub_a1, sub_a2]
    ruta_b >> [sub_b1, sub_b2, sub_b3]
```

---

##  **Solución Ejercicio 3: Pipeline con pasos obligatorios y condicionales**

```python
from airflow import DAG
from airflow.operators.empty import EmptyOperator
from datetime import datetime

with DAG(
    dag_id='solucion_ejercicio_3_condicionales',
    start_date=datetime(2024, 1, 1),
    schedule_interval=None,
    catchup=False
) as dag:
    inicio = EmptyOperator(task_id='inicio')
    proceso_principal = EmptyOperator(task_id='proceso_principal')

    tarea_comun = EmptyOperator(task_id='tarea_comun')
    tarea_condicional = EmptyOperator(task_id='tarea_condicional')

    cierre = EmptyOperator(task_id='cierre')

    inicio >> proceso_principal
    proceso_principal >> [tarea_comun, tarea_condicional]
    [tarea_comun, tarea_condicional] >> cierre
```
 