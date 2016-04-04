require_relative "../superhero"

describe Superhero do
  let(:hero) { Superhero.new(hero_data) }
  let(:hero_data) do
    { :name         => "Batwoman",
      :alter_ego    => "Katherine Kane",
      :intelligence => 93,
      :strength     => 62,
      :speed        => 78,
      :durability   => 75,
      :power        => 75,
      :combat       => 93 }
  end

  it "has a name" do
    expect(hero.name).to eq "Batwoman"
  end

  it "has an alter ego" do
    expect(hero.alter_ego).to eq "Katherine Kane"
  end

  it "has an intelligence rating" do
    expect(hero.intelligence).to eq 93
  end

  it "has a strength rating" do
    expect(hero.strength).to eq 62
  end

  it "has a speed rating" do
    expect(hero.speed).to eq 78
  end

  it "has a durability rating" do
    expect(hero.durability).to eq 75
  end

  it "has a power rating" do
    expect(hero.power).to eq 75
  end

  it "has a combat rating" do
    expect(hero.combat).to eq 93
  end

  describe "having a sidekick" do
    let(:bat_girl) { double("sidekick", :superhero= => nil) }

    context "when the hero does not already have a sidekick" do
      it "can be given a sidekick" do
        expect { hero.sidekick = bat_girl }.to change { hero.sidekick }.to(bat_girl)
      end

      it "tells the sidekick that it is now the sidekick's superhero" do
        expect(bat_girl).to receive(:superhero=).with(hero)
        hero.sidekick = bat_girl
      end
    end

    context "when the hero already has a sidekick" do
      let(:old_sidekick) { double("sidekick", :superhero= => nil) }

      before(:each) do
        hero.sidekick = old_sidekick
      end

      it "can be given a new sidekick" do
        expect { hero.sidekick = bat_girl }.to change { hero.sidekick }.to(bat_girl)
      end

      it "tells the old sidekick that it is no longer the sidekick's superhero" do
        expect(old_sidekick).to receive(:superhero=).with(nil)
        hero.sidekick = bat_girl
      end

      it "tells the new sidekick that it is now the sidekick's superhero" do
        expect(bat_girl).to receive(:superhero=).with(hero)
        hero.sidekick = bat_girl
      end

      context "when the new sidekick is the old sidekick" do
        it "does not change the sidekick" do
          expect { hero.sidekick = old_sidekick }.to_not change { hero.sidekick }
        end

        it "does not tell the old sidekick that it is its superhero" do
          expect(old_sidekick).to_not receive(:superhero=)
          hero.sidekick = old_sidekick
        end
      end
    end
  end
end
