USE matchpet_db;

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Oliver', 'Gato', 'Común europeo', 'Macho', '2025-05-01', 'Pequeño', NULL, 'Oliver fue rescatado de la calle junto a sus hermanitos. A pesar de su difícil comienzo, es increíblemente cariñoso, juguetón y sociable. Le encanta el contacto humano, los mimos y hacer compañía. Está sano, desparasitado y listo para comenzar una nueva vida en un hogar donde lo quieran de verdad. Si estás buscando un compañero fiel y tierno, ¡él está esperando por ti!', 'Alta', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/oliver/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/oliver/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/oliver/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/oliver/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/oliver/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/oliver/5.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Julia', 'Perro', 'Pointer', 'Hembra', '2019-10-10', 'Mediano', 20.0, 'Julia es una pointer preciosa que, a pesar de haber perdido un ojito, lleva una vida completamente normal. Eso no le impide correr, jugar y disfrutar como cualquier otra perrita. Su energía y ternura enamoran a quien la conoce. Es muy cariñosa, noble y sociable, tanto con personas como con otros perros. Tiene un carácter equilibrado, dulce y agradecido.', 'Alta', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/julia/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/julia/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/julia/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/julia/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/julia/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Mango', 'Perro', 'Mestizo', 'Macho', '2024-06-20', 'Mediano', 15.0, 'Mango fue encontrado abandonado en un cubo de basura, cuando aún no había ni siquiera abierto los ojos, junto con sus hermanos. Lo rescatamos y le hemos criado a biberón, es muy cariñoso y zalamero.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/mango/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/mango/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/mango/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/mango/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Chulo', 'Perro', 'Mestizo', 'Macho', '2025-11-05', 'Grande', 30.0, 'Este cachorro fue recogido junto a su madre y sus hermanos, abandonados en la calle. Es simpático y cariñoso. Su madre es una galga y el padre es mestizo (parece de perro pastor). Estimamos que será de tamaño grande, entre 25 y 30 kilos aproximadamente. Los cachorros necesitan mucha paciencia y tiempo para adaptarse; si quieres darle un hogar, escríbenos.', 'Media', 1, 1, NULL, NULL, 0, 0, 'Disponible', 'fotos/chulo/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/chulo/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/chulo/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/chulo/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/chulo/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Loqui', 'Perro', 'Mestizo de pastor alemán', 'Macho', '2024-12-19', 'Mediano', 12.0, 'Loqui es un perro joven, muy enérgico y cariñoso. Lo recogimos abandonado de una perrera, y desde entonces ha demostrado ser un compañero maravilloso. Se lleva muy bien con otros perros y transmite pura alegría y ganas de jugar. Actualmente vive en la protectora junto a otros perros.', 'Alta', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/loqui/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/loqui/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/loqui/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/loqui/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Julio', 'Gato', 'Siamés', 'Macho', '2021-01-01', 'Pequeño', NULL, 'Julio es todo un señor gato: tranquilo, dormilón y muy cariñoso. Le encanta pasar el día entre siestas largas y mimos bien dados. Es un verdadero experto en el arte del relax Con su imponente porte y sus preciosos ojos azules, llama la atención enseguida, pero lo que realmente conquista es su carácter: dulce, noble y muy sociable, tanto con personas como con otros gatos. Si ya tienes felinos en casa, Julio será un compañero ideal. Este adorable grandullón está listo para empezar una nueva vida rodeado de amor y calma.', 'Baja', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/julio/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/julio/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/julio/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/julio/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Genovesa', 'Perro', 'Podenca', 'Hembra', '2015-01-01', 'Mediano', 17.0, 'Genovesa es una preciosa podenco rescatada en Almería, donde fue encontrada completamente en los huesos, abandonada a su suerte. A pesar de su duro pasado, esta valiente perrita ha demostrado tener un corazón enorme y una alegría contagiosa. Es cariñosa, muy sociable con otros perros y ¡le encantan los paseos! Como buena podenca, tiene un gran instinto rastreador y no se le escapa nada. Si estás buscando una compañera divertida, activa e imparable, ¡Genovesa es para ti! Está lista para encontrar ese hogar que tanto merece. ¿Le das la oportunidad de ser feliz?', 'Media', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/genovesa/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/genovesa/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/genovesa/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/genovesa/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/genovesa/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/genovesa/5.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/genovesa/6.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/genovesa/7.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Kenay', 'Perro', 'Galgo', 'Macho', '2021-08-24', NULL, NULL, 'Este espectacular galgo negro es Kenay. Viene del mundo de la caza y, como ocurre con tantos otros, cuando dejó de ser «útil», lo abandonaron. Ahora está a salvo en la protectora, donde comparte habitación con otros perros sin problema. Es un compañero discreto, tranquilo y muy cariñoso cuando coge confianza. Kenay necesita una familia que le enseñe, por primera vez, lo que es vivir en un hogar, rodeado de amor, seguridad y respeto. ¡Él está listo para ser feliz!', 'Baja', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/kenay/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/kenay/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/kenay/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/kenay/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Pluto', 'Perro', 'Pastor alemán', 'Macho', '2025-02-25', 'Mediano', 16.0, 'Pluto es un cachorro mestizo de pastor alemán que fue abandonado en los huesos y rescatado cuando apenas le quedaba un hilo de vida. Debido a la desnutrición y a la alta parasitación que sufría, sus analíticas aún son un desastre, pero cada día está más fuerte y feliz. Es muy sociable y cariñoso. Tiene plantigradismo en las patas delanteras a causa de la malnutrición, y necesita una familia que lo adopte y le dé todos los cuidados que merece y que nunca tuvo.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/pluto/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/pluto/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/pluto/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/pluto/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/pluto/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/pluto/5.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Toy', 'Perro', 'Yorkshire terrier', 'Macho', '2011-01-01', 'Pequeño', 3.0, 'Toy es un perrito de 14 años cuya familia lo dejó en la protectora hace unos días. Está muy triste y necesita con urgencia una nueva familia. Es muy bueno y toma aerosol dos veces al día debido a una insuficiencia respiratoria. Está castrado, pero no puede someterse a una limpieza dental por su edad avanzada.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/toy/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/toy/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/toy/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Santa', 'Perro', 'Galgo', 'Macho', '2021-01-01', 'Mediano', 23.0, 'Este precioso galgo fue rescatado en los huesos, con la soga incrustada en su cuello. Le habían intentado ahorcar, pero consiguió escapar. Es un luchador, un galgo noble con terror a las personas. Necesita una familia con mucha paciencia, que le ayude a confiar en las personas. En la protectora convive con otra galga y eso le ayuda mucho. En el parque sale con otros perros, machos y hembras, sin problema. Adopta a Santa y devuélvele la alegría que anteriormente le negaron. ¿Quieres darle un hogar?', 'Media', 1, NULL, 1, NULL, 0, 1, 'Disponible', 'fotos/santa/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/santa/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/santa/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/santa/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/santa/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/santa/5.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/santa/6.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/santa/7.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/santa/8.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Curro', 'Perro', 'Mestizo', 'Macho', '2018-04-05', 'Mediano', 11.0, 'Curro es un perrito de unos 7 años y 11 kilos de puro amor. Es muy cariñoso, tranquilo y buenísimo, de esos perros que te miran con ternura y te roban el corazón. Lo sacamos de una perrera para darle una segunda oportunidad, y desde entonces convive sin problema con otros perros en la protectora. Se adapta bien, es sociable y solo necesita una familia que le dé el cariño y la estabilidad que tanto merece. Si buscas un compañero leal, dulce y agradecido, Curro te está esperando.', 'Baja', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/curro/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/curro/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/curro/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Delia', 'Perro', 'Galgo español', 'Hembra', '2022-01-01', 'Mediano', 19.0, 'Esta preciosa galga es Delia, fue recogida en un pueblo de Toledo donde acababan de atropellar a su cachorro, es una galga buena y tranquila. Delia vive en la protectora con más perros sin problema. Buscamos una familia para ella, que quiera adoptarla y darle una nueva vida.', 'Media', 1, NULL, 1, NULL, 0, 1, 'Disponible', 'fotos/delia/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/delia/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/delia/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/delia/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/delia/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/delia/5.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Rufo', 'Perro', 'Mestizo', 'Macho', '2024-06-20', 'Mediano', 15.0, 'Rufo fue encontrado abandonado en un cubo de basura, cuando aún no había ni siquiera abierto los ojos, junto con sus hermanos. Lo rescatamos y le hemos criado a biberón, es muy cariñoso y zalamero.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/rufo/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/rufo/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/rufo/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/rufo/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/rufo/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Firulais', 'Perro', 'Galgo', 'Macho', '2023-01-01', 'Mediano', 24.0, 'Firulais es un precioso galgo blanco, muy sociable y sin miedos. Aquí, en la protectora, convive con otros perros y es muy juguetón. Fue rescatado en una carretera de Toledo, donde se encontraba abandonado, y un guardia civil lo puso a salvo. Le vendría genial compartir hogar con otro perro de su tamaño para ayudarle a gastar su energía.', 'Alta', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/firulais/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/firulais/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/firulais/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/firulais/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/firulais/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Dante', 'Perro', 'Podenco', 'Macho', '2015-02-04', 'Mediano', 15.0, 'Dante es un podenco de 10 años y 15 kilos, que fue encontrado abandonado en el campo, solo y sin fuerzas. A pesar de su pasado, Dante es un perro muy cariñoso, tranquilo y sociable con otros perros. Tiene leishmaniosis, pero está estable con su tratamiento: solo necesita una pastilla cada 12 horas. Vive con normalidad y lo único que le falta es una familia que le dé el amor que nunca ha tenido. Por su edad, muchos lo pasan por alto… pero Dante merece su oportunidad. Es un compañero ideal: noble, sereno y lleno de ternura.', 'Baja', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/dante/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/dante/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/dante/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Thiago', 'Perro', 'Galgo', 'Macho', '2021-08-24', 'Grande', 26.0, 'Thiago es un espectacular galgo negro que fue utilizado para cazar y, cuando ya no les sirvió, lo abandonaron. Ahora está a salvo en la protectora, donde convive perfectamente con otros perros. Es un perro muy noble, tranquilo y cariñoso, que está esperando una familia que le dé el amor que siempre mereció. Nunca ha vivido en un hogar, pero con paciencia y cariño, aprende rápido y lo compensa con creces.', 'Baja', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/thiago/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/thiago/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/thiago/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/thiago/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Triana', 'Perro', 'Mestiza', 'Hembra', '2015-01-03', 'Pequeño', 8.8, 'Triana es una perra mayor que fue rescatada de una perrera donde la abandonaron. A pesar de todo, sigue siendo muy buena y cariñosa, siempre agradecida por cada gesto de cariño. Después de todo lo que ha vivido, Triana solo necesita una familia que le ofrezca el amor y la tranquilidad que merece en esta etapa de su vida.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/triana/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/triana/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/triana/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/triana/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Max', 'Perro', 'Mestizo', 'Macho', '2014-01-01', 'Pequeño', 7.4, 'Max es un perrito muy mayor; calculamos que tiene más de 12 años. Fue abandonado en una perrera y no conocemos nada de su pasado. Es ciego, no tiene dientes y muestra signos de demencia senil. A pesar de todo, es un perro bueno y tranquilo, que se lleva bien con otros perros. Max necesitará una familia muy especial, con paciencia, cariño y comprensión, que le ofrezca un hogar tranquilo donde pueda pasar sus años con dignidad y amor.', 'Baja', 1, NULL, 1, NULL, 1, 1, 'Disponible', 'fotos/max/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Tratamiento', 'Seguimiento veterinario', 'El animal presenta una condición que requiere control', CURDATE(), 'Pendiente');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/max/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/max/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Boston', 'Perro', 'Mestizo de galgo', 'Macho', '2023-08-01', 'Mediano', 18.0, 'Boston es un precioso mestizo de galgo que llegó a la protectora siendo apenas un cachorro, junto a sus hermanitos, que ya han encontrado hogar. Ahora le toca a él tener la misma suerte. Es un perro joven, enérgico y con muchas ganas de vivir aventuras. ¡Correr y jugar son sus pasatiempos favoritos! Pero también tiene un lado muy dulce: le encanta recibir mimos y compartir momentos tranquilos con las personas que conoce. Convive sin problema con otras perras y se lleva genial con sus compañeras de habitación. Es simpático, sociable y siempre está dispuesto a repartir cariño. Boston necesita una familia que le dé el amor, el tiempo y la actividad que merece. Si tienes un hogar con espacio, paciencia y mucho cariño para ofrecer, Boston podría ser tu compañero ideal.', 'Alta', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/boston/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/boston/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/boston/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/boston/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/boston/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/boston/5.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/boston/6.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Hadita', 'Perro', 'Mestiza de galgo', 'Hembra', '2023-01-01', NULL, NULL, 'Hadita es una cachorra mestiza de galgo que fue rescatada tras ser abandonada en la calle. Tiene miedo debido a lo que ha vivido y todavía no se deja coger, por lo que necesita mucha paciencia y tiempo para avanzar. Busca una familia que le brinde una oportunidad, preferiblemente con otros perros sociables que puedan ayudarla a ganar confianza y a adaptarse. Con cariño y dedicación, podrá tener una nueva vida llena de seguridad. Será de tamaño similar a un galgo.', 'Media', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/hadita/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hadita/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hadita/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hadita/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Cayetana', 'Perro', 'Mestiza', 'Hembra', '2017-06-06', 'Mediano', 18.8, 'Simpática y zalamera, Cayetana te espera para recibirte con una sonrisa. Esta perrita fue recogida del abandono y sueña como la que más con un hogar. Es sociable con personas y con otros perros.', 'Media', 1, NULL, 1, NULL, 0, 1, 'Disponible', 'fotos/cayetana/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/cayetana/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/cayetana/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/cayetana/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/cayetana/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Fresa', 'Perro', 'Podenco', 'Hembra', '2023-05-01', 'Pequeño', 6.0, 'Fresa es una podenca de 3 años, preciosa y muy especial. Aunque aún es miedosa con las personas, con otros perros se muestra completamente sociable y tranquila. Se siente segura acompañada de sus compañeros perrunos, por eso sería ideal que compartiera su futuro hogar con otro perro que le ayude a ganar confianza. Con paciencia, cariño y un entorno estable, Fresa podrá florecer y mostrar todo lo que lleva dentro.', 'Media', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/fresa/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/fresa/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/fresa/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/fresa/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Sheldon', 'Gato', 'Común Europeo', 'Macho', '2020-01-01', 'Pequeño', NULL, 'Sheldon es un gato negro precioso. Los gatos negros son los grandes invisibles, por lo que tiene más difícil encontrar hogar. Es un poco asustadizo al principio, por lo que necesita una familia con paciencia, que no tenga prisa en ganarse su confianza y Sheldon se rendirá ante el cariño que nunca ha tenido.', 'Media', 1, 0, NULL, NULL, 0, 1, 'Disponible', 'fotos/sheldon/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/sheldon/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/sheldon/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Lucho', 'Perro', 'Mestizo', 'Macho', '2024-01-14', 'Mediano', 13.0, 'Fue encontrado abandonado en muy malas condiciones. Es un perrito joven, muy noble y cariñoso. Está deseando encontrar una familia que lo adopte y poder ser feliz. ¡¡¡Adopta a Lucho!!!', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/lucho/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/lucho/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/lucho/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/lucho/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/lucho/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Super', 'Perro', 'Mestizo American Staffordshire Terrier Necesita licencia PPP, nosotros te explicamos cómo sacarla es muy sencillo.', 'Macho', '2019-11-06', 'Grande', 28.0, 'Súper: un verdadero héroe de cuatro patas. Súper apareció en un estado lamentable: herido, enfermo y tan delgado que era solo huesos. Su cuerpo estaba roto, pero su espíritu no. Con cuidados, cariño y tratamiento, hoy Súper está recuperado y listo para empezar una nueva vida. Tiene unos 6 años, es muy limpio, cariñoso y sociable con otros perros. Padece leishmaniosis, pero la tiene controlada con pastillas cada 12 horas. No le impide hacer una vida completamente normal. Súper es un perro agradecido, noble y lleno de amor. Solo necesita una familia que vea el gran compañero que es y le dé la oportunidad de ser feliz por fin.', 'Media', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/super/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/super/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/super/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/super/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/super/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/super/5.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Isabel', 'Perro', 'Corgi', 'Hembra', '2023-02-18', 'Mediano', 15.5, 'Isabel es una perrita muy sociable y cariñosa que ha sido descartada de un criadero por no criar bien. Convive sin problema con otros perros y necesita una familia paciente, ya que nunca ha vivido en una casa.', 'Media', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/isabel/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/isabel/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/isabel/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Eme', 'Perro', 'Mastín', 'Hembra', '2023-01-13', 'Grande', 37.2, 'Nos llamaron del Centro de Protección animal de la Comunidad de Madrid por ella, la habían encontrado atropellada. Operaron a Eme de las caderas y ahora estamos trabajando con ella en Fundación Animal Rescue, donde se está recuperando, ya comienza a mover sus patas traseras. Es muy cariñosa y sociable con otros perros, una perra que merece un hogar cuanto antes.', 'Media', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/eme/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/eme/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/eme/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/eme/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/eme/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/eme/5.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/eme/6.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/eme/7.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Merlina', 'Perro', 'Mestiza (Border collie)', 'Hembra', '2023-01-01', NULL, NULL, 'Merlina es una cachorra miedosa de 3 meses que será de tamaño mediano/grande. Es sociable con otros perros y necesita una familia que tenga más perros para ayudarla a superar sus miedos. Adopta a Merlina y dale una nueva vida.', 'Media', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/merlina/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/merlina/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/merlina/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/merlina/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Lisa', 'Gato', 'Común europeo', 'Hembra', '2025-05-01', 'Pequeño', NULL, 'Lisa fue rescatada de la calle junto a sus hermanitos. A pesar de su difícil comienzo, es increíblemente cariñosa, juguetona y sociable. Le encanta el contacto humano, los mimos y hacer compañía. Está sana, desparasitada y lista para comenzar una nueva vida en un hogar donde lo quieran de verdad. Si estás buscando un compañera fiel y tierna, ¡ella es la indicada!', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/lisa/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/lisa/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/lisa/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/lisa/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Rita', 'Perro', 'Bóxer', 'Hembra', '2015-01-01', 'Grande', 25.5, 'Rita es una bóxer abuelita de 10 años, muy sociable y cariñosa, entregada por su familia por no poder seguir teniéndola. En Fundación Animal Rescue vive con otros perros sin problema, siempre la tienes esperando una caricia, moviendo el rabito. Es maravillosa y merece una familia que quiera ayudar y adopte a una perra mayor ideal.', 'Media', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/rita/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/rita/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/rita/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/rita/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Paula', 'Perro', 'Mestiza mastín', 'Hembra', '2022-06-01', 'Grande', 37.8, 'La recogimos abandonada junto con su hermana en un pueblo de Toledo. Es muy cariñosa, tierna y llena de vida. En la protectora comparte chenil con su hermana Aitana. Adopta, salva vidas.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/paula/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/paula/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/paula/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/paula/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/paula/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/paula/5.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/paula/6.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/paula/7.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Blanca', 'Perro', 'Mestiza', 'Hembra', '2017-01-01', 'Gigante', 46.0, 'Blanca fue recogida abandonada en la calle. Ha pasado toda su vida sin una familia y, aun así, es muy buena.Con otros perros es muy sociable y con las personas tiene miedo al principio, pero en cuanto coge confianza es un sol. Necesita una familia con paciencia que la adopte. Si hay otros perros en casa o un jardín, sería ideal, ya que todavía no sabe caminar bien con correa. Adopta a Blanca y dale la vida en familia que tanto merece.', 'Alta', 0, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/blanca/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/blanca/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/blanca/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/blanca/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/blanca/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/blanca/5.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Frodo', 'Gato', 'Común europeo', 'Macho', '2025-05-01', 'Pequeño', NULL, 'Frodo fue rescatado de la calle junto a sus hermanitos. A pesar de su difícil comienzo, es increíblemente cariñoso, juguetón y sociable. Le encanta el contacto humano, los mimos y hacer compañía. Está sano, desparasitado y listo para comenzar una nueva vida en un hogar donde lo quieran de verdad. Si estás buscando un compañero fiel y tierno, ¡él está esperando por ti!', 'Alta', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/frodo/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/frodo/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/frodo/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/frodo/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Kitty', 'Perro', 'Podenca', 'Hembra', '2013-03-07', 'Mediano', 14.0, 'Kitty: una abuelita con mucho amor por dar A sus 13 años, Kitty fue cruelmente abandonada en una perrera, justo cuando más necesitaba cariño y tranquilidad. Es una podenca buena, dulce y muy cariñosa, que solo quiere pasar sus días rodeada de calma y afecto. Kitty es tranquila y sociable con otros perros, ideal para un hogar sereno donde pueda descansar y sentirse querida. A pesar de su edad, sigue teniendo ese brillo especial en la mirada que pide una última oportunidad. Ella no necesita grandes cosas, solo una cama blandita, mimos y alguien que la acompañe en esta última etapa con dignidad y amor.', 'Media', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/kitty/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/kitty/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/kitty/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/kitty/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Jock', 'Perro', 'Mestizo', 'Macho', '2025-11-05', 'Grande', 30.0, 'Este cachorro fue recogido junto a su madre y sus hermanos, abandonados en la calle. Es simpático y cariñoso. Su madre es una galga y el padre es mestizo (parece de perro pastor). Estimamos que será de tamaño grande, entre 25 y 30 kilos aproximadamente. Los cachorros necesitan mucha paciencia y tiempo para adaptarse; si quieres darle un hogar, escríbenos.', 'Media', 1, 1, NULL, NULL, 0, 0, 'Disponible', 'fotos/jock/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/jock/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/jock/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/jock/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/jock/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Maxi', 'Gato', 'Común Europeo', 'Macho', '2023-04-12', 'Pequeño', NULL, 'Maxi es un gato muy bueno, que fue rescatado por nuestra voluntaria María de la calle y, como tenía el ojo muy mal, le tuvo en acogida hasta que se recuperó. Ahora Maxi vive con más gatos, es sociable y está acostumbrado a vivir en comunidad gatuna. Si quieres adoptarle, escríbenos.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/maxi/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/maxi/1.jpg', 1);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Leia', 'Perro', 'Mastina', 'Hembra', '2022-06-01', 'Grande', 44.9, 'La belleza tiene nombre y se llama Leia. Es una preciosa mastina, que fue recogida de una perrera municipal de Toledo donde, aterrada, estaba condenada a no salir adoptada nunca. La recogimos y, actualmente, se encuentra en tratamiento para una enfermedad de garrapatas. Es muy cariñosa y sociable, aquí comparte chenil con otro mastín y sale al parque todos los días con más perros, machos y hembras, sin problemas. Necesita una familia comprensiva que le de una nueva oportunidad. ¿Quieres darle un hogar?', 'Media', 1, 1, 1, NULL, 1, 1, 'Disponible', 'fotos/leia/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Tratamiento', 'Seguimiento veterinario', 'El animal presenta una condición que requiere control', CURDATE(), 'Pendiente');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/leia/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/leia/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/leia/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/leia/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/leia/5.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/leia/6.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Senda', 'Perro', 'Mestiza', 'Hembra', '2018-01-01', 'Mediano', 23.3, 'Senda lleva con nosotros desde hace 7 años en la protectora, la recogimos en muy mal estado en los huesos y con muchísimo miedo. Es una perra invisible que necesita que alguien la adopte y la comprenda, es mediana. Vive en la protectora en un chenil con otro perro, necesitaria una familia con paciencia y ganas de ayudar a una perra maravillosa. Adoptar un perro invisible es lo mejor que puedes hacer, cada avance te llenará de alegría. ¿Quieres darle un hogar?', 'Media', 1, 0, NULL, NULL, 0, 1, 'Disponible', 'fotos/senda/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/senda/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/senda/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/senda/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Aria', 'Perro', 'Mestiza', 'Hembra', '2022-01-01', 'Mediano', 18.0, 'Aria es una perrita preciosa, de pelaje negro y muy cariñosa. Fue abandonada, pero a pesar de todo sigue siendo dulce y amorosa. Actualmente vive en la protectora junto a otros perros, y le encanta estar con las personas. Tiene ehrlichia, una enfermedad transmitida por garrapatas que se cura fácilmente con un mes de tratamiento con antibióticos en pastillas. Solo necesita tomar su medicación para recuperarse por completo. Aria se merece una familia que la quiera y le dé la oportunidad de ser feliz', 'Media', 1, 1, 1, NULL, 1, 1, 'Disponible', 'fotos/aria/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Tratamiento', 'Seguimiento veterinario', 'El animal presenta una condición que requiere control', CURDATE(), 'Pendiente');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/aria/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/aria/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/aria/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Greta', 'Gato', 'Común Europeo', 'Hembra', '2019-05-15', 'Pequeño', NULL, 'Greta es una gata adulta muy buena y tranquila. Fue rescatada en muy mal estado y está deseando encontrar un hogar. Es una gata buenísima, pero tímida al principio, como todos los gatos, aunque sociable con los demás felinos.', 'Media', 1, 0, NULL, NULL, 0, 1, 'Disponible', 'fotos/greta/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/greta/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/greta/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/greta/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Lila', 'Perro', 'Shih Tzu', 'Hembra', '2016-08-23', 'Pequeño', 3.0, 'Lila es una perrita Shih Tzu llena de dulzura y amor. Fue rescatada de un criadero, donde pasó toda su vida en una jaula, sin conocer el calor de un hogar ni la alegría de vivir en una casa. Ahora, con mucho cariño y paciencia, está lista para aprender lo que es el verdadero amor y la libertad. Solo necesita una familia que le brinde tiempo, comprensión y abrazos para que poco a poco pueda adaptarse y descubrir lo maravilloso que es ser feliz.', 'Media', 1, NULL, NULL, NULL, 0, 1, 'Disponible', 'fotos/lila/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/lila/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/lila/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Mila', 'Perro', 'Mestiza', 'Hembra', '2025-01-01', 'Mediano', 18.0, 'Mila es una perrita joven, muy cariñosa y sociable con otros perros. Fue encontrada abandonada en la calle y, tras pasar por una perrera, tuvo la suerte de ser rescatada. A pesar de todo lo que ha vivido, Mila no ha perdido su dulzura ni sus ganas de dar amor. Le encanta jugar, recibir mimos y disfrutar de la compañía humana y perruna. Ahora solo necesita una familia que le dé la oportunidad de empezar una nueva vida llena de cariño y seguridad.', 'Alta', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/mila/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/mila/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/mila/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/mila/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Noel', 'Perro', 'Podenco', 'Macho', '2025-02-10', 'Mediano', 20.0, 'Noel es un podenco muy especial y bondadoso.Ha llegado a nosotros tras el fallecimiento de su propietaria, quien lo rescató de un cazador que no lo quería por ser sordo y albino. A pesar de todo lo que ha vivido, Noel es un perro dulce, noble y precioso. Se lleva muy bien con otros perros y también con gatos. Es tranquilo, cariñoso y agradecido, y solo necesita una familia que lo quiera y le dé por fin la estabilidad y el amor que merece. Noel busca un hogar donde pueda sentirse seguro y acompañado.Si crees que puedes ser su familia, no dudes en dar el paso: él te lo devolverá con cariño infinito.', 'Baja', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/noel/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/noel/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/noel/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/noel/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/noel/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Pipo', 'Perro', 'Shih Tzu', 'Macho', '2012-01-01', 'Pequeño', 4.7, 'Pipo es un perrito de 14 años cuya dueña ha fallecido, y su marido no quiere hacerse cargo de él. Es muy bueno, pero casi no ve. Se merece ser feliz el tiempo que le quede.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/pipo/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/pipo/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/pipo/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Punky', 'Perro', 'Mestizo', 'Macho', '2011-01-01', 'Pequeño', 8.0, 'Punky fue adoptado en 2018 y ahora ha vuelto con nosotros con 15 años. Su dueña, que lo cuidaba genial y lo quería mucho, ha tenido que entrar en una residencia. Es muy limpio en casa, sociable con otros perros y muy cariñoso. Actualmente está en casa de Fran, donde también convive con gatos. Tiene artrosis y toma medicación diaria, además de recibir Librela mensualmente. Está muy triste y necesita urgentemente un hogar.', 'Media', 1, 1, 1, 1, 0, 1, 'Disponible', 'fotos/punky/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/punky/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/punky/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Turron', 'Perro', 'Bretón', 'Macho', '2021-02-10', 'Mediano', 13.0, 'Turrón es un precioso bretón que sueña con una familia. Es un perro tímido al principio, pero pronto te le ganas con cariño y tiempo. Es sociable con los demás perros y está acostumbrado a vivir con otros canes en la casa donde vivía. Turrón necesita encontrar pronto un hogar, una nueva oportunidad de vida.', 'Media', 1, NULL, NULL, NULL, 0, 1, 'Disponible', 'fotos/turron/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/turron/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/turron/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/turron/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/turron/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Mia', 'Perro', 'Caniche Apricot Toy', 'Hembra', '2014-03-16', 'Pequeño', 3.9, 'Mía viene de un criadero, donde pasó toda su vida encerrada en una jaula, criando sin conocer el amor de una familia. Llegó con un ojito en muy mal estado y tuvieron que quitárselo. Apenas le quedan dientes y, por eso, su lengüita suele asomarse con ternura. A pesar de todo lo vivido, Mía es una perrita increíblemente cariñosa y sociable. Le encantan los mimos y se lleva de maravilla con otros perros. Ahora solo necesita una familia que le dé el amor que nunca tuvo, para que pueda pasar sus últimos años rodeada de cariño, tranquilidad y respeto. ¡Se lo merece más que nadie!', 'Media', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/mia/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/mia/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/mia/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/mia/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Chispa', 'Perro', 'Bretón', 'Hembra', '2017-02-10', 'Pequeño', 6.1, 'Chispa es una perra tranquila y cariñosa, de unos 7 años, que sueña con tener una familia de nuevo. Era el ojito derecho de la familia que decidió dejarla y, ahora, espera tener una nueva oportunidad de vida. Está acostumbrada a vivir con otros perros, es una perra pequeña de 6 kilos de peso.', 'Media', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/chispa/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/chispa/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/chispa/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/chispa/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Galo', 'Perro', 'Mestizo', 'Macho', '2015-07-22', 'Mediano', 22.0, 'Galo fue recogido hace 8 años, junto a su hermana Valkiria, en un pueblo de Ciudad Real donde, por su terror al ser humano, no sabían qué hacer con ellos. Adquirimos el compromiso de cuidarles y trabajar sus miedos. Han mejorado mucho, pero no permiten la manipulación. Necesitan una familia con jardín y muchísima paciencia, su adopción es un gran reto, solo para personas con experiencia en miedos.', 'Media', 1, 0, NULL, NULL, 0, 1, 'Disponible', 'fotos/galo/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/galo/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/galo/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/galo/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Sleepy', 'Perro', 'Mestizo', 'Macho', '2023-08-01', 'Mediano', 13.4, 'Sleepy es un perrito muy miedoso, al que rescataron de un lugar donde sufría maltrato y palizas. Es muy bueno, pero tiene terror al ser humano y tiembla cuando te acercas. Necesita una familia que tenga otros perros, ya que eso le ayudaría mucho. Además, necesitará mucha paciencia y cariño. Sleepy no anda bien con la correa, la familia que le adopte tendrá que trabajar sus miedos y vencerlos poco a poco. Con amor, todo será posible.', 'Alta', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/sleepy/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/sleepy/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/sleepy/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/sleepy/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Fito', 'Gato', 'Común Europeo', 'Macho', '2022-01-01', 'Pequeño', NULL, 'Fito es muy cariñoso y zalamero. Le encontraron de pequeñito en la basura, desechado y solo. Es un gatito muy cariñoso, sociable con otros animales y muy divertido.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/fito/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/fito/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/fito/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/fito/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Manchitas', 'Perro', 'Galga', 'Hembra', '2014-01-01', 'Mediano', 23.0, 'Manchitas lleva toda una vida con nosotros. Llegó de un síndrome de Noé y, debido a sus miedos y a no permitir la manipulación, se convirtió en invisible. Manchitas se hace mayor, ya tiene artrosis y se encuentra en tratamiento. Manchitas necesitaría una casa tranquila con jardín, es muy limpia y dulce. Un corazón en busca de amor.', 'Media', 1, 0, NULL, NULL, 0, 1, 'Disponible', 'fotos/manchitas/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/manchitas/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/manchitas/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/manchitas/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/manchitas/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Lima', 'Perro', 'Galgo', 'Hembra', '2021-01-01', 'Mediano', 15.4, 'Esta galguita, tan pequeña de tamaño, es Lima, una miedosa galga que sueña con un hogar. Al tener miedos, le ayudaría mucho una familia con otro perro similar para avanzar. En la protectora es compañera de más perros y es sociable con ellos. Es tímida y necesita mucha paciencia.¿Quieres darle un hogar?', 'Media', 1, 0, NULL, NULL, 0, 1, 'Disponible', 'fotos/lima/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/lima/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/lima/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/lima/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Tofu', 'Gato', 'Común Europeo', 'Macho', '2021-09-15', 'Pequeño', NULL, 'Tofu es un precioso y elegante gato, blanco y negro, de carácter maravilloso. Sociable y achuchable, promete ser un gran compañero. La familia que lo adopte, recibirá la palabra agradecimiento cada día en forma de ronroneos y mimos. Es sociable con los demás gatos, muy bueno.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/tofu/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/tofu/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/tofu/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/tofu/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Diva', 'Perro', 'Caniche apricot', 'Hembra', '2016-05-07', 'Pequeño', 4.6, 'Diva es una caniche apricot muy buena. Siempre ha vivido en un criadero y no sabe lo que es vivir en una casa. Necesita aprenderlo todo: andar con correa, hacer sus necesidades en la calle, etc. Convive con otros perros sin problema. Necesita una familia que se implique con ella y le dedique tiempo y paciencia para aprender a vivir en un hogar.', 'Alta', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/diva/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/diva/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/diva/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/diva/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Gaia', 'Perro', 'Podenca', 'Hembra', '2024-01-01', 'Pequeño', 9.3, 'Gaia busca una familia con mucho amor y paciencia. Gaia es una preciosa podenca que fue rescatada del abandono en Andalucía. La vida en la calle la dejó con miedo y desconfianza, por eso es una perrita muy sensible y tímida. Pero detrás de esa mirada asustada hay un corazón enorme. Con otros perros es muy sociable y dulce, disfruta de su compañía y se siente más segura a su lado. Gaia solo necesita una familia tranquila y paciente, que le dé el tiempo, el cariño y la seguridad que nunca tuvo. Con amor, estamos seguros de que se convertirá en una compañera fiel y agradecida.', 'Media', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/gaia/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/gaia/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/gaia/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Melon', 'Perro', 'Mestizo', 'Macho', '2024-06-20', 'Mediano', 15.0, 'Melón fue encontrado abandonado en un cubo de basura, cuando aún no había ni siquiera abierto los ojos, junto con sus hermanos. Lo rescatamos y le hemos criado a biberón, es muy cariñoso y zalamero.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/melon/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/melon/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/melon/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/melon/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Africa', 'Perro', 'Galgo español', 'Hembra', '2021-08-07', 'Mediano', 17.3, 'La alegría tiene nombre y se llama África, esta preciosa galga negra que recogieron en un pueblo de Jaén. Es muy cariñosa y sociable con personas y con perros, busca siempre el contacto humano moviendo su rabito. Una galga sin miedos que sueña con un hogar para ser feliz.', 'Media', 1, 0, NULL, NULL, 0, 1, 'Disponible', 'fotos/africa/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/africa/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/africa/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/africa/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Nevado', 'Perro', 'Mestizo', 'Macho', '2022-01-10', 'Pequeño', 5.9, 'Nevado fue encontrado abandonado. Es tímido con las personas, pero muy noble y cariñoso. Se lleva bien con otros perros. Necesita una familia que lo adopte y lo quiera para siempre.', 'Media', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/nevado/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/nevado/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/nevado/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Yogui', 'Perro', 'Galgo', 'Macho', '2022-11-22', 'Mediano', 23.0, 'Yogui es un galgo muy cariñoso que está buscando una familia. En la protectora convive con otros perros y es muy sociable con las personas; no es miedoso y tiene un carácter simpático y juguetón. Es un galgo joven que necesita actividad: le encantan los paseos y disfrutar del parque con otros perros. Yogui necesita el cariño de un hogar y una familia que le dé la oportunidad de ser feliz.', 'Alta', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/yogui/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/yogui/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/yogui/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/yogui/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/yogui/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Golfo', 'Perro', 'Mestizo', 'Macho', '2025-11-05', 'Grande', 30.0, 'Este cachorro fue recogido junto a su madre y sus hermanos, abandonados en la calle. Es simpático y cariñoso. Su madre es una galga y el padre es mestizo (parece de perro pastor). Estimamos que será de tamaño grande, entre 25 y 30 kilos aproximadamente. Los cachorros necesitan mucha paciencia y tiempo para adaptarse; si quieres darle un hogar, escríbenos.', 'Media', 1, 1, NULL, NULL, 0, 0, 'Disponible', 'fotos/golfo/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/golfo/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/golfo/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/golfo/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/golfo/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Perla', 'Perro', 'Teckel', 'Hembra', '2016-10-24', 'Pequeño', 7.0, 'Perla es una teckel muy buena. Siempre ha vivido en un criadero y no sabe lo que es vivir en una casa. Necesita aprenderlo todo: andar con correa, hacer sus necesidades en la calle, etc. Convive con otros perros sin problema. Necesita una familia que se implique con ella y la dedique tiempo y paciencia para aprender a vivir en un hogar.', 'Alta', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/perla/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/perla/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/perla/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/perla/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Chendo', 'Perro', 'Mestizo', 'Macho', '2015-04-13', 'Gigante', 48.0, 'Chendo es un perro invisible, lleva con nosotros en Fundación Animal Rescue 8 años. Es un perro grande que desde pequeño no fue feliz, le tenían en un patio de un chalet y Chendo es un perro especial que necesita tranquilidad y rutinas. Si vives en una casa con jardín donde Chendo pueda vivir lejos del estres de la ciudad podrías adoptarlo. Los perros como Chendo necesitan familias comprometidas que quieran ayudar a un perro, comprometiéndose con su personalidad, y siendo conscientes de que adoptándole le cambias la vida. ¿Quieres darle un hogar?', 'Media', 1, NULL, NULL, NULL, 0, 1, 'Disponible', 'fotos/chendo/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/chendo/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/chendo/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/chendo/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Manolo', 'Perro', 'Pastor alemán', 'Macho', '2022-03-01', 'Grande', 28.0, 'En Diciembre de 2022 nos llamaron de una perrera municipal en Ciudad Real donde habían encontrado a Manolo con las 4 patas torcidas y pensaban que se las habían roto. Nos desplazamos urgentemente y lo llevamos al veterinario, tras realizarle varias pruebas diagnosticaron que Manolo tiene enanismo hipofisario parcial y empezó tratamiento con hormonas de crecimiento, afortunadamente le vinieron muy bien y Manolo creció y se desarrolló. En paralelo iba a rehabilitación e hidroterapia para atenuar su dolor. Cuando el tratamiento con hormonas llegó a su fin los traumatólogos del hospital determinaron que tenía que ser operado de sus dos patas delanteras y le realizaron dos atrodesis. Las patas de atrás se adaptan de forma natural como nos habían dicho los traumas y ahora mismo Manolo hace una vida normal, es muy cariñoso. Es un perro joven y lleno de vida que está deseando encontrar una familia responsable que lo adopte y lo cuide. ¿Quieres darle un hogar?', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/manolo/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/manolo/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/manolo/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/manolo/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/manolo/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Dori', 'Perro', 'Caniche apricot', 'Hembra', '2016-01-30', 'Pequeño', 4.5, 'Dori es una caniche muy cariñosa. Siempre ha vivido en un criadero y no sabe lo que es vivir en una casa. Necesita aprenderlo todo: andar con correa, hacer sus necesidades en la calle, etc. Convive con otros perros sin problema. Necesita una familia que se implique con ella y le dedique tiempo y paciencia para aprender a vivir en un hogar.', 'Alta', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/dori/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/dori/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/dori/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/dori/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Budy', 'Perro', 'Bodeguero andaluz', 'Macho', NULL, 'Mediano', 11.5, 'Budy es un bodeguero enérgico y muy cariñoso, al que rescatamos de la perrera. Le encanta jugar, compartir tiempo con otros perros y recibir todas las caricias que le quieran dar. Es un perrito alegre, juguetón y lleno de vida, con un corazón enorme. Budy es simplemente maravilloso y se merece, por fin, una oportunidad para ser feliz en un hogar de verdad.', 'Alta', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/budy/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/budy/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/budy/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/budy/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Zafiro', 'Perro', 'Podenco', 'Macho', '2024-11-01', 'Mediano', 24.0, 'Zafiro es un podenco que llegó en los huesos, en unas condiciones terribles que rompían el corazón. Tras recibir su tratamiento con inyecciones para la leishmania, ahora solo necesita continuar con su medicación en pastillas y los controles veterinarios habituales. Es un perro precioso, muy cariñoso y sociable, acostumbrado a convivir con otros perros. A pesar de todo lo que ha pasado, Zafiro mantiene una dulzura infinita y unas ganas enormes de recibir cariño. Se merece, más que nadie, una familia que no tenga miedo de adoptar a un perro con una enfermedad controlada, y que esté dispuesta a darle la nueva vida que tanto ansía. Zafiro tiene mucho amor por dar… solo necesita una oportunidad.', 'Media', 1, 0, 1, NULL, 1, 1, 'Disponible', 'fotos/zafiro/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Tratamiento', 'Seguimiento veterinario', 'El animal presenta una condición que requiere control', CURDATE(), 'Pendiente');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/zafiro/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/zafiro/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/zafiro/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Marfil', 'Perro', 'Galgo', 'Macho', '2023-05-01', 'Mediano', 24.0, 'Marfil es un galgo de 3 años que recogimos en un estado lamentable, abandonado y en los huesos. Pero con cuidados, paciencia y mucho cariño, se ha recuperado por completo… y ahora está ¡guapísimo y lleno de vida! A diferencia de muchos galgos, Marfil no tiene miedos: es un perro simpático, sociable y muy cercano con las personas. Le encanta el contacto humano y disfruta de la compañía. Además, convive sin problema con otros perros en la protectora. Marfil está sano, feliz y preparado para dar el siguiente paso: encontrar una familia que lo quiera y lo cuide como merece. Es un compañero ideal para quienes buscan un perro tranquilo, afectuoso y con una historia de superación.', 'Baja', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/marfil/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/marfil/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/marfil/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/marfil/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/marfil/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/marfil/5.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Abel', 'Gato', 'Común Europeo', 'Macho', '2021-06-01', 'Pequeño', NULL, 'Es un precioso gatazo naranja que es la envidia de la gatera, con su porte majestuoso. Es muy bueno con los demás gatos y espera un hogar donde ser feliz para siempre.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/abel/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/abel/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/abel/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/abel/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Estela', 'Perro', 'Mestiza', 'Hembra', '2025-11-05', 'Grande', 30.0, 'Esta cachorra fue recogida junto a su madre y sus hermanos, abandonados en la calle. Es simpática y cariñosa. Su madre es una galga y el padre es mestizo (parece de perro pastor). Estimamos que será de tamaño grande, entre 25 y 30 kilos aproximadamente. Los cachorros necesitan mucha paciencia y tiempo para adaptarse; si quieres darle un hogar, escríbenos.', 'Media', 1, 1, NULL, NULL, 0, 0, 'Disponible', 'fotos/estela/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/estela/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/estela/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/estela/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/estela/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Lolita', 'Perro', 'Bichón maltés', 'Hembra', '2016-04-04', 'Pequeño', 3.4, 'Lolita es una bichona muy cariñosa. Siempre ha vivido en un criadero y no sabe lo que es vivir en una casa. Necesita aprenderlo todo: andar con correa, hacer sus necesidades en la calle, etc. Convive con otros perros machos sin problema; con hembras no es compatible. Necesita una familia que se implique con ella y le dedique tiempo y paciencia para aprender a vivir en un hogar.', 'Alta', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/lolita/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/lolita/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/lolita/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Molly', 'Perro', 'Bodeguero andaluz', 'Hembra', '2015-09-09', 'Pequeño', 7.0, 'Molly es una perrita bodeguera tímida, pero cuando te conoce se derrite por una caricia. Llega a nosotros tras el fallecimiento de su dueña, Susana. Vivía con más perros y gatos y es muy buena. Necesita una familia cariñosa que la adopte y le dé el cariño que tenía y que ahora le falta.', 'Media', 1, 0, NULL, NULL, 0, 1, 'Disponible', 'fotos/molly/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/molly/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/molly/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/molly/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Megan', 'Perro', 'Pastor alemán', 'Hembra', '2024-12-01', 'Mediano', 18.5, 'Megan fue rescatada de un lugar donde la habían tenido encadenada desde que era solo una bebé. A pesar de su pasado, es una perrita increíblemente buena, muy cariñosa y sociable con otros perros. Después de haber pasado mucha hambre, ahora disfruta con verdadera pasión de cada comida. Es una pastor alemán fantástica, con un corazón enorme, y se merece por fin conocer lo que es ser feliz en un verdadero hogar.', 'Media', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/megan/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/megan/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/megan/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/megan/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/megan/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Amaia', 'Gato', 'Podenca', 'Hembra', '2025-01-01', 'Pequeño', 5.0, 'Amaia es una podenca muy buena y cariñosa, sociable con perros y gatos. Muy cariñosa con las personas y la encanta estar en el sillón. En la calle tiene mucho instinto de caza y es muy intensa siguiendo los rastros. Necesita una familia que la adopte.', 'Media', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/amaia/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/amaia/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/amaia/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Brownie', 'Gato', 'Siamés', 'Macho', '2020-02-01', 'Pequeño', NULL, 'Este precioso siamés es Brownie, buenísimo con los demás gatos, pero muy miedoso con las personas. Necesita una familia que quiera ayudarle, ya que, de lo contrario, se volverá invisible para siempre. Necesitaría una habitación donde adaptarse las primeras semanas, para luego ir saliendo al resto de la casa sin que nadie le moleste. Es un gato precioso y con el corazón roto.', 'Media', 1, 0, NULL, NULL, 0, 1, 'Disponible', 'fotos/brownie/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/brownie/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/brownie/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Pili', 'Perro', 'Mestizo podenco', 'Hembra', '2021-08-12', 'Mediano', 17.6, 'Pili es una perrita mestiza, súper cariñosa, tranquila y sociable. Está acostumbrada a vivir con otros perros y con gatos; es muy buena. Viene de una persona que falleció por un cáncer y se ha quedado muy triste. Pasea bien con correa y la familia que la adopte va a estar encantada.', 'Alta', 1, 1, 1, 1, 0, 1, 'Disponible', 'fotos/pili/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/pili/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/pili/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/pili/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Turco', 'Perro', 'Mestizo', 'Macho', '2020-05-15', 'Mediano', 18.5, 'Turco es un perro muy cariñoso que recogimos de su propietaria por problemas personales. Turco es sociable con otros perros, amante de las pelotas y los palos, un gran compañero de vida para la persona que lo adopte. En la protectora comparte chenil con otra perra y estamos encantados con él. ¿Quieres darle un hogar?', 'Media', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/turco/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/turco/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/turco/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/turco/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Barbie', 'Perro', 'Pomerania / Spitz Alemán', 'Hembra', '2015-08-01', 'Pequeño', 6.0, 'Barbie tiene 10 años y fue utilizada toda su vida para la cría. Vivió siempre en una jaula y tiene estereotipias (movimientos circulares debido al estrés de haber estado siempre encerrada). Es muy simpática, sociable con otros perros y muy cariñosa. Necesita una familia paciente que le enseñe que existe una vida lejos de las jaulas, que aún tiene tiempo para disfrutar y ser feliz.', 'Media', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/barbie/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/barbie/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/barbie/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Pecas', 'Perro', 'Mestizo', 'Macho', '2023-01-01', 'Pequeño', 7.0, 'Este pequeño es Pecas, un cariñoso perrito de 7 kilos que fue rescatado abandonado en un pueblo de Toledo. Tiene menos de dos años y está deseando encontrar una familia para ser feliz, es muy zalamero. Adopta a Pecas.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/pecas/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/pecas/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/pecas/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/pecas/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/pecas/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Febrero', 'Perro', 'Galgo', 'Macho', '2023-12-26', 'Mediano', 22.0, 'Febrero es un galgo muy bueno que viene del abandono. Es sociable con otros perros y de carácter tranquilo. Con las personas es tímido al principio, pero solo necesita una familia y un hogar donde, por primera vez, pueda ser feliz.', 'Baja', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/febrero/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/febrero/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/febrero/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/febrero/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Caramelo', 'Perro', 'Galgo español', 'Macho', '2024-01-01', NULL, NULL, 'Caramelo es un precioso cachorrito de galgo que fue rescatado de una situación de dejadez. Era tan pequeñito cuando lo encontraron, solito en un patio… Este dulce bebé es muy cariñoso y lleno de energía. Necesita una familia con otros galgos que lo acompañen y lo ayuden a crecer feliz y equilibrado. Actualmente tiene giardias, unos parásitos internos que, con el tratamiento adecuado, desaparecen sin problema. Caramelo está buscando una familia que lo adopte, lo cuide y, sobre todo, lo quiera muchísimo.', 'Alta', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/caramelo/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/caramelo/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/caramelo/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/caramelo/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/caramelo/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/caramelo/5.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Porthos', 'Perro', 'Mestizo Galgo', 'Macho', '2025-04-10', NULL, NULL, 'Cachorro mestizo de galgo busca un hogar con urgencia Este precioso cachorro es un mestizo de galgo, dulce pero lleno de miedos. Porthos tenido un comienzo de vida difícil, y ahora necesita urgentemente una familia paciente y comprometida que lo ayude a recuperar la confianza. Es un perrito muy miedoso, pero con amor, tiempo y el entorno adecuado, puede salir adelante. Lo ideal es que en su nuevo hogar haya otro perro sociable, que le sirva de guía y apoyo para empezar a soltarse y confiar. Tiene toda la vida por delante, solo necesita esa oportunidad que nunca ha tenido. ¿Quieres ser tú quien le enseñe que el mundo también puede ser bonito?', 'Media', 1, 0, NULL, NULL, 0, 1, 'Disponible', 'fotos/porthos/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/porthos/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/porthos/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/porthos/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Chetos', 'Perro', 'Podenco', 'Macho', '2022-05-01', 'Mediano', 20.0, 'Chetos es un podenco de 3 años, cariñoso, sociable y con un corazón enorme. Le encanta la compañía, tanto de personas como de otros perros. Es un compañero noble, tranquilo y siempre dispuesto a compartir mimos o dar un paseo. Si buscas un perro equilibrado, dulce y con mucha personalidad, ¡Chetos te está esperando!', 'Baja', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/chetos/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/chetos/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/chetos/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/chetos/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Rayo', 'Perro', 'Galgo', 'Macho', '2017-09-09', 'Mediano', 24.0, 'Este galgo senior es muy bueno y sociable con otros perros. Fue entregado por su cazador y ahora necesita una familia. Al ser mayor, es tranquilo y necesita una familia que le dé un hogar por primera vez.', 'Baja', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/rayo/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/rayo/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/rayo/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/rayo/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Hugo', 'Perro', 'Galgo', 'Macho', '2017-07-26', 'Grande', 28.0, 'Este precioso galgo es Hugo, llegó a nosotros hace varios años y es muy cariñoso, vino con un ojo perforado y le tuvimos que operar. En la protectora comparte chenil con otro perro y necesita una familia, es un perro que en la protectora se estresa mucho y necesita alguien que lo adopte y le haga feliz. Es un perro sin miedos y muy cariñoso con las personas, adoptable. ¿Quieres darle un hogar?', 'Media', 1, 0, NULL, NULL, 0, 1, 'Disponible', 'fotos/hugo/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hugo/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hugo/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hugo/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hugo/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hugo/5.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hugo/6.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hugo/7.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hugo/8.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hugo/9.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hugo/10.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hugo/11.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Galleta', 'Perro', 'Podenca maneta', 'Hembra', '2020-09-01', 'Mediano', 17.0, 'Galleta fue entregada por un cazador porque no le servía para cazar… pero lo que ella tiene para dar es algo mucho más valioso: amor. Es una perrita muy cariñosa, sociable y le encanta compartir con otros perros. Es dulce, alargadita, preciosa y con un corazón enorme. Galleta merece ser feliz con una familia que la quiera de verdad. Merece recibir el amor que nunca tuvo.', 'Media', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/galleta/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/galleta/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/galleta/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/galleta/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Tigre', 'Gato', 'Común europeo', 'Macho', '2025-05-01', 'Pequeño', NULL, 'Tigre fue rescatado de la calle junto a sus hermanitos. A pesar de su difícil comienzo, es increíblemente cariñoso, juguetón y sociable. Le encanta el contacto humano, los mimos y hacer compañía. Está sano, desparasitado y listo para comenzar una nueva vida en un hogar donde lo quieran de verdad. Si estás buscando un compañero fiel y tierno, ¡él está esperando por ti!', 'Alta', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/tigre/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/tigre/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/tigre/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/tigre/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/tigre/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Leon', 'Perro', 'Galgo', 'Macho', '2024-09-08', 'Mediano', 20.0, 'León es un galgo tan cariñoso como enérgico. Llegó a nosotros tras la dolorosa pérdida de su dueña, que falleció a causa de un cáncer. A pesar de todo lo vivido, él mantiene un corazón enorme y una alegría contagiosa. Es muy juguetón, sociable y ha convivido sin problemas con otros perros y también con gatos. Le encanta salir a pasear, correr y, sobre todo, recibir mimos. Es un compañero noble, sensible y agradecido. Ahora necesita una familia que lo cuide y lo quiera para siempre, alguien dispuesto a darle la estabilidad y el cariño que merece. Si crees que puedes ser ese hogar, León te está esperando.', 'Alta', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/leon/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/leon/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/leon/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/leon/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Zaira', 'Perro', 'Chihuahua', 'Hembra', '2017-01-01', 'Pequeño', 4.1, 'Zaira nunca conoció la libertad… Pasó toda su vida encerrada en una jaula, sin caricias, sin paseos, sin saber lo que es el amor de una familia. No conoce el calor de un abrazo ni la alegría de correr libre por un parque. Pero, a pesar de todo, Zaira tiene un corazón lleno de esperanza. Necesita un hogar donde la paciencia y el cariño sean infinitos. Está aprendiendo todo desde cero: no sabe caminar con correa, ni hacer sus necesidades en la calle… pero con tiempo, amor y comprensión, irá descubriendo el mundo y confiando poco a poco. Zaira no necesita perfección. Solo necesita a alguien que le enseñe lo que es vivir. Ella no tuvo un comienzo justo, pero aún puede tener un final feliz. ¿Serás tú quien le muestre lo que es el amor de verdad?', 'Alta', 1, NULL, NULL, NULL, 0, 1, 'Disponible', 'fotos/zaira/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/zaira/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/zaira/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/zaira/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/zaira/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Nieve', 'Perro', 'Bichón maltés', 'Hembra', '2021-04-10', 'Pequeño', 8.8, 'Nieve es una Bichon maltés de las grandecitas, muy buena y sociable. Siempre ha vivido en un criadero y no sabe lo que es vivir en una casa. Necesita aprenderlo todo: andar con correa, hacer sus necesidades en la calle, etc. Convive con otros perros sin problema. Necesita una familia que se implique con ella y le dedique tiempo y paciencia para aprender a vivir en un hogar.', 'Alta', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/nieve/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/nieve/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/nieve/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/nieve/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Carmela', 'Perro', 'Bichón Maltés', 'Hembra', '2019-02-06', 'Pequeño', 3.3, 'Carmela tiene 7 años y ha pasado toda su vida en una jaula, utilizada para criar en un criadero. Es una perrita muy buena, aunque al principio se muestra algo miedosa, ya que nunca ha conocido el cariño de un hogar. Se lleva muy bien con otros perros y necesita una familia paciente que le ayude a adaptarse poco a poco. Nunca ha vivido en una casa y viene de una jaula. A Carmela le faltan los deditos de su patita delantera derecha, pero eso no le impide moverse ni disfrutar de su nueva libertad. Se merece una gran familia que le enseñe, por fin, lo que es vivir con amor y respeto.', 'Media', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/carmela/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/carmela/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/carmela/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/carmela/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/carmela/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Brio', 'Gato', 'Común Europeo', 'Macho', '2023-04-10', 'Pequeño', NULL, 'Os presentamos a Brío, este precioso gato negro que rescatamos de la carretera a punto de morir, en muy malas condiciones, desnutrido y sin fuerzas. Ahora está estupendo y preparado para ser adoptado. Tiene herpesvirus felino y necesita un hogar cuanto antes, está castrado y toma vitaminas para el virus que tiene. Es un gato sociable y cariñoso, aquí le tenemos que tener en un jaulón porque su enfermedad es contagiosa para otros gatos. Si no tienes otros gatitos y quieres ayudar a uno, ésta es tu oportunidad. Es un sol. Adopta con responsabilidad y cambia su vida.', 'Media', 1, 1, NULL, NULL, 1, 1, 'Disponible', 'fotos/brio/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Tratamiento', 'Seguimiento veterinario', 'El animal presenta una condición que requiere control', CURDATE(), 'Pendiente');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/brio/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/brio/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/brio/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/brio/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('America', 'Gato', 'Común Europeo', 'Hembra', '2018-01-08', 'Pequeño', NULL, 'La recogieron en muy malas condiciones en un pueblo de Guadalajara y llegó a nosotros desnutrida. Ahora recuperada, espera una familia que lo adopte, es tímida.', 'Media', 1, 0, NULL, NULL, 0, 1, 'Disponible', 'fotos/america/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/america/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/america/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Alicia', 'Perro', 'Galgo', 'Hembra', '2015-03-27', 'Mediano', 22.0, 'Alicia es una galguita mayor, tiene 10 años y todo el amor del mundo por dar. Es tranquila, limpia, muy cariñosa y buena con todos. Después de una vida en un chenil con un cazador, merece conocer lo que es un hogar de verdad. No necesita grandes paseos ni una actividad intensa: solo un rinconcito cálido, compañía y mucho cariño. Su mirada lo dice todo… está lista para recibir amor y devolverlo multiplicado.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/alicia/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/alicia/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/alicia/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/alicia/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Zeta', 'Perro', 'Mestizo', 'Macho', '2024-06-20', 'Mediano', 15.0, 'Zeta fue encontrado abandonado en un cubo de basura, cuando aún no había ni siquiera abierto los ojos, junto con sus hermanos. Lo rescatamos y le hemos criado a biberón, es muy cariñoso y zalamero.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/zeta/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/zeta/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/zeta/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/zeta/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Nala', 'Perro', 'Labradora', 'Hembra', '2019-05-26', 'Grande', 25.6, 'Nala es una labradora preciosa que llegó a nosotros muy enferma, con leishmaniosis sin tratar y muchos miedos. La medicamos y ahora Nala toma únicamente medicación en pastillas para la leishmania, que ya tiene en un nivel más estable de cuando llegó. Con perros es muy buena y siempre evita molestar, con las personas es miedosa y necesita una familia con otros perros y jardín para avanzar más fácilmente.', 'Media', 1, 0, 1, NULL, 1, 1, 'Disponible', 'fotos/nala/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Tratamiento', 'Seguimiento veterinario', 'El animal presenta una condición que requiere control', CURDATE(), 'Pendiente');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/nala/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/nala/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/nala/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Sombra', 'Gato', 'Común Europeo', 'Hembra', '2021-05-22', 'Pequeño', NULL, 'Adulta pero de tamaño pequeño, Sombra es una gata muy buena, sociable con los demás gatos y con un pelaje precioso. Es una belleza que espera un hogar para toda la vida.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/sombra/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/sombra/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/sombra/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/sombra/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/sombra/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Federico', 'Perro', 'Basset hound', 'Macho', '2019-01-01', 'Grande', 30.0, 'Federico es un Basset hound que viene de un criadero. Vivió toda su vida siendo utilizado para la cría y no sabe lo que es un hogar. Necesita mucho tiempo y paciencia para aprender a hacer sus necesidades en la calle. Es sociable con otros perros, convive con varios y es muy cariñoso con las personas.', 'Media', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/federico/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/federico/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/federico/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Tintin', 'Perro', 'Jack Rusell', 'Macho', '2020-01-01', 'Pequeño', 4.0, 'Lo regalaron en Reyes y ya no podían tenerlo. Le hemos recogido para darle una nueva vida, ahora necesita una familia. Es cariñoso, y sociable con perros y gatos.', 'Media', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/tintin/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/tintin/1.jpg', 1);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Coquito', 'Perro', 'Bichón maltés', 'Macho', '2021-04-10', 'Pequeño', 4.2, 'Coquito es un Bichon maltés muy bueno. Siempre ha vivido en un criadero y no sabe lo que es vivir en una casa. Necesita aprenderlo todo: andar con correa, hacer sus necesidades en la calle, etc. Convive con otros perros sin problema. Necesita una familia que se implique con él y le dedique tiempo y paciencia para aprender a vivir en un hogar.', 'Alta', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/coquito/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/coquito/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/coquito/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/coquito/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Nemo', 'Perro', 'Cavalier', 'Macho', '2017-04-08', 'Pequeño', 9.2, 'Nemo es un precioso cavalier que viene de ser semental en un criadero, vivió toda su vida en un a jaula y nunca en un hogar. Necesita paciencia y cariño para adaptarse a una vida en un hogar. Es muy sociable con otros perros y perras.', 'Media', 1, NULL, 1, NULL, 0, 1, 'Disponible', 'fotos/nemo/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/nemo/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/nemo/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Romina', 'Perro', 'Mestizo', 'Hembra', '2023-08-10', 'Mediano', 16.0, 'Romina fue rescatada en los huesos y sin fuerzas para caminar, en Almería. Estaba refugiándose del sol en un almacén de fruta. La hemos traído a Madrid para salvarle la vida. Su estado es crítico y vamos a hacer todo lo posible para sacarla adelante, se lo merece. Ayúdanos apadrinándola ahora y juntos cambiaremos su historia.', 'Media', 1, NULL, NULL, NULL, 0, 1, 'Disponible', 'fotos/romina/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/romina/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/romina/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/romina/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/romina/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Jaimito', 'Perro', 'Teckel miniatura', 'Macho', '2020-10-16', 'Pequeño', 4.3, 'Jaimito es un teckel muy bueno. Siempre ha vivido en un criadero y no sabe lo que es vivir en una casa. Necesita aprenderlo todo: andar con correa, hacer sus necesidades en la calle, etc. Convive con otros perros sin problema. Necesita una familia que se implique con él y le dedique tiempo y paciencia para aprender a vivir en un hogar.', 'Alta', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/jaimito/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/jaimito/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/jaimito/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/jaimito/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Martin', 'Perro', 'Mastín', 'Macho', '2020-04-08', 'Grande', 44.4, 'Este precioso mastín es Martín, le recogimos del CPA de la Comunidad de Madrid, desde donde nos pidieron ayuda para él. Tiene displasia de cadera, es buenísimo, muy cariñoso con las personas y aquí, en la protectora, comparte chenil con otra perra sin problemas y juega en el parque con más perros, machos y hembras. Adopta un mastín, son maravillosos, pura ternura. ¿Quieres darle un hogar?', 'Media', 1, 1, NULL, NULL, 1, 1, 'Disponible', 'fotos/martin/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Tratamiento', 'Seguimiento veterinario', 'El animal presenta una condición que requiere control', CURDATE(), 'Pendiente');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/martin/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/martin/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/martin/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/martin/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/martin/5.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Newman', 'Perro', 'Mestizo', 'Macho', '2023-01-01', 'Pequeño', 10.0, 'Newman es un perrito miedoso y desconfiado al principio, pero con paciencia se vuelve muy cariñoso. Es sociable con otros perros y necesita una familia que respete sus tiempos; así será un perro muy feliz.', 'Media', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/newman/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/newman/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/newman/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Beto', 'Perro', 'San Bernardo', 'Macho', '2016-02-10', 'Gigante', 66.0, 'Este precioso San Bernardo es Beethoven. Es un abuelo XXL, lo mismo que tiene de grande, lo tiene de bueno. Fue entregado por su familia al mudarse de casa, es sociable con otros perros y tiene leishmania controlada con pastillas. En la protectora comparte habitación con otra perra y sale todos los días a los parques de suelta con otros mastines machos y perras hembras. Adoptar un perro grande y abuelo es dar la oportunidad que nadie les da, adopta con responsabilidad. ¿Quieres darle un hogar?', 'Media', 1, NULL, 1, NULL, 1, 1, 'Disponible', 'fotos/beto/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Tratamiento', 'Seguimiento veterinario', 'El animal presenta una condición que requiere control', CURDATE(), 'Pendiente');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/beto/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/beto/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/beto/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/beto/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Hachiko', 'Perro', 'Shiba Inu', 'Macho', '2022-06-11', 'Pequeño', 9.0, 'Hachiko es un Shiba Inu muy especial.Viene de un criadero donde era utilizado únicamente para criar, por lo que no ha tenido la oportunidad de vivir como un perro de familia. Es un perrito muy bueno y sociable con otros perros, pero tiene miedo de las personas y necesita tiempo para confiar. Busca una familia paciente, tranquila y cariñosa, capaz de ofrecerle el espacio y el amor que nunca ha tenido. Hachiko no sabe caminar con correa y no conoce lo que es un hogar, así que tendrá que aprenderlo todo desde cero. Con dedicación, rutinas suaves y mucho cariño, podrá descubrir por fin lo que es sentirse seguro y querido. Si crees que puedes darle la vida que merece, Hachiko te está esperando.', 'Alta', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/hachiko/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hachiko/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hachiko/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hachiko/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Felipe', 'Gato', 'Común Europeo', 'Macho', '2024-05-05', 'Pequeño', NULL, 'Felipe fue encontrado en una carretera muy asustado. Pronto se recuperó y demostró ser un gatito super simpático y cariñoso. Tiene todo el protocolo veterinario al día y necesita una familia para crecer feliz. Es maravilloso, ¡¡adopta un gatito!!', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/felipe/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/felipe/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/felipe/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/felipe/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/felipe/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Venus', 'Gato', 'Común Europeo', 'Hembra', '2020-02-27', 'Pequeño', NULL, 'Venus es una gata tricolor buenísima y cariñosa. La encontraron abandonada en un parque, pero es tan cariñosa, que se adivina que vivió en un hogar. Con los demás gatos es un sol, no es nada miedosa. Buscamos una familia que la adopte, la cuide y la llene de mimos y amor. Una nueva oportunidad para ser feliz.', 'Media', 1, 0, NULL, NULL, 0, 1, 'Disponible', 'fotos/venus/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/venus/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/venus/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/venus/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Hada', 'Gato', 'Común europeo', 'Hembra', '2024-01-01', 'Pequeño', NULL, 'Una gatita con mirada de cuento que está buscando su final feliz Hada es una gatita jovencita, curiosa y dulce, con unos ojos grandes y expresivos que parecen haber salido de un mundo mágico. Tiene una energía suave, tierna y juguetona, y está lista para llenar tu hogar de cariño y ronroneos. Esta pequeña busca una familia que le dé amor, cuidados y un lugar seguro donde crecer feliz. Es una compañera ideal para quienes valoran la compañía felina y quieren sumar una pizca de magia a su vida', 'Alta', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/hada/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hada/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hada/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hada/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Anubis', 'Perro', 'Podenca', 'Hembra', '2023-03-01', 'Mediano', 14.4, 'Anubis es una preciosa podenca que fue encontrada abandonada. Al principio es algo tímida, pero en cuanto coge confianza, demuestra lo dulce y buena que es. Se lleva muy bien con otros perros y está esperando una familia que le dé una segunda oportunidad.', 'Media', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/anubis/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/anubis/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/anubis/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/anubis/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Matilda', 'Perro', 'Mestiza', 'Hembra', '2017-01-01', 'Pequeño', 9.0, 'Matilda acabó en una perrera tras la muerte de su familia. Ahora necesita un hogar. Es muy buena y cariñosa, y sociable con otros perros.', 'Media', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/matilda/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/matilda/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/matilda/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Fenix', 'Perro', 'Pointer', 'Macho', '2023-08-01', 'Mediano', 20.0, 'Fénix es un valiente perrito que hace honor a su nombre. Fue rescatado en condiciones terribles: en los huesos, con las caderas muy dañadas y en un estado general lamentable. Pero gracias a los cuidados y al amor, ¡hoy es otro! Actualmente está en tratamiento para la leishmania con pastillas y responde muy bien. Se ha transformado en un perro precioso, lleno de vida y amor. Es un pointer muy cariñoso, tanto con las personas como con otros perros. Le encantan los juegos, salir de paseo en la ciudad, los mimos y disfrutar de cada momento como si supiera que ha vuelto a nacer. Fénix ha sufrido mucho, pero no ha perdido su dulzura ni sus ganas de vivir. Se merece una segunda oportunidad, una familia que lo quiera y le dé el amor que nunca tuvo.', 'Media', 1, 1, 1, NULL, 1, 1, 'Disponible', 'fotos/fenix/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Tratamiento', 'Seguimiento veterinario', 'El animal presenta una condición que requiere control', CURDATE(), 'Pendiente');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/fenix/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/fenix/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/fenix/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/fenix/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/fenix/5.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/fenix/6.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Dulce', 'Perro', 'Mestiza de galgo', 'Hembra', '2016-02-15', 'Grande', 26.4, 'Dulce es una mestiza de galgo muy linda. Sus colores grisáceos y su mirada egipcia nos cautivan. Es una perra muy cariñosa con las personas. En la protectora tiene un alto nivel de estrés y por ello necesita pronto una familia que le dé una oportunidad de ser feliz. Los perros con estrés alto no avanzan en la protectora, retroceden. Una familia que quiera ayudar es lo que necesita Dulce, por favor adopta. ¿Quieres darle un hogar?', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/dulce/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/dulce/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/dulce/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/dulce/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/dulce/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/dulce/5.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/dulce/6.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Daniela', 'Perro', 'Galgo español', 'Hembra', '2022-02-09', 'Mediano', 23.7, 'Daniela es una galga con miedos, que necesita una familia comprensiva y cariñosa que la adopte. Es fundamental que tenga otros perros y una casa con jardín, para que ella se sienta más segura. Daniela es una galga discreta, con una vida llena de momentos tristes. Los galgos, cuando ya no valen para cazar, viven una vida de miseria y abandono, cambiar su historia es una de las mejores experiencias de vida que puedes tener.', 'Media', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/daniela/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/daniela/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/daniela/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/daniela/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/daniela/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/daniela/5.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Rosa', 'Perro', 'Shih Tzu', 'Hembra', '2016-08-25', 'Pequeño', 4.8, 'Rosa es una perrita muy dulce y cariñosa que ha pasado toda su vida en una jaula. Es un amor absoluto. Le encanta el cariño y tiene una ternura que conquista a todos. Como ha vivido siempre en un criadero, necesita tiempo, paciencia y mucho amor para adaptarse a su nueva vida. Poco a poco irá aprendiendo a hacer sus necesidades en la calle, y con el apoyo adecuado, lo logrará sin duda.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/rosa/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/rosa/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/rosa/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/rosa/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Ara', 'Gato', 'Común europea', 'Hembra', '2022-05-15', 'Pequeño', NULL, 'Ara es ciega y ha llegado a nosotros tras el fallecimiento de su dueña a causa de un cáncer. Es muy buena y sociable, está acostumbrada a convivir con otros gatos y perros. Lleva una vida completamente normal en cuanto se adapta al espacio en el que vive y aprende dónde está todo. Además, es muy limpia.', 'Media', 1, 1, NULL, NULL, 1, 1, 'Disponible', 'fotos/ara/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Tratamiento', 'Seguimiento veterinario', 'El animal presenta una condición que requiere control', CURDATE(), 'Pendiente');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/ara/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/ara/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Gaby', 'Perro', 'Mestizo (tipo PPP)', 'Macho', '2018-01-01', 'Mediano', 17.5, 'Gaby es un perrito abuelito muy cariñoso. Actualmente vive aquí con otro perro macho y es muy tranquilo. Lo rescatamos de una perrera. Tiene las patitas traseras delicadas, algo habitual en perros de edad avanzada. Necesita una familia que le brinde esos últimos años que merece, en un hogar lleno de cariño.', 'Baja', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/gaby/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/gaby/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/gaby/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/gaby/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/gaby/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Ferrero', 'Perro', 'Cavapoo (una mezcla reciente entre Cavalier King Charles Spaniel y Caniche).', 'Macho', '2021-02-04', 'Pequeño', 6.0, 'Ferrero es un perrito muy bueno y tímido, se ha pasado toda su vida en una jaula de un criadero, por lo que el mundo exterior aún es completamente nuevo para él. Está acostumbrado a convivir con otros perros, pero todavía no sabe caminar con correa ni hacer sus necesidades en la calle. Ferrero necesita una familia con mucha paciencia, cariño y comprensión, que le acompañe con suavidad en este proceso y le enseñe que una vida distinta —más libre, segura y feliz— es posible.', 'Alta', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/ferrero/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/ferrero/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/ferrero/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/ferrero/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Yuca', 'Perro', 'Galgo español', 'Hembra', '2013-01-01', 'Mediano', 20.0, 'Yuca es una galga de 13 años que vivió siempre en el chenil de un cazador, pasando frío y calor. Es sociable con otros perros, pero miedosa con las personas.Está hecha polvo: su cuerpo está débil y sufre artrosis tras toda una vida de malos cuidados.Necesita una familia ya.', 'Media', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/yuca/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/yuca/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/yuca/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Manuela', 'Perro', 'Mestiza', 'Hembra', '2016-01-01', 'Mediano', 23.0, 'Manuela es una perrita mayor, de unos 10 años, que fue abandonada. Tiene las orejas cortadas con tijera, así que suponemos que viene de una rehala. Es buenísima, cariñosa y sociable con otros perros. Necesita una familia que le enseñe que la vida es preciosa y que aún tiene tiempo para ser feliz.', 'Media', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/manuela/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/manuela/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/manuela/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/manuela/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Canuto', 'Perro', 'Mestizo', 'Macho', '2017-06-01', 'Mediano', 11.0, 'Canuto fue dejado en la perrera tras el fallecimiento de su querido dueño, un abuelito con el que compartió toda su vida. De un día para otro, perdió su hogar y a su mejor amigo. Ahora está en la protectora, esperando una segunda oportunidad. Tiene unos 8 años , y es un perrito tranquilo, muy noble y cariñoso. Se nota que ha sido querido y que solo necesita volver a sentir el calor de una familia. Si quieres darle a Canuto el amor y la estabilidad que ha perdido, él te lo agradecerá con todo su corazón. ¡No dejemos que pase sus años de madurez solo y en una jaula!', 'Baja', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/canuto/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/canuto/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/canuto/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/canuto/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Luz', 'Gato', 'Común Europeo', 'Hembra', '2023-08-01', 'Pequeño', NULL, 'La recogimos en un trastero en los huesos y sin fuerzas para caminar, estaba más cerca de la muerte que de la vida. Pero conseguimos salvarla y ahora Luz es una gata preciosa, cariñosa, que espera una familia que jamás la vuelva a abandonar, ya que sufrió mucho y es una gatita muy sensible.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/luz/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/luz/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/luz/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/luz/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Marta', 'Perro', 'Mestiza', 'Hembra', '2025-11-05', 'Grande', 30.0, 'Esta cachorra fue recogida junto a su madre y sus hermanos, abandonados en la calle. Es simpática y cariñosa. Su madre es una galga y el padre es mestizo (parece de perro pastor). Estimamos que será de tamaño grande, entre 25 y 30 kilos aproximadamente. Los cachorros necesitan mucha paciencia y tiempo para adaptarse; si quieres darle un hogar, escríbenos.', 'Media', 1, 1, NULL, NULL, 0, 0, 'Disponible', 'fotos/marta/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/marta/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/marta/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/marta/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/marta/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Bruno', 'Perro', 'Mestizo tamaño mediano/grande de adulto', 'Macho', '2025-04-10', NULL, NULL, 'Bruno es un cachorro mestizo lleno de amor y energía, con muchas ganas de encontrar un hogar donde crecer feliz. Lo rescatamos junto a su madre (una mestiza de bóxer) y sus hermanitos, todos abandonados a su suerte. Es un peque muy cariñoso, juguetón y sociable. Le encanta estar acompañado, recibir mimos y repartir ternura a quien se le acerque. Será de tamaño grande cuando crezca, así que necesita una familia responsable, con tiempo y espacio para ofrecerle los cuidados y la atención que merece. Bruno solo conoce el lado difícil de la vida, pero está listo para descubrir lo bonito de tener una familia que lo quiera para siempre.', 'Alta', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/bruno/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/bruno/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/bruno/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/bruno/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Bruji', 'Perro', 'Bóxer', 'Hembra', '2019-04-01', 'Grande', 25.5, 'Bruji es una bóxer muy buena que llegó a nosotros para ser feliz. La operamos de una cadena mamaria y la salen pequeños tumores, pero hace una vida totalmente normal. Merece una familia que la de un hogar y mucha felicidad. Adopta a Bruji.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/bruji/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/bruji/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/bruji/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/bruji/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Charly', 'Perro', 'Podenco', 'Macho', '2023-01-01', 'Pequeño', 9.0, 'Charlie fue encontrado con un cepo en su cuello, lo tenía destrozado. Pero ya está recuperado, es un perro joven y sociable con otros perros. Es pequeño de tamaño, de unos 9 kilos y miedoso con las personas. Necesita mucho cariño y paciencia, para superar sus traumas con las personas. Para Charlie es fundamental que la familia que le adopte tenga otro perro sociable, para facilitar el avance en sus miedos e irlos dejando atrás. ¿Quieres apadrinar a Charly? Haz clic aquí.', 'Media', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/charly/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/charly/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/charly/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/charly/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/charly/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/charly/5.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/charly/6.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Gitana', 'Perro', 'Mestiza', 'Hembra', '2010-01-01', 'Pequeño', 5.0, 'Gitana tiene 16 años y su familia la ha dejado en la protectora. Es una perrita muy mayor, con cataratas y principios de demencia senil. Es muy buena y sociable con otros perros. Necesita urgentemente una familia que la adopte y la cuide.', 'Media', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/gitana/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/gitana/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/gitana/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Nerea', 'Perro', 'Podenca', 'Hembra', '2023-04-01', 'Mediano', 15.0, 'Nerea es una perra miedosa y tímida. Le falta un ojo porque fue operada; venía con el ojo reventado tras una paliza que le dio algún inhumano. Es buenísima, sumisa y sociable con otros perros. Necesita una persona que viva en una zona tranquila y, preferiblemente, con otros perros, ya que eso la ayudará a avanzar.', 'Media', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/nerea/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/nerea/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/nerea/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/nerea/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Mauri', 'Gato', 'Común europeo / Bosque de Noruega', 'Macho', '2018-04-22', 'Pequeño', NULL, 'Mauri es un gato tuerto, peludo y precioso. Llegó tras el fallecimiento de su dueña, Susana. Vivía con otros gatos y perros. Es un poco tímido al principio, pero muy bueno, limpio y cariñoso. Este gatito se merece una nueva familia que lo quiera mucho.', 'Media', 1, 1, NULL, NULL, 1, 1, 'Disponible', 'fotos/mauri/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Tratamiento', 'Seguimiento veterinario', 'El animal presenta una condición que requiere control', CURDATE(), 'Pendiente');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/mauri/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/mauri/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Bruce', 'Perro', 'Bulldog inglés', 'Macho', '2012-09-08', 'Mediano', 21.0, 'Bruce es un bulldog inglés que llega a nosotros tras el fallecimiento de su dueña por un cáncer. Es muy bueno y cariñoso, acostumbrado a vivir con otros perros y con gatos. Está en tratamiento por giardias, un parásito intestinal que se cura con medicación; lo contrajo en la residencia canina donde estuvo unas semanas tras el ingreso de su dueña. Es un abuelito y se merece una nueva vida.', 'Media', 1, 1, 1, 1, 0, 1, 'Disponible', 'fotos/bruce/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/bruce/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/bruce/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/bruce/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Vida', 'Perro', 'Podenca', 'Hembra', '2022-01-01', 'Pequeño', 6.0, 'Vida es una preciosa podenquita de unos 4 años que está buscando una segunda oportunidad. Su historia no ha sido fácil: fue rescatada tras haber sido abandonada, y el miedo que sentía nos mostró cuánto había sufrido. A día de hoy, Vida sigue siendo tímida con las personas. Necesita tiempo, paciencia y mucho amor para poder confiar, pero merece cada segundo. Con otros perros, en cambio, es completamente diferente: es sociable, se siente segura y se relaciona con total normalidad. Por eso, Vida necesita una familia especial, con otro perrito equilibrado que le sirva de apoyo y le ayude a seguir avanzando. Si tienes espacio en tu hogar y en tu corazón para una perrita dulce, sensible y con muchas ganas de empezar de nuevo, Vida te está esperando. ¡Dale la oportunidad de conocer por fin lo que es una vida feliz!', 'Media', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/vida/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/vida/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/vida/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/vida/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/vida/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Alegria', 'Perro', 'Podenca', 'Hembra', '2024-10-01', 'Pequeño', 9.0, 'Alegría fue rescatada del abandono en Murcia, donde fue encontrada desorientada y llena de heridas en una carretera. Gracias a los cuidados y al cariño, se ha recuperado por completo y hace honor a su nombre: ahora es una perrita llena de vida y ternura. Es muy buena, dulce y sociable con otros perros. Le encanta la compañía, los mimos y los paseos tranquilos. Después de todo lo que ha pasado, Alegría solo necesita una familia que le dé el amor y la seguridad que siempre mereció.', 'Baja', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/alegria/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/alegria/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/alegria/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/alegria/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Olaf', 'Perro', 'Mestizo', 'Macho', '2025-11-05', 'Grande', 30.0, 'Este cachorro fue recogido junto a su madre y sus hermanos, abandonados en la calle. Es simpático y cariñoso. Su madre es una galga y el padre es mestizo (parece de perro pastor). Estimamos que será de tamaño grande, entre 25 y 30 kilos aproximadamente. Los cachorros necesitan mucha paciencia y tiempo para adaptarse; si quieres darle un hogar, escríbenos.', 'Media', 1, 1, NULL, NULL, 0, 0, 'Disponible', 'fotos/olaf/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/olaf/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/olaf/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/olaf/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/olaf/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Claudio', 'Gato', 'Común Europeo', 'Macho', '2024-05-01', 'Pequeño', NULL, 'Claudio es un gatito precioso y cariñoso, parece un mini panda. Fue recogido en la calle y está con todo el protocolo veterinario al día, deseando encontrar un hogar. Llena tu vida de ronroneos y amor, adopta a Claudio.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/claudio/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/claudio/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/claudio/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/claudio/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/claudio/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Alaska', 'Gato', 'Común Europeo', 'Hembra', '2018-10-11', 'Pequeño', NULL, 'Alaska es una gata amorosa que siempre busca el contacto humano. Espera cada día en la puerta la llegada de los cuidadores de Animal Rescue para darles montones de ronroneos y mimos. Una gatita así merece cuanto antes un hogar donde ser muy feliz.', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/alaska/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/alaska/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/alaska/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/alaska/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/alaska/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Xena', 'Perro', 'Mestiza de bóxer', 'Hembra', '2023-01-01', 'Mediano', 22.0, 'Xena es una perrita muy buena que fue recogida tras haber sido abandonada junto a sus cachorros. Es tímida, pero se lleva muy bien con otros perros. Sus cachorros ya han sido adoptados, y ahora ella necesita una familia. Es una perrita maravillosa que merece una oportunidad.', 'Media', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/xena/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/xena/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/xena/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/xena/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Carla', 'Perro', 'Mestiza', 'Hembra', '2025-11-05', 'Grande', 30.0, 'Esta cachorra fue recogida junto a su madre y sus hermanos, abandonados en la calle. Es simpática y cariñosa. Su madre es una galga y el padre es mestizo (parece de perro pastor). Estimamos que será de tamaño grande, entre 25 y 30 kilos aproximadamente. Los cachorros necesitan mucha paciencia y tiempo para adaptarse; si quieres darle un hogar, escríbenos.', 'Media', 1, 1, NULL, NULL, 0, 0, 'Disponible', 'fotos/carla/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/carla/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/carla/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/carla/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/carla/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Harry', 'Perro', 'Caniche apricot', 'Macho', '2016-12-29', 'Pequeño', 4.4, 'Harry es muy bueno, pero tímido . Siempre ha vivido en un criadero y no sabe lo que es vivir en una casa. Necesita aprenderlo todo: andar con correa, hacer sus necesidades en la calle, etc. Convive con otros perros sin problema. Necesita una familia que se implique con él y le dedique tiempo y paciencia para aprender a vivir en un hogar.', 'Alta', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/harry/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/harry/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/harry/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/harry/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Violeta', 'Gato', 'Común Europeo', 'Hembra', '2022-04-01', 'Pequeño', NULL, 'La recogieron en muy malas condiciones en un pueblo de Guadalajara y llegó a nosotros desnutrida. Ahora recuperada, espera una familia que la adopte, es tímida. Es apta con gatos y de momento no permite la manipulación.', 'Media', 1, 0, NULL, 1, 0, 1, 'Disponible', 'fotos/violeta/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/violeta/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/violeta/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/violeta/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Mateo', 'Perro', 'Mestizo', 'Macho', '2016-01-01', 'Pequeño', 5.0, 'Mateo: un corazón lleno de amor que merece una segunda oportunidad. Mateo tiene 10 años y una historia que nos parte el alma. Cuando enfermó de leishmaniosis y perdió el pelo, su familia lo relegó al jardín, como si ya no mereciera su amor. Allí pasó sus días, solo y hundido. Pero Mateo es un luchador. Hoy está recuperado, fuerte y lleno de ganas de vivir. Es un perrito muy bueno, cariñoso y sociable con otros perros. A pesar de lo que ha vivido, conserva la nobleza y la dulzura de siempre. Ahora solo necesita lo que nunca tuvo de verdad: una familia que lo valore y lo quiera para siempre. Toma medicación en pastilla 2 veces al día para la leishmania.', 'Media', 1, 1, 1, NULL, 1, 1, 'Disponible', 'fotos/mateo/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Tratamiento', 'Seguimiento veterinario', 'El animal presenta una condición que requiere control', CURDATE(), 'Pendiente');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/mateo/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/mateo/2.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Kira', 'Perro', 'Mestiza de galgo', 'Hembra', '2022-04-15', 'Grande', 27.4, 'Kira fue recogida cuando la tiraron de una furgoneta en marcha, según nos contó el CPA de la Comunidad de Madrid y la policía. Es una mestiza de galgo preciosa, una perra muy cariñosa con las personas que merece ser feliz. Se nota que Kira no tuvo una buena vida y aún tiene que aprender a ser feliz. Adopta a Kira, cambia su suerte. ¿Quieres darle un hogar?', 'Media', 1, 1, NULL, NULL, 0, 1, 'Disponible', 'fotos/kira/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/kira/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/kira/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/kira/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/kira/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/kira/5.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/kira/6.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/kira/7.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/kira/8.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Maggie', 'Perro', 'Galgo español', 'Hembra', '2015-01-01', 'Mediano', 17.0, 'Esta galguita es mayor y muy buena. Se llama Maggi y viene de una casa; su dueña la adoptó y acaba de fallecer por un cáncer. Está acostumbrada a vivir con perros y gatos, es tranquila y se merece una nueva familia que la quiera mucho.', 'Media', 1, 1, 1, 1, 0, 1, 'Disponible', 'fotos/maggie/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/maggie/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/maggie/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/maggie/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Odin', 'Perro', 'Gran Danés arlequín', 'Macho', '2022-02-15', 'Gigante', 55.0, 'Odín: un gigante noble en busca de un nuevo comienzo Odín es un Gran Danés de 4 años, imponente por fuera y puro amor por dentro. Es un perro precioso, cariñoso, limpio y muy bueno en casa. Su familia ya no podía mantenerlo, y ahora busca una segunda oportunidad con alguien que le dé el espacio y el cariño que necesita. Odín no está acostumbrado a la vida en la ciudad, por lo que lo ideal sería una casa con jardín donde pueda estar tranquilo y feliz. A pesar de su tamaño, es muy sociable tanto con otros perros (grandes y pequeños) como con gatos, y se adapta muy bien al entorno del hogar. Este gigante de corazón dulce solo necesita un lugar donde pueda sentirse seguro, acompañado y querido.', 'Baja', 1, 1, 1, 1, 0, 1, 'Disponible', 'fotos/odin/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/odin/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/odin/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/odin/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/odin/4.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Leo', 'Perro', 'Podenco', 'Macho', '2023-02-01', 'Pequeño', 7.0, 'Leo es un podenco valiente que ha pasado por muchísimo. Fue recogido tras sufrir un fuerte golpe que le provocó una lesión grave en la columna, dejándolo con incontinencia. Aunque ahora está muy recuperado y hace una vida prácticamente normal, no siempre puede hacer sus necesidades por sí solo. Es un perro muy bueno y noble, aunque algo miedoso por todo lo vivido. Se lleva bien con otros perros y necesita, más que nunca, una familia comprometida, paciente y con ganas de darle el amor y los cuidados que tanto merece. Sabemos que no es una adopción fácil, pero Leo es un perro especial que solo necesita una oportunidad. Su corazón es tan grande como sus ganas de vivir.', 'Media', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/leo/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/leo/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/leo/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/leo/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Hope', 'Perro', 'Pointer', 'Hembra', '2017-01-01', 'Mediano', 17.6, 'La encontraron apaleada en un pueblo de Toledo, con unos golpes tan fuertes que no podía ni moverse y con un ojo destrozado. Fue operada y perdió su ojito, pero Hope ganó una vida. Es la esperanza de la compasión contra el maltrato y la crueldad hacia una perra, que solo con mirarla se derrite ante ti moviendo el rabito. Ellos no guardan rencor, son capaces de perdonar. Es una perrita pointer maravillosa y se merece una familia que la adopte y la cuide, los perros abandonados son siempre muy agradecidos.', 'Media', 1, NULL, NULL, NULL, 0, 1, 'Disponible', 'fotos/hope/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hope/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hope/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/hope/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Chocolate', 'Perro', 'Podenco', 'Macho', '2022-01-01', 'Mediano', 10.1, 'Chocolate fue encontrado muy enfermo, con leishmania sin tratar, y ahora se encuentra en tratamiento con medicación inyectada y oral. Es un podenco muy sociable, buenísimo y cariñoso con otros perros. Se merece una familia que le adopte y le dé esa oportunidad de vida que nunca tuvo. Porque cambiar la vida de un animal te llenará de alegrías.', 'Media', 1, 1, 1, NULL, 1, 1, 'Disponible', 'fotos/chocolate/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Tratamiento', 'Seguimiento veterinario', 'El animal presenta una condición que requiere control', CURDATE(), 'Pendiente');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/chocolate/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/chocolate/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/chocolate/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Bianca', 'Perro', 'Galgo', 'Hembra', '2022-05-09', 'Mediano', 25.0, 'Bianca es una preciosa galga blanca con una mirada que lo dice todo. Fue rescatada tras ser abandonada en la calle, y su cuerpo guarda cicatrices de un pasado difícil que nunca debió vivir. Es tímida con las personas, pero cada día da pequeños pasos hacia la confianza. Vive con otros perros que le hacen de apoyo, y con ellos se siente segura: se lleva muy bien con todos y le ayudan a ganar seguridad. Bianca necesita una familia con paciencia, sensibilidad y mucho cariño. Un hogar tranquilo donde pueda sentirse protegida y descubrir, poco a poco, que la vida también puede ser buena.', 'Baja', 1, 0, 1, NULL, 0, 1, 'Disponible', 'fotos/bianca/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/bianca/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/bianca/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/bianca/3.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/bianca/4.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/bianca/5.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Maya', 'Perro', 'Mestiza', 'Hembra', '2025-01-01', 'Pequeño', 9.4, 'Maya tiene solo 1 año y una energía que ilumina a cualquiera. Fue encontrada abandonada en la calle, pero eso no ha apagado su alegría ni sus ganas de dar amor. Es una perrita alegre, juguetona y muy pizpireta, siempre lista para correr, jugar y repartir besos. Además, es muy cariñosa y sociable con otros perros, por lo que sería una gran compañera para hogares con más peludos. Maya solo necesita una familia que le dé la oportunidad de seguir siendo esa perrita feliz que conquista corazones. Tiene ehrlichia una enfermedad de garrapatas que venía con ella y estamos tratando con medicación.', 'Alta', 1, 1, 1, NULL, 1, 1, 'Disponible', 'fotos/maya/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Tratamiento', 'Seguimiento veterinario', 'El animal presenta una condición que requiere control', CURDATE(), 'Pendiente');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/maya/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/maya/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/maya/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Lena', 'Perro', 'Caniche apricot', 'Hembra', '2016-01-30', 'Pequeño', 6.3, 'Lena es una caniche abuela muy buena. Siempre ha vivido en un criadero y no sabe lo que es vivir en una casa. Necesita aprenderlo todo: andar con correa, hacer sus necesidades en la calle, etc. Convive con otros perros sin problema. Necesita una familia que se implique con él y le dedique tiempo y paciencia para aprender a vivir en un hogar. Tiene anaplasma, una enfermedad de garrapatas que se cura con el tratamiento que está.', 'Alta', 1, 1, 1, NULL, 1, 1, 'Disponible', 'fotos/lena/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Tratamiento', 'Seguimiento veterinario', 'El animal presenta una condición que requiere control', CURDATE(), 'Pendiente');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/lena/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/lena/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/lena/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Valkiria', 'Perro', 'Mestiza', 'Hembra', '2015-07-22', 'Mediano', 21.6, 'Esta belleza blanca es Valkiria y llegó junto a su hermano Galo hace 8 años. Tiene terror al ser humano y no permite la manipulación. Estos perros con traumas son los más difíciles de sacar adelante. Ellos permanecen con nosotros, cuidados y atendidos, sabemos que su adopción es muy difícil.', 'Media', 1, 0, NULL, NULL, 0, 1, 'Disponible', 'fotos/valkiria/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/valkiria/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/valkiria/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/valkiria/3.jpg', 0);

