room_types = [
    {name: 'Private room'},
    {name: 'Entire home/apt'},
    {name: 'Shared room'}
]
existing_room_types = RoomType.pluck(:name)
RoomType.create(room_types.select {|r| !r[:name].in?(existing_room_types) })

