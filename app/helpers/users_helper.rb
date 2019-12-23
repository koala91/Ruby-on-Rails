module UsersHelper
  # 返回指定用户的avatar
  def gravatar_for(user, size: 50)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    # size = options[:size]
    gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    # 有的邮箱才有图片
    image_tag(gravatar_url, alt: user.name, class:"gravatar")
  end

  # 登入指定的用户
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # 在持久会话中记住用户
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  # 如果是当前用户返回true
  def current_user?(user)
    user == current_user
  end
  
  # 返回ccokie中记忆令牌对应的用户
  # def current_user
    
  # end
  
end