INSERT INTO animales (nombre, especie, raza, sexo, fecha_nacimiento, tamano, peso, descripcion, nivel_energia, apto_pisos, sociable_ninos, sociable_perros, sociable_gatos, enfermedad_cronica, esterilizado, estado, foto_portada)
VALUES ('Nika', 'Perro', 'Chihuahua', 'Hembra', '2017-01-01', 'Pequeño', 4.2, 'Nika es una chihuahua de 9 años que ha pasado toda su vida en una jaula de un criadero. Nunca ha conocido el cariño de una familia, pero a pesar de todo, es una perrita muy buena y noble. Actualmente convive con otros perros sin problema, pero necesita una familia paciente y cariñosa que le ayude a adaptarse a una vida en libertad. Nika aún no sabe hacer sus necesidades fuera de casa y no está acostumbrada a pasear con correa, ya que siempre vivió encerrada. Con tiempo, amor y comprensión, seguro que logrará descubrir lo que es ser realmente feliz.', 'Alta', 1, 1, 1, NULL, 0, 1, 'Disponible', 'fotos/nika/1.jpg');
SET @id_animal = LAST_INSERT_ID();

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Revisión', 'Revisión inicial', 'Chequeo veterinario al ingresar en el refugio', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Desparasitación', 'Desparasitación interna y externa', 'Tratamiento antiparasitario preventivo', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Vacuna', 'Vacunación básica', 'Vacunas al día según protocolo veterinario', CURDATE(), 'Completado');
INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
VALUES (@id_animal, 'Cirugía', 'Esterilización', 'Animal esterilizado antes de adopción', CURDATE(), 'Completado');
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/nika/1.jpg', 1);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/nika/2.jpg', 0);
INSERT INTO animal_fotos (id_animal, ruta_foto, es_principal)
VALUES (@id_animal, 'fotos/nika/3.jpg', 0);

