json.array!(@videos) do |video|
  json.extract! video, :id, :name, :link_url
  json.url video_url(video, format: :json)
end
