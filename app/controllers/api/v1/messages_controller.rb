class Api::V1::MessagesController < ApplicationController
    def create
        message = Message.new(message_paramas)

        if messages.save
            render json: { status:200 , message: message }
        else
            render json: { status: 500, message: "メッセージの送信に失敗しました。"}
        end
    end

    private

        def message_paramas
            params.permit(:chat_room_id , :user_id , :content)
        end
end
