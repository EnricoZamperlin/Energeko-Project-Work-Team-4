extends Node

# Posizione giocatore
var posizione = Vector2(40, -16)

# Texture mouse
var mouse = load("res://Global/img/Mano.png")
var mouse_iter = load("res://Global/img/Mano_Iterazione.png")
var mouse_iter2 = load("res://Global/img/Mano_Iterazione2.png")

# Tutorial
var tutorial = true

# Livello completato
var level1 = false
var level2 = false
var level3 = false

# Uso l'oggetto selezionato
#LVL2
var chiave_inglese = 0
var secchio = 0
#LVL3
var chiave = 0
var casco = 0
var sellino = 0

# variabili LVL2
var pieno = 0
var pianta = 0
var rottura = 0
# variabili LVL2
var auto = 0
