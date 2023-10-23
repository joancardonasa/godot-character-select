class_name CharacterSelect extends Node

@onready var no_character_selected_label: Label = %NoCharacterSelectedLabel

@onready var character_profile_info: Control = %CharacterProfileInfo
@onready var character_portrait: TextureRect = %CharacterPortrait
@onready var hp_label: Label = %HPLabel
@onready var name_label: Label = %NameLabel

@onready var character_buttons: Array = %ButtonGridContainer.get_children()

func _ready():
    Events.selected_character.connect(_on_events_selected_character)

    var button_group: ButtonGroup = ButtonGroup.new()

    for char_button in character_buttons:
        char_button.button_group = button_group

    no_character_selected_label.visible = true
    character_profile_info.visible = false
    

func _on_events_selected_character(character_profile: CharacterProfile):
    if !character_profile:
        return

    no_character_selected_label.visible = false

    name_label.text = character_profile.character_name
    hp_label.text = "HP: " + str(character_profile.character_hp)
    character_portrait.texture = character_profile.character_portrait

    character_profile_info.visible = true
