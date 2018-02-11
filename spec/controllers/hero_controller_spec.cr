require "./spec_helper"

def hero_hash
  {"name" => "Fake", "favorite" => "true"}
end

def hero_params
  params = [] of String
  params << "name=#{hero_hash["name"]}"
  params << "favorite=#{hero_hash["favorite"]}"
  params.join("&")
end

def create_hero
  model = Hero.new(hero_hash)
  model.save
  model
end

class HeroControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe HeroControllerTest do
  subject = HeroControllerTest.new

  it "renders hero index template" do
    Hero.clear
    response = subject.get "/heroes"

    response.status_code.should eq(200)
    response.body.should contain("Heroes")
  end

  it "renders hero show template" do
    Hero.clear
    model = create_hero
    location = "/heroes/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Hero")
  end

  it "renders hero new template" do
    Hero.clear
    location = "/heroes/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Hero")
  end

  it "renders hero edit template" do
    Hero.clear
    model = create_hero
    location = "/heroes/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Hero")
  end

  it "creates a hero" do
    Hero.clear
    response = subject.post "/heroes", body: hero_params

    response.headers["Location"].should eq "/heroes"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a hero" do
    Hero.clear
    model = create_hero
    response = subject.patch "/heroes/#{model.id}", body: hero_params

    response.headers["Location"].should eq "/heroes"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a hero" do
    Hero.clear
    model = create_hero
    response = subject.delete "/heroes/#{model.id}"

    response.headers["Location"].should eq "/heroes"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
