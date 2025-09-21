%Se desea gestionar el precio de productos de un supermercado. Cada producto tiene un nombre, un precio y una categoría.
% 1. Crear la base de conocimientos con al menos 6 productos, asignando nombres, precios y categorías (por ejemplo, ‘E’, ‘F’, etc.).
% 2. Implementar un predicado recursivo “aumento_productos” que aplique un aumento del 5% a todos los productos de la categoría E, actualizando sus precios en la base de hechos utilizando retract y assert.
% 3. Mostrar en pantalla el nombre del producto, su nuevo precio y su categoría. Asegurarse de que todos los productos de la categoría E sean actualizados correctamente y que los productos de otras categorías queden igual.
:- dynamic producto/3.

producto(queso,      950, e).
producto(jamon,     1200, f).
producto(fideos,     450, e).
producto(aceite,    1300, g).
producto(gaseosa,    700, e).
producto(mayonesa,   680, f).
producto(miel,       520, g).
producto(helado,    1100, e).

% Caso general: existe en la base de conocimiento un producto de categoria e
aumento_productos :-
    retract(producto(X,Y,e)),       % elimina un producto e
    Y1 is Y * 1.05,                 % calcula el nuevo precio
    assert(producto(X,Y1,e)),       % inserta el producto con precio actualizado
    write('Producto: '), write(X), nl,
    write('Precio: '), write(Y1), nl,
    write('Categoria: e'), nl,
    fail.  

% Caso base: cuando no quedan productos de categoría e
aumento_productos.
