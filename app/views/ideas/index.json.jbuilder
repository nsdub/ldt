json.array!(@ideas) do |idea|
  json.extract! idea, :id, :creator_id, :video_url, :created_at
  json.url idea_url(idea, format: :json)
end
