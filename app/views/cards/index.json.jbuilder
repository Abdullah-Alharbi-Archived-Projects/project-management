json.array! @cards do |card|
    json.id card.id
    json.title card.title
    json.tasks card.tasks
end
