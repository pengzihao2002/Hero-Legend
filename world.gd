extends Node2D


@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@onready var camera_2d: Camera2D = $Player/Camera2D



func _ready() -> void:
    var used := tile_map_layer.get_used_rect()    # 获取包围地图的矩形
    var tile_size := tile_map_layer.tile_set.tile_size    # 最小的单元格大小

    camera_2d.limit_top = used.position.y * tile_size.y
    camera_2d.limit_bottom = used.end.y * tile_size.y
    camera_2d.limit_left = used.position.x * tile_size.x
    camera_2d.limit_right = used.end.x * tile_size.x
    
    camera_2d.reset_smoothing()    # 初始化后重置平滑（适用于相机超过边界的情景）
