class HelloController < ApplicationController
  getter name = "Jake" 
  def index
    render("index.slang")
  end
end