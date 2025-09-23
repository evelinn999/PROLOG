## Funciones Aritméticas

| Función | Descripción | Argumentos |
|---------|-------------|------------|
| `+` | Suma números | `(&rest numbers)` |
| `-` | Resta números | `(number &rest more-numbers)` |
| `*` | Multiplica números | `(&rest numbers)` |
| `/` | Divide números | `(number &rest more-numbers)` |
| `=` | Igualdad numérica | `(number &rest more-numbers)` |
| `<` | Menor que | `(number &rest more-numbers)` |
| `>` | Mayor que | `(number &rest more-numbers)` |
| `<=` | Menor o igual que | `(number &rest more-numbers)` |
| `>=` | Mayor o igual que | `(number &rest more-numbers)` |
| `abs` | Valor absoluto | `(number)` |
| `sqrt` | Raíz cuadrada | `(number)` |
| `expt` | Exponenciación | `(base-number power-number)` |

## Funciones de Listas

| Función | Descripción | Argumentos |
|---------|-------------|------------|
| `car` | Primer elemento de una lista | `(list)` |
| `cdr` | Resto de la lista (sin el primer elemento) | `(list)` |
| `cons` | Construye una nueva cons cell | `(object list)` |
| `list` | Crea una lista | `(&rest objects)` |
| `append` | Concatena listas | `(&rest lists)` |
| `length` | Longitud de una secuencia | `(sequence)` |
| `reverse` | Invierte una secuencia | `(sequence)` |
| `first` | Primer elemento (equivale a car) | `(list)` |
| `second` | Segundo elemento | `(list)` |
| `third` | Tercer elemento | `(list)` |
| `last` | Última cons cell de una lista | `(list &optional n)` |
| `nth` | N-ésimo elemento de una lista | `(n list)` |
| `member` | Busca un elemento en una lista | `(item list &key test test-not key)` |

## Funciones de Predicados

| Función | Descripción | Argumentos |
|---------|-------------|------------|
| `null` | Verifica si es NIL | `(object)` |
| `atom` | Verifica si no es una cons cell | `(object)` |
| `listp` | Verifica si es una lista | `(object)` |
| `numberp` | Verifica si es un número | `(object)` |
| `stringp` | Verifica si es una string | `(object)` |
| `symbolp` | Verifica si es un símbolo | `(object)` |
| `functionp` | Verifica si es una función | `(object)` |
| `evenp` | Verifica si un número es par | `(integer)` |
| `oddp` | Verifica si un número es impar | `(integer)` |
| `zerop` | Verifica si un número es cero | `(number)` |
| `eq` | Identidad de objetos | `(obj1 obj2)` |
| `equal` | Igualdad estructural | `(obj1 obj2)` |

## Funciones de Control de Flujo

| Función | Descripción | Argumentos |
|---------|-------------|------------|
| `if` | Condicional simple | `(test then-form &optional else-form)` |
| `when` | Ejecuta formas si la condición es verdadera | `(test &body forms)` |
| `unless` | Ejecuta formas si la condición es falsa | `(test &body forms)` |
| `cond` | Condicional múltiple | `(&rest clauses)` |
| `case` | Selección por casos | `(keyform &rest clauses)` |
| `and` | Conjunción lógica | `(&rest forms)` |
| `or` | Disyunción lógica | `(&rest forms)` |
| `not` | Negación lógica | `(x)` |

## Funciones de Iteración

| Función | Descripción | Argumentos |
|---------|-------------|------------|
| `loop` | Macro de iteración versátil | `(&rest forms)` |
| `dolist` | Itera sobre elementos de una lista | `(var list-form &optional result-form) &body forms` |
| `dotimes` | Itera un número específico de veces | `(var count-form &optional result-form) &body forms` |
| `do` | Iteración general | `(var-list end-test-form &optional result-form) &body forms` |
| `mapcar` | Aplica función a elementos de listas | `(function &rest lists)` |
| `maplist` | Como mapcar pero opera en sublistas | `(function &rest lists)` |

## Funciones de I/O

| Función | Descripción | Argumentos |
|---------|-------------|------------|
| `read` | Lee una expresión | `(&optional input-stream eof-error-p eof-value recursive-p)` |
| `print` | Imprime un objeto legiblemente | `(object &optional output-stream)` |
| `prin1` | Imprime sin nueva línea | `(object &optional output-stream)` |
| `princ` | Imprime sin caracteres de escape | `(object &optional output-stream)` |
| `format` | Salida formateada | `(destination control-string &rest args)` |
| `write-line` | Escribe una línea | `(string &optional output-stream &key start end)` |

## Funciones de Definición

| Función | Descripción | Argumentos |
|---------|-------------|------------|
| `defun` | Define una función | `(name lambda-list &body forms)` |
| `defvar` | Define una variable especial | `(var &optional val doc-string)` |
| `defparameter` | Define un parámetro especial | `(var val &optional doc-string)` |
| `defconstant` | Define una constante | `(name value &optional doc-string)` |
| `defmacro` | Define una macro | `(name lambda-list &body forms)` |
| `lambda` | Crea una función anónima | `(lambda-list &body forms)` |

## Funciones de Símbolos y Strings

| Función | Descripción | Argumentos |
|---------|-------------|------------|
| `symbol-name` | Obtiene el nombre de un símbolo | `(symbol)` |
| `intern` | Interna un símbolo en un package | `(string &optional package)` |
| `make-symbol` | Crea un símbolo no internado | `(name)` |
| `string` | Convierte a string | `(x)` |
| `string-upcase` | Convierte string a mayúsculas | `(string &key start end)` |
| `string-downcase` | Convierte string a minúsculas | `(string &key start end)` |
| `concatenate` | Concatena secuencias | `(result-type &rest sequences)` |

## Funciones Adicionales Importantes

| Función | Descripción | Argumentos |
|---------|-------------|------------|
| `apply` | Aplica función a lista de argumentos | `(function &rest args)` |
| `funcall` | Llama función con argumentos dados | `(function &rest args)` |
| `eval` | Evalúa una expresión | `(form)` |
| `quote` | Evita evaluación | `(object)` |
| `setf` | Asigna valores a lugares | `(&rest pairs)` |
| `let` | Vinculación local de variables | `(bindings &body forms)` |
| `let*` | Vinculación secuencial de variables | `(bindings &body forms)` |
| `progn` | Evaluación secuencial | `(&body forms)` |
| `values` | Retorna múltiples valores | `(&rest objects)` |
| `multiple-value-bind` | Vincula múltiples valores | `(vars values-form &body forms)` |

---
