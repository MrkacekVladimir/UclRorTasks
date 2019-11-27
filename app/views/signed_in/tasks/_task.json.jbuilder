json.extract! task, :id, :title, :color, :deadline_at, :note, :is_done, :user_id, :category_id, :created_at, :updated_at
json.url task_url(task, format: :json)
