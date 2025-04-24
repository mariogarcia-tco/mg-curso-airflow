## **Ejercicio 1: Flujo con tareas paralelas y cierre común**

### Consigna:
Creá un DAG que tenga la siguiente lógica:

- Una tarea inicial llamada `inicio`.
- Tres tareas paralelas que se ejecutan después de `inicio`: `verificacion_a`, `verificacion_b` y `verificacion_c`.
- Todas deben completarse para poder ejecutar la tarea final `conclusion`.

### Diagrama esperado:
```
                     --> [verificacion_a] --
[inicio] -----------|--> [verificacion_b] --> [conclusion]
                     --> [verificacion_c] --
```

---

## **Ejercicio 2: Árbol de decisiones con múltiples niveles**

### Consigna:
Simulá un flujo tipo árbol de decisión:

- El nodo raíz se llama `entrada`.
- Desde `entrada` deben bifurcarse dos ramas: `ruta_a` y `ruta_b`.
- `ruta_a` se divide en dos tareas: `sub_a1` y `sub_a2`.
- `ruta_b` se divide en tres tareas: `sub_b1`, `sub_b2`, y `sub_b3`.

### Diagrama esperado:
```
                     [entrada]
                    /         \
             [ruta_a]         [ruta_b]
              /    \         /    |    \
        [sub_a1] [sub_a2] [sub_b1][sub_b2][sub_b3]
```

---

## **Ejercicio 3: Pipeline con pasos obligatorios y condicionales**

### Consigna:
Armá un DAG que represente este flujo:

1. Una tarea inicial `inicio`.
2. Una tarea intermedia `proceso_principal`.
3. Desde ahí, dos caminos:
   - Uno siempre se ejecuta: `tarea_comun`.
   - Otro se ejecuta solo si es necesario: `tarea_condicional`.
4. Ambas tareas deben finalizar antes de `cierre`.

### Diagrama esperado:
```
[inicio] --> [proceso_principal]
                  |        \
        [tarea_comun]   [tarea_condicional]
                  \        /
                  [cierre]
```

 