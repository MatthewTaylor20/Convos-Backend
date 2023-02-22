class ChangeImageUrlDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:groups, :image_url, "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png")
  end
end
