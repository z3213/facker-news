json.array!(@submits) do |submit|
  json.extract! submit, :id, :title, :content, :score, :num_comments, :author, :url
  json.url submit_url(submit, format: :json)
end