UPDATE animales 
SET microchip = CONCAT('981', LPAD(id_animal, 12, '0'))
WHERE especie = 'Perro' 
  AND TIMESTAMPDIFF(MONTH, fecha_nacimiento, CURDATE()) >= 2;

UPDATE animales 
SET microchip = CONCAT('900', LPAD(id_animal, 12, '0'))
WHERE especie = 'Gato' 
  AND TIMESTAMPDIFF(MONTH, fecha_nacimiento, CURDATE()) >= 2;

UPDATE animales SET nivel_paciencia = 'Alta', es_para_principiantes = FALSE, aviso_importante = 'Rescatada de criadero. Presenta estereotipias (movimientos circulares). Requiere un hogar muy tranquilo y rutina estable.' WHERE nombre IN ('Barbie', 'Diva');
UPDATE animales SET nivel_paciencia = 'Alta', es_para_principiantes = FALSE, aviso_importante = 'Cachorro con miedos profundos. Es obligatorio que conviva con otro perro sociable que le sirva de guía y apoyo.' WHERE nombre = 'Porthos';
UPDATE animales SET nivel_paciencia = 'Alta', es_para_principiantes = FALSE, aviso_importante = 'Animal con miedos o timidez extrema hacia los humanos. Requiere protocolo de adaptación lento y mucha calma.' WHERE nombre IN ('Lima', 'Gaia', 'Brownie', 'Dori', 'Perla');
UPDATE animales SET nivel_paciencia = 'Media', es_para_principiantes = TRUE, aviso_importante = 'Cachorro en etapa de aprendizaje. Requiere paciencia para educación básica y socialización activa.' WHERE nombre IN ('Caramelo', 'Melón', 'Golfo', 'Estela', 'Nevado');
UPDATE animales SET nivel_paciencia = 'Media', es_para_principiantes = FALSE, aviso_importante = 'Condición de salud especial (Enanismo/Leishmania/Senior). Requiere compromiso con su tratamiento o seguimiento veterinario.' WHERE nombre IN ('Manolo', 'Zafiro');
UPDATE animales SET nivel_paciencia = 'Media', es_para_principiantes = FALSE, aviso_importante = 'Solo sociable con perros machos. No es compatible con otras hembras en el mismo hogar.' WHERE nombre = 'Lolita';
UPDATE animales SET nivel_paciencia = 'Media', es_para_principiantes = FALSE, aviso_importante = 'Perro de gran tamaño (48kg) que necesita entorno rural o jardín. No apto para pisos en ciudades ruidosas.' WHERE nombre = 'Chendo';
UPDATE animales SET nivel_paciencia = 'Baja', es_para_principiantes = TRUE, aviso_importante = 'Animal muy equilibrado y sociable. Ideal para familias sin experiencia previa en adopciones.' WHERE nombre IN ('Pili', 'Marfil', 'Tofu', 'Abel', 'Molly', 'Yogui', 'Budy', 'Pecas', 'Chetos');
UPDATE animales SET nivel_paciencia = 'Baja', es_para_principiantes = TRUE, aviso_importante = 'Muy cariñosa y apta para convivir con gatos, pero tiene un fuerte instinto de caza en el exterior.' WHERE nombre = 'Amaia';
UPDATE animales SET nivel_paciencia = 'Baja', es_para_principiantes = 1, aviso_importante = 'Galgo senior muy tranquilo y noble. Busca un hogar calmado tras una vida de caza.' WHERE nombre = 'Rayo';
UPDATE animales SET nivel_paciencia = 'Media', es_para_principiantes = 1, aviso_importante = 'Perro muy cariñoso que sufre estrés en el refugio. Tuvo una cirugía ocular pero hace vida normal.' WHERE nombre = 'Hugo';
UPDATE animales SET nivel_paciencia = 'Baja', es_para_principiantes = 1, aviso_importante = 'Podenca extremadamente dulce y sociable con otros perros. Muy agradecida.' WHERE nombre = 'Galleta';
UPDATE animales SET nivel_paciencia = 'Baja', es_para_principiantes = 1, aviso_importante = 'Cachorro rescatado muy sociable y cariñoso. Apto para cualquier hogar.' WHERE nombre = 'Tigre';
UPDATE animales SET nivel_paciencia = 'Baja', es_para_principiantes = 1, aviso_importante = 'Galgo joven muy sociable con perros y gatos. Carácter noble y alegre.' WHERE nombre = 'Leon';
UPDATE animales SET nivel_paciencia = 'Alta', es_para_principiantes = 0, aviso_importante = 'Rescatada de jaula de cría. No sabe caminar con correa ni rutinas de casa. Solo adoptantes expertos.' WHERE nombre = 'Zaira';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'Rescatada de criadero. No conoce la vida en un hogar. Necesita aprender a pasear y rutinas desde cero.' WHERE nombre = 'Nieve';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'Ex-criadero. Miedosa al principio. Le falta parte de una pata, pero es funcional. Necesita mucha calma.' WHERE nombre = 'Carmela';
UPDATE animales SET nivel_paciencia = 'Media', es_para_principiantes = 1, aviso_importante = 'Gato muy cariñoso. Debido a su herpesvirus, debe ser el único gato de la casa o convivir con otros positivos.' WHERE nombre = 'Brio';
UPDATE animales SET nivel_paciencia = 'Media', es_para_principiantes = 1, aviso_importante = 'Gata rescatada en malas condiciones, ya recuperada. Es algo tímida.' WHERE nombre = 'America';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 1, aviso_importante = 'Galga senior (10 años) muy tranquila, limpia y cariñosa. Ideal para un hogar relajado.' WHERE nombre = 'Alicia';
UPDATE animales SET nivel_paciencia = 'Media', es_para_principiantes = 1, aviso_importante = 'Cachorro criado a biberón. Muy zalamero. Requiere compromiso de esterilización.' WHERE nombre = 'Zeta';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'Labradora miedosa con leishmania. Imprescindible hogar con jardín y otros perros para su progreso.' WHERE nombre = 'Nala';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 1, aviso_importante = 'Gata adulta de tamaño pequeño, muy sociable y equilibrada.' WHERE nombre = 'Sombra';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'Ex-criadero. No conoce un hogar. Requiere mucha paciencia para aprender higiene y rutinas de paseo.' WHERE nombre = 'Federico';
UPDATE animales SET nivel_paciencia = 'Media', es_para_principiantes = 1, aviso_importante = 'Cachorro de Jack Russell (6 meses). Muy activo y sociable. Necesita educación básica.' WHERE nombre = 'Tintin';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'Bichón maltés de criadero. Necesita aprenderlo todo desde cero con mucha dedicación.' WHERE nombre IN ('Coquito', 'Nemo');
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'CASO CRÍTICO. Actualmente en recuperación física. Solo se entrega a familias dispuestas a darle cuidados especiales.' WHERE nombre = 'Romina';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'Teckel de criadero. Requiere familia paciente que le enseñe a vivir en una casa.' WHERE nombre = 'Jaimito';
UPDATE animales SET nivel_paciencia = 'Media', es_para_principiantes = 0, aviso_importante = 'Mastín de 44kg con displasia. Gran corazón, pero requiere casa sin muchas escaleras debido a su cadera.' WHERE nombre = 'Martin';
UPDATE animales SET nivel_paciencia = 'Media', es_para_principiantes = 1, aviso_importante = 'Miedoso al principio, pero muy cariñoso al ganar confianza. Necesita que respeten sus tiempos.' WHERE nombre = 'Newman';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 0, aviso_importante = 'Abuelo XXL (66kg). Pura bondad. Debido a su tamaño y edad, requiere hogar con espacio y sin muchas escaleras.' WHERE nombre = 'Beto';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'Shiba Inu de criadero. No sabe pasear con correa ni conoce un hogar. Requiere familia con experiencia en perros con miedos.' WHERE nombre = 'Hachiko';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 1, aviso_importante = 'Gatito joven muy simpático y cariñoso. Ideal para cualquier hogar.' WHERE nombre = 'Felipe';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 1, aviso_importante = 'Gata tricolor extremadamente cariñosa. Acostumbrada a vivir en un hogar previo.' WHERE nombre = 'Venus';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 1, aviso_importante = 'Gatita dulce, juguetona y curiosa. Muy equilibrada.' WHERE nombre = 'Hada';
UPDATE animales SET nivel_paciencia = 'Media', es_para_principiantes = 1, aviso_importante = 'Podenca algo tímida al inicio, pero muy dulce. Sociable con otros perros.' WHERE nombre = 'Anubis';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 1, aviso_importante = 'Perra mayor (9 años) rescatada de una perrera tras fallecer su familia. Muy noble y agradecida.' WHERE nombre = 'Matilda';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 1, aviso_importante = 'Superviviente nato. Muy cariñoso y agradecido. Adaptado a paseos en ciudad.' WHERE nombre = 'Fenix';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'Sufre estrés alto en protectora. Necesita adopción urgente para no retroceder en su comportamiento.' WHERE nombre = 'Dulce';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'Galga miedosa. IMPRESCINDIBLE casa con jardín y convivencia con otros perros para su seguridad.' WHERE nombre = 'Daniela';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'Ex-criadero. Shih Tzu muy dulce que debe aprender higiene y rutinas de casa desde cero.' WHERE nombre = 'Rosa';
UPDATE animales SET nivel_paciencia = 'Media', es_para_principiantes = 1, aviso_importante = 'Gata ciega. Hace vida normal. Solo requiere que no se muevan los muebles de sitio drásticamente al principio.' WHERE nombre = 'Ara';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 1, aviso_importante = 'Perro senior muy tranquilo. Solo busca un hogar donde descansar sus últimos años.' WHERE nombre = 'Gaby';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'Cavapoo de criadero. Muy tímido. No sabe caminar con correa aún. Necesita mucha suavidad.' WHERE nombre = 'Ferrero';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'Galga de 13 años muy miedosa y físicamente débil. Necesita un hogar tranquilo con urgencia.' WHERE nombre = 'Yuca';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 1, aviso_importante = 'Rescatada de rehala con orejas cortadas. Es extremadamente buena y noble.' WHERE nombre = 'Manuela';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 1, aviso_importante = 'Perdió a su dueño y su hogar. Es un perro muy faldero, educado y tranquilo.' WHERE nombre = 'Canuto';
UPDATE animales SET nivel_paciencia = 'Media', es_para_principiantes = 1, aviso_importante = 'Gatita muy sensible que fue rescatada al borde de la muerte. Necesita mucha estabilidad emocional.' WHERE nombre = 'Luz';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 1, aviso_importante = 'Cachorra mestiza (madre galga). Será de tamaño grande (30kg). Requiere educación desde cero.' WHERE nombre = 'Marta';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 1, aviso_importante = 'Cachorro de bóxer. Muy juguetón y sociable. Será de tamaño mediano/grande.' WHERE nombre = 'Bruno';
UPDATE animales SET nivel_paciencia = 'Media', es_para_principiantes = 1, aviso_importante = 'Bóxer senior muy buena. Busca tranquilidad tras superar una cirugía importante.' WHERE nombre = 'Bruji';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'Rescatado de un cepo. Miedoso con humanos. IMPRESCINDIBLE otro perro sociable en el hogar para su avance.' WHERE nombre = 'Charly';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'CASO URGENTE. Perra senior de 16 años. Su familia la abandonó con demencia. Necesita cuidados paliativos y mucho amor.' WHERE nombre = 'Gitana';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'Superviviente de maltrato. Muy sumisa y miedosa. Requiere zona de residencia tranquila y otro perro de apoyo.' WHERE nombre = 'Nerea';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 1, aviso_importante = 'Gato precioso y muy noble. Tuerto. Acostumbrado a perros y gatos.' WHERE nombre = 'Mauri';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 1, aviso_importante = 'Bulldog inglés abuelito. Muy cariñoso. Perdió a su dueña y busca un hogar donde jubilarse.' WHERE nombre = 'Bruce';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'Podenca miedosa. Necesita tiempo y otro perro equilibrado en casa para ganar seguridad.' WHERE nombre = 'Vida';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 1, aviso_importante = 'Recuperada tras abandono. Muy dulce y agradecida. Ideal para cualquier tipo de familia.' WHERE nombre = 'Alegria';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 1, aviso_importante = 'Cachorro de galgo/pastor. Será de tamaño grande (30kg). Requiere educación y paciencia activa.' WHERE nombre = 'Olaf';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 1, aviso_importante = 'Gatito "mini panda" muy cariñoso y juguetón. Ideal para cualquier hogar.' WHERE nombre = 'Claudio';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 1, aviso_importante = 'Gata extremadamente amorosa. Busca activamente el contacto humano y los mimos.' WHERE nombre = 'Alaska';
UPDATE animales SET nivel_paciencia = 'Media', es_para_principiantes = 1, aviso_importante = 'Madre coraje. Tímida inicialmente pero muy noble. Se lleva genial con otros perros.' WHERE nombre = 'Xena';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 1, aviso_importante = 'Cachorra de galgo/pastor. Será de tamaño grande (30kg). Requiere educación activa.' WHERE nombre = 'Carla';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'Ex-criadero. No conoce la vida en una casa. Debe aprender a pasear con correa y rutinas de higiene.' WHERE nombre = 'Harry';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'Gatita muy miedosa. De momento no permite manipulación física. Necesita un hogar muy paciente.' WHERE nombre = 'Violeta';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 1, aviso_importante = 'Perro senior muy noble. Tras años de olvido en un jardín, solo busca una familia que lo valore.' WHERE nombre = 'Mateo';
UPDATE animales SET nivel_paciencia = 'Media', es_para_principiantes = 1, aviso_importante = 'Superviviente de maltrato extremo. Muy cariñosa con personas a pesar de su pasado.' WHERE nombre = 'Kira';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 1, aviso_importante = 'Galga senior muy tranquila. Perdió a su dueña por cáncer. Apta con perros y gatos.' WHERE nombre = 'Maggie';
UPDATE animales SET nivel_paciencia = 'Media', es_para_principiantes = 0, aviso_importante = 'GIGANTE NOBLE (55kg). No apto para ciudad. Imprescindible casa con jardín y espacio.' WHERE nombre = 'Odin';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'PERRO ESPECIAL. Incontinente. Requiere familia muy comprometida con sus cuidados físicos.' WHERE nombre = 'Leo';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 1, aviso_importante = 'Superviviente de maltrato. Perdió un ojo por golpes. Extremadamente dulce y agradecida.' WHERE nombre = 'Hope';
UPDATE animales SET nivel_paciencia = 'Media', es_para_principiantes = 0, aviso_importante = 'Podenco muy noble. Necesita terminar su tratamiento de Leishmania en un hogar.' WHERE nombre = 'Chocolate';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'Galga muy tímida con cicatrices físicas de maltrato. Necesita otro perro de apoyo.' WHERE nombre = 'Bianca';
UPDATE animales SET nivel_paciencia = 'Baja',  es_para_principiantes = 1, aviso_importante = 'Perrita joven, pizpireta y muy alegre. En tratamiento por Ehrlichia.' WHERE nombre = 'Maya';
UPDATE animales SET nivel_paciencia = 'Alta',  es_para_principiantes = 0, aviso_importante = 'Rescatada de criadero. No conoce un hogar. Debe aprender rutinas básicas desde cero.' WHERE nombre = 'Lena';
UPDATE animales SET nivel_paciencia = 'Muy Alta', es_para_principiantes = 0, aviso_importante = 'TRAUMA SEVERO. Tiene terror al ser humano y no permite la manipulación. Adopción solo para expertos en rehabilitación o santuarios.' WHERE nombre = 'Valkiria';
UPDATE animales SET nivel_paciencia = 'Alta',     es_para_principiantes = 0, aviso_importante = 'EX-CRIADERO. No sabe pasear con correa ni hacer sus necesidades fuera. Necesita aprender a vivir en libertad.' WHERE nombre = 'Nika';

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
SELECT id_animal, 'Tratamiento', 'Protocolo Leishmaniosis', 'Control de enfermedad crónica. Requiere Alopurinol (oral) 2 veces al día. Analítica de control cada 6 meses.', '2026-03-01', 'Completado'
FROM animales 
WHERE nombre IN ('Mateo', 'Chocolate', 'Yuca', 'Beto', 'Bruji', 'Brio', 'Nala', 'Súper', 'Eme');

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
SELECT id_animal, 'Tratamiento', 'Tratamiento Ehrlichia/Anaplasma', 'Protocolo de antibióticos (Doxiciclina) para tratar enfermedad transmitida por garrapatas detectada en test.', '2026-03-10', 'Completado'
FROM animales 
WHERE nombre IN ('Maya', 'Lena', 'Fenix', 'Ara', 'Hugo', 'Zaira');

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
SELECT id_animal, 'Revisión', 'Seguimiento de Lesión Medular', 'Control de incontinencia urinaria y fecal derivada de traumatismo antiguo en columna. Requiere higiene constante.', '2026-02-15', 'Completado'
FROM animales WHERE nombre = 'Leo';

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
SELECT id_animal, 'Revisión', 'Seguimiento Ocular (Tuerto/a)', 'Control de cavidad ocular tras enucleación quirúrgica por traumatismo previo.', '2026-01-20', 'Completado'
FROM animales WHERE nombre IN ('Mauri', 'Nerea');

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
SELECT id_animal, 'Revisión', 'Evaluación Geriátrica Completa', 'Seguimiento de cataratas, demencia senil y artrosis. Requiere entorno adaptado y paseos cortos.', '2026-03-05', 'Completado'
FROM animales WHERE nombre IN ('Gitana', 'Bruce', 'Martin', 'Romina');

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
SELECT id_animal, 'Tratamiento', 'Terapia de Rehabilitación Etológica', 'Tratamiento por trauma severo, estereotipias (Barbie) o pánico humano (Brownie). Requiere pautas específicas de manejo.', '2026-02-28', 'Completado'
FROM animales WHERE nombre IN ('Brownie', 'Barbie', 'Valkiria', 'Punky', 'Mía', 'Galo', 'Sleepy', 'Manchitas');

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
SELECT id_animal, 'Revisión', 'Chequeo Post-Rescate Criadero', 'Evaluación de soplos cardíacos, salud dental y atrofia muscular por confinamiento prolongado.', '2026-03-15', 'Completado'
FROM animales WHERE nombre IN ('Nika', 'Harry', 'Lena');

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
SELECT id_animal, 'Revisión', 'Seguimiento Médico Periódico', 'Paciente catalogado con patología crónica. Control de constantes y estado general.', '2026-03-20', 'Completado'
FROM animales 
WHERE nombre IN ('Leia', 'Aria', 'Noel', 'Pipo', 'Manolo', 'Zafiro', 'Chendo') 
AND NOT EXISTS (SELECT 1 FROM salud_historial WHERE id_animal = animales.id_animal AND titulo = 'Seguimiento Médico Periódico');

