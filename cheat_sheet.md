#  Airflow DAG Structures – Cheat Sheet

### 1. **Secuencia**

#### Código:
```python
t1 >> t2 >> t3
```

#### Diagrama:
```
[t1] ---> [t2] ---> [t3]
```

---

### 2. **Paralelo**

#### Código:
```python
t1 >> [t2, t3, t4]
```

#### Diagrama:
```
             --> [t2] 
[t1] -------|--> [t3] 
             --> [t4]
```

---

### 3. **Bifurcación**

#### Código:
```python
branch >> [ruta_a, ruta_b]
```

#### Diagrama:
```
              --> [ruta_a]
[branch] ----|
              --> [ruta_b]
```

---

### 4. **Join**

#### Código:
```python
[t2, t3, t4] >> t5
```

#### Diagrama:
```
[t2] \
[t3] ---> [t5]
[t4] /
```

---

## 5. **Ejemplo Complejo: Pipeline con bifurcación, paralelismo y cierre**

### Código:
```python
inicio >> preproceso

preproceso >> [limpieza, validacion]

[limpieza, validacion] >> procesamiento

procesamiento >> [generar_pdf, enviar_email]

[generar_pdf, enviar_email] >> fin
```

### Diagrama:
```
[inicio] ---> [preproceso]
                   |
          ---------------------
          |                   |
     [limpieza]         [validacion]
          \                   /
          -----> [procesamiento] -----
                                 |     \
                             [pdf]   [email]
                                 \     /
                                  [fin]
```

 