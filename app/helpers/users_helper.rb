module UsersHelper
  def gravatar_for(user, size: 50)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    # size = options[:size]
    gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    # 有的邮箱才有图片
    image_tag(gravatar_url, alt: user.name, class:"gravatar")
  end
end
