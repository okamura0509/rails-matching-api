class Request < ApplicationRecord
    belongs_to :requester_user, class_name: "User", foreign_key: :requester_id
    belongs_to :worker_user, class_name: "User", foreign_key: :worker_id
end
