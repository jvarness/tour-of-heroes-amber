require "./spec_helper"
require "../../src/models/hero.cr"

describe Hero do
  Spec.before_each do
    Hero.clear
  end
end
