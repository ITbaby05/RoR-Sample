module UsersHelper
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    if size != 50
      image_tag(gravatar_url, alt: user.name, class: "gravatar", style: "width: " + size.to_s() + "px")
    else
      image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end

  end
end
