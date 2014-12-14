require "simple_debug/version"
require "active_record/log_subscriber"

module SimpleDebug
  ::ActiveRecord::LogSubscriber.class_exec do

    IGNORE_PAYLOAD_NAMES = ["SCHEMA", "EXPLAIN"]
    # Embed in a String to clear all previous ANSI sequences.
    CLEAR   = "\e[0m"
    BOLD    = "\e[1m"

    # background Colors
    # http://nyquist.eu/linux-terminal-colors/
    BRED        = "\033[22;41m"

    alias_method :highlight_sql, :sql

    def sql(event)
      self.class.runtime += event.duration
      return unless logger.debug?

      payload = event.payload

      return if IGNORE_PAYLOAD_NAMES.include?(payload[:name])

      name  = "#{payload[:name]} (#{event.duration.round(1)}ms)"
      sql   = payload[:sql]
      binds = nil

      unless sql =~ /^((INSERT)|(UPDATE)|(DELETE))/
        highlight_sql(event)
        return
      end
      debug "  #{BOLD}#{BRED}#{name}  #{sql}#{binds}#{CLEAR}"
    end
  end
end