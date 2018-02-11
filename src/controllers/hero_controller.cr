class HeroController < ApplicationController
  def index
    heroes = Hero.all
    render("index.slang")
  end

  def show
    if hero = Hero.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Hero with ID #{params["id"]} Not Found"
      redirect_to "/heroes"
    end
  end

  def new
    hero = Hero.new
    render("new.slang")
  end

  def create
    hero = Hero.new(hero_params.validate!)

    if hero.valid? && hero.save
      flash["success"] = "Created Hero successfully."
      redirect_to "/heroes"
    else
      flash["danger"] = "Could not create Hero!"
      render("new.slang")
    end
  end

  def edit
    if hero = Hero.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Hero with ID #{params["id"]} Not Found"
      redirect_to "/heroes"
    end
  end

  def update
    if hero = Hero.find(params["id"])
      hero.set_attributes(hero_params.validate!)
      if hero.valid? && hero.save
        flash["success"] = "Updated Hero successfully."
        redirect_to "/heroes"
      else
        flash["danger"] = "Could not update Hero!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Hero with ID #{params["id"]} Not Found"
      redirect_to "/heroes"
    end
  end

  def destroy
    if hero = Hero.find params["id"]
      hero.destroy
    else
      flash["warning"] = "Hero with ID #{params["id"]} Not Found"
    end
    redirect_to "/heroes"
  end

  def hero_params
    params.validation do
      required(:name) { |f| !f.nil? }
      required(:favorite) { |f| !f.nil? }
    end
  end
end
