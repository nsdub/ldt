json.array!(@ideas) do |idea|
  json.extract! idea, :id, :creator_id, :title, :video_url
  json.url idea_url(idea, format: :json)
end
