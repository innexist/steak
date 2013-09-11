class Post < ActiveRecord::Base

	 has_attached_file :image,
                    styles: { basic: "300x300#"},
                    default_url: "/assets/missing/picture_:style.png"
end
