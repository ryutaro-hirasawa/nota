crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user)
  parent :root
end

crumb :edit_user do
  link "ユーザー編集", edit_user_path(current_user)
  parent :mypage
end

crumb :new_note do
  link "新規投稿", new_note_path
  parent :root
end

crumb :note do
  link "ノート詳細", note_path(notes_url)
  parent :root
end

crumb :edit_note do
  link "ノート編集", edit_note_path(notes_url)
  parent :note
end

crumb :search_note do
  link "ノート検索", search_notes_path
  parent :root
end

crumb :user_session do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :new_user do
  link "新規登録", new_user_registration_path
  parent :root
end
