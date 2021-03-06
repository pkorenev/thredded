require 'support/features/page_object/base'

module PageObject
  class NotificationPreferences < Base
    attr_accessor :user, :messageboard

    def initialize(user, messageboard = create(:messageboard))
      @user = user
      @messageboard = messageboard
    end

    def visit_notification_edit
      signs_in_as(user.to_s)
      visit edit_messageboard_preferences_path(messageboard)
    end

    def disable_at_notifications
      uncheck '@ Notifications'
      click_button 'Update Preferences'
    end

    def updated?
      has_content? 'Your preferences are updated'
    end

    def has_at_mention_notifications?
      has_checked_field? 'notification_preference_notify_on_mention'
    end

    def disable_private_topic_notifications
      uncheck 'Private Topic Notification'
      click_button 'Update Preferences'
    end

    def has_private_topic_notifications?
      has_checked_field? 'notification_preference_notify_on_message'
    end
  end
end
