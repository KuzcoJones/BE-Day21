class UserSerializer 



 def initialize(user_object)
  @user = user_object

 end

 def to_serialized_json
  @user.to_json(
   :include => {
    :daily => {:only => [:id, :completed, :title]},
    :habits => {:only => [:id, :title, :difficulty, :note, :type], :include => {:tags => {:only => [:id, :title]}}
    }
   }, :except => [:password_digest, :pin, :updated_at, :created_at]
  )

 end


end