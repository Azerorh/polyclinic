ActiveAdmin.register Case do

  permit_params :question, :answer, :doctor_id, :user_id, :status

  index do
    selectable_column
    id_column
    column :question
    column :answer
    column :doctor
    column :user
    column :status
    actions
  end

  filter :question
  filter :answer
  filter :doctor
  filter :user
  filter :status
  filter :created_at

  form do |f|
    f.inputs do
      f.input :question
      f.input :answer
      f.input :doctor_id, as: :select, collection: Doctor.all.collect {|doctor| [doctor.phone_number, doctor.id] }
      f.input :user_id, as: :select, collection: User.all.collect {|user| [user.phone_number, user.id] }
      f.input :status
    end
    f.actions
  end
  
end
