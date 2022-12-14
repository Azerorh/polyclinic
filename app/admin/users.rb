ActiveAdmin.register User do
  permit_params :avatar, :name, :surname, :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column "avatar" do |user|
      cl_image_tag(user.avatar.key, height: 50, crop: :scale, :radius => 25)
    end
    column :fullname
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :avatar, as: :file
      f.input :name
      f.input :surname
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
