# Populating rooms
room_types = [
    {name: 'Private room'},
    {name: 'Entire home/apt'},
    {name: 'Shared room'}
]
existing_room_types = RoomType.pluck(:name)
RoomType.create(room_types.select {|r| !r[:name].in?(existing_room_types) })

# Populating Neighbourhood Groups
neighbourhood_groups = [
    {name: 'Brooklyn'},
    {name: 'Manhattan'},
    {name: 'Bronx'},
    {name: 'Queens'},
    {name: 'Staten Island'}
]
existing_neighbourhood_groups = NeighbourhoodGroup.pluck(:name)
NeighbourhoodGroup.create(
    neighbourhood_groups.
        select {|r| !r[:name].in?(existing_neighbourhood_groups) }
)






