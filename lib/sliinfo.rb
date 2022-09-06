# frozen_string_literal: true

class Slo
  attr_reader :value

  def initialize(value)
    @value = value
  end
end

class Sli
  attr_reader :service, :usage, :errors, :slo

  def initialize(service, usage, errors, slo)
    @service = service
    @usage = usage.to_f
    @errors = errors.to_f
    @slo = slo
  end

  def error_rate
    errors / usage
  end

  def value
    1 - error_rate
  end

  def value_pct
    format('%7.3f %%', value * 100)
  end

  def within_range?
    value < slo.value
  end

  def error_budget_usage
    if errors == usage
      1.0 / 0
    else
      error_rate / (1 - slo.value)
    end
  end

  def error_budget_usage_pct
    format('%9.3f %%', error_budget_usage * 100)
  end
end