INSERT INTO salud_historial (id_animal, evento, titulo, detalles, fecha_evento, estado)
SELECT id_animal, 'Vacuna', 'Protocolo Inicial Completo', 'Administración de vacunas (Polivalente/Triple Felina) y desparasitación interna.', '2026-03-25', 'Completado'
FROM animales 
WHERE nombre IN ('Zeta', 'Tintin', 'Claudio', 'Carla', 'Olaf', 'Kira', 'Maya', 'Alegria', 'Dulce');


UPDATE salud_historial SET id_usuario = (SELECT id_usuario FROM usuarios WHERE rol = 'vet' ORDER BY id_usuario ASC LIMIT 1) WHERE id_usuario IS NULL;

UPDATE animal_fotos SET ruta_foto = REPLACE(ruta_foto, 'fotos/', '') WHERE ruta_foto LIKE 'fotos/%';
UPDATE animales SET foto_portada = REPLACE(foto_portada, 'fotos/', '') WHERE foto_portada LIKE 'fotos/%';

INSERT INTO usuarios (nombre_completo, email, password, rol) VALUES 
('Carlos Martínez', 'carlos@ejemplo.com', 'pass123', 'colaborador'),
('Laura Gómez', 'laura@ejemplo.com', 'pass123', 'colaborador'),
('Javier Ruiz', 'javier@ejemplo.com', 'pass123', 'colaborador'),
('Ana Fernández', 'ana@ejemplo.com', 'pass123', 'colaborador'),
('David López', 'david@ejemplo.com', 'pass123', 'colaborador'),
('María Sánchez', 'maria@ejemplo.com', 'pass123', 'colaborador'),
('Pedro Jiménez', 'pedro@ejemplo.com', 'pass123', 'colaborador'),
('Usuario Prueba', 'prueba@ejemplo.com', 'pass123', 'colaborador');

