%base de conocimiento
mascota(perro,fido). 
mascota(gato,whiskers).
mascota(perro,rex).
dueno(juan,fido).
dueno(juan,canario).
dueno(ana,whiskers).
dueno(pedro,rex).
color(fido,marron).
color(whiskers,gris).
color(rex,negro).
mascota_Color(Color,Mascota):-color(Mascota,Color).