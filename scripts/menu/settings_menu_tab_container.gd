extends TabContainer

func _ready():
	# Устанавливаем переводимые названия для каждой вкладки
	set_tab_title(0, tr("KEY_GAME"))  # tr() используется для перевода
	set_tab_title(1, tr("KEY_AUDIO"))
