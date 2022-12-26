class Api::V1::RequestsController < ApplicationController
    def index
        requests=[]
        # 本人のリクエスト一覧取得
        current_api_v1_user.requests.each do |request|
            chat_rooms << {
                request: request,
                requester: Request.requester_user
            }
        end
        render json: { status:200 , requests: requests }
    end

    def create
        messages = Message.new(message_paramas)

        if messages.save
            render json: { status:200 , messages: messages }
        else
            render json: { status: 500, message: "メッセージの送信に失敗しました。"}
        end
    end

    private

    def request_paramas
        params.permit(:requester_id , :worker_id , :title , :body)
    end

end
