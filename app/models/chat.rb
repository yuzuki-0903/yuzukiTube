class Chat < ApplicationRecord
  belongs_to :video
  belongs_to :user
  after_create_commit { MessageBroadcastJob.perform_later self }
end
