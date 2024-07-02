// Codigo utilizado para probar los leds de manera aleatoria

// las columnas presentan las conexiones de los anados van conectados en columna

int Columnas[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
 // los catodos entre si estan conectados por fila

int Filas[] = {12, 11, 10};
int RandFila;     //Variable para fila aleatoria
int RandColumna;  //Variable para columna aleatoria

void setup()
{
  int contador;

  for (int contador = 1; contador < 10; contador++){
    pinMode(Columnas[contador], OUTPUT); }

  for (int contador = 1; contador < 4; contador++){
    pinMode(Filas[contador], OUTPUT); }
}

void loop()
{
  RandLed();
}

void RandLed()
{
  RandFila = random(0,3);
  RandColumna = random(0,9);

  digitalWrite(Filas[RandFila], HIGH);
  digitalWrite(Columnas[RandColumna], HIGH);

  delay(75);

  digitalWrite(Filas[RandFila], LOW);
  digitalWrite(Columnas[RandColumna], LOW);

  delay(50);
}
