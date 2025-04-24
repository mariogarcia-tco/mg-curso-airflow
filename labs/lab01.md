###  **Ejemplo 1: `hello_airflow.py`**
Un DAG simple que ejecuta dos comandos `echo` en orden.

```python
from datetime import datetime
from airflow import DAG
from airflow.operators.bash import BashOperator

with DAG(
    dag_id="hello_airflow",
    start_date=datetime(2024, 1, 1),
    schedule_interval="@daily",
    catchup=False,
    tags=["basic"],
) as dag:

    start = BashOperator(
        task_id="start",
        bash_command='echo "Hola desde Airflow 🛫"',
    )

    end = BashOperator(
        task_id="end",
        bash_command='echo "DAG finalizado "',
    )

    start >> end
```



###  **Ejemplo 2: `python_task_example.py`**
Muestra cómo ejecutar una función Python dentro de una tarea.

```python
from datetime import datetime
from airflow import DAG
from airflow.operators.python import PythonOperator

def saludar():
    print(" ¡Hola, esto es una tarea en Python!")

with DAG(
    dag_id="python_task_example",
    start_date=datetime(2024, 1, 1),
    schedule_interval="@daily",
    catchup=False,
    tags=["basic"],
) as dag:

    greet = PythonOperator(
        task_id="saludar",
        python_callable=saludar,
    )
```



###  **Ejemplo 3: `branching_example.py`**
Uso básico de `BranchPythonOperator` para decidir qué camino seguir.

```python
from datetime import datetime
from airflow import DAG
from airflow.operators.python import PythonOperator, BranchPythonOperator
from airflow.operators.empty import EmptyOperator

def elegir_ruta():
    import random
    return "tarea_A" if random.choice([True, False]) else "tarea_B"

with DAG(
    dag_id="branching_example",
    start_date=datetime(2024, 1, 1),
    schedule_interval="@daily",
    catchup=False,
    tags=["basic", "branching"],
) as dag:

    start = BranchPythonOperator(
        task_id="decidir",
        python_callable=elegir_ruta,
    )

    tarea_A = EmptyOperator(task_id="tarea_A")
    tarea_B = EmptyOperator(task_id="tarea_B")
    fin = EmptyOperator(task_id="fin")

    start >> [tarea_A, tarea_B] >> fin
```



##  ¿Cómo probarlos?

1. Colocá cada archivo `.py` en tu carpeta `dags/`.
2. En la UI de Airflow ([http://localhost:8080](http://localhost:8080)):
   - Activá cada DAG.
   - Hacé clic en  (Trigger DAG).
   - Observá los logs de ejecución.
