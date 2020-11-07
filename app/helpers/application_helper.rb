module ApplicationHelper

    def user_avatar(user, size=40)
        if user.image?
            user.image
        elsif user.avatar.attached?
            user.avatar.variant(resize: "#{size}x#{size}!")
        else
            gravatar_image_url(user.email, size: size)
        end
    end

    def latest_post
        Post.all.last
    end
end