INSERT INTO animales (nombre, especie, sexo, estado) VALUES 
('Kira', 'Perro', 'Hembra', 'Adoptado'),
('Toby', 'Perro', 'Macho', 'Adoptado'),
('Salem', 'Gato', 'Macho', 'Adoptado'),
('Bimba y Coco', 'Perro', 'Hembra', 'Adoptado'),
('Tambor', 'Exótico', 'Macho', 'Adoptado'),
('Rayo', 'Perro', 'Macho', 'Adoptado'),
('Bagheera', 'Gato', 'Hembra', 'Adoptado'),
('Firulais', 'Perro', 'Desconocido', 'Adoptado');

INSERT INTO historias_adopcion 
    (id_usuario, id_animal, titulo, contenido, imagen_url, estado, comentario_admin) 
VALUES 
    (1, 1, 
    'De la calle al sofá', 
    'Kira llegó a casa muy asustadiza. El proceso de adaptación fue lento; tuvimos que enseñarle que los humanos también pueden dar caricias. Hoy, tres meses después, por fin ha aprendido a jugar con la pelota.', 
    'historia_8_1778503083958.jpg', 
    'Aprobada', 
    'Historia destacada para nuestras redes sociales. ¡Gran trabajo de rehabilitación!'),

    (2, 2, 
    'Un torbellino de energía', 
    'Adoptar a este pequeño cachorro ha puesto nuestra rutina patas arriba, ¡pero en el buen sentido! Está en plena fase de morderlo todo, pero sus siestas en nuestro regazo lo compensan. Estamos yendo a un educador y va genial.', 
    'historia_9_1778503396879.jpg', 
    'Pendiente', 
    NULL),

    (3, 3, 
    'Paciencia, ronroneos y amor', 
    'Nos dijeron que Salem era un gato "invisible" del refugio porque siempre se escondía de las visitas. Decidimos darle la oportunidad. Tardó dos semanas en salir de debajo del mueble, pero hoy nos ha despertado con un concierto de ronroneos.', 
    'historia_10_1778503682373.JPG', 
    'Aprobada', 
    '¡Qué emocionante! Salem necesitaba exactamente una familia comprensiva como la vuestra.'),

    (4, 4, 
    'Mejor en pareja', 
    'No podíamos separar a estos dos hermanos. Sabíamos que adoptar dos perros de golpe era un reto, pero verlos jugar juntos y darse calor al dormir nos confirma que tomamos la decisión correcta. Son inseparables.', 
    'historia_11_1778503943227.jpg', 
    'Aprobada', 
    NULL),

    (5, 5, 
    'Saltos de alegría en el jardín', 
    'Nunca habíamos tenido un conejo antes, pero Tambor nos ha sorprendido por lo listo que es. Ya sabe usar su esquinero y le encanta dar carreras por el pasillo cuando le abrimos su parque. Es un glotón con las zanahorias.', 
    'historia_12_1778504205806.jpg', 
    'Pendiente', 
    NULL),

    (6, 6, 
    'La vida después de las carreras', 
    'Adoptar a un galgo rescatado es conocer lo que es la nobleza pura. Al principio no sabía lo que era subir unas escaleras ni pasear por la ciudad, pero confía ciegamente en nosotros. Ahora su pasatiempo favorito es dormir 18 horas al día en el sofá.', 
    'historia_13_1778507133447.jpg', 
    'Aprobada', 
    'Los galgos son mágicos. Nos alegra saber que por fin conoce lo que es una cama de verdad.'),

    (7, 7, 
    'Mi pequeña pantera', 
    'Adopté a este gato negro porque me enteré de que son los menos adoptados por culpa de supersticiones absurdas. Es el animal más charlatán y cariñoso que he conocido. Me sigue a todas partes por la casa como si fuera un perrito.', 
    'historia_16_1778569588927.JPG', 
    'Aprobada', 
    '¡Totalmente cierto! Rompiendo mitos gracias a familias como la tuya.'),

    (8, 8, 
    'Prueba de adopción (Rechazar esta historia)', 
    'Esta es una historia de prueba para ver si funciona el sistema. El perrito es muy bonito y bla bla bla. Insertando texto de relleno para probar el límite de caracteres del formulario de la web.', 
    'historia_23_1778569565552.JPG', 
    'Rechazada', 
    'Se rechaza esta publicación por contener texto de prueba y no ser una historia real.');