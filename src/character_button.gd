extends Button
class_name CharacterButton

@export var character_profile: CharacterProfile

@onready var character_icon: TextureRect = $CharacterIcon


func _ready():
    if !character_profile:
        disabled = true
        character_icon.self_modulate = Color("d6d5c5")
        return
    self.toggled.connect(_on_toggle)

    character_icon.self_modulate = Color.WHITE
    character_icon.texture = character_profile.character_portrait


func _on_toggle(pressed: bool):
    if pressed:
        Events.selected_character.emit(character_profile)
