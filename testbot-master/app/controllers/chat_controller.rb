class ChatController < ApplicationController
  def index
  end

  def new
  end
  
  def view
  end
   
  def create
    
    Chat.create(is_man: true, content: params[:content])
    dic = Dictionary.where(ask: params[:content]).sample
    
      if dic.nil?
        Chat.create(is_man: false,content: "이 대화를 이해하지못했습니다 학습에도움을주세요")
        redirect_to "/chat/index"
        # "/chat/new?ask=#{URI.encode(params[:content])}"
      else
        
      Chat.create(is_man: false,content: dic.answer)
      redirect_to '/chat/index'
      end
    
  end
  
   def learn
    Dictionary.create(ask: params[:ask], answer: params[:answer])
    
    redirect_to '/chat/index'
  
   end
  
  def destroy
    Chat.destroy_all()
    redirect_to '/chat/index'
  end
  
end
