json.array!(@comments) do |comment|
  json.extract! comment, :content, :commentable_id, :commentable_type
  json.url comment_url(comment, format: :json)
end
