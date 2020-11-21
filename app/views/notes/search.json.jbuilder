json.array! @notes do |note|
  json.id note.id
  json.text note.text
  json.image note.image
  json.user_id note.user_id
  json.nickname note.user.nickname
  json.user_sign_in current_user
end