module ApplicationHelper
  def is_doctor?
    current_doctor.present?
  end

  def destroy_session_link
    is_doctor? ? destroy_doctor_session_path : destroy_user_session_path
  end

end
