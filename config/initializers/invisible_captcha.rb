# frozen_string_literal: true

InvisibleCaptcha.setup do |config|
  config.honeypots << %w(user_spatial_address user_address_combo participant_user_address participant_user_address
                         user_address_number user_second_online_address user_phone_with_extension participant_code_number)
  config.visual_honeypots = false
  config.timestamp_threshold = 10
  config.timestamp_enabled = false
  config.injectable_styles = true
  # Leave these unset if you want to use I18n (see below)
  # config.sentence_for_humans     = 'If you are a human, ignore this field'
  # config.timestamp_error_message = 'Sorry, that was too quick! Please resubmit.'
end
